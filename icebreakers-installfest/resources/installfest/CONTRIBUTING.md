### Directory and script structure

The scripts are written in Bash, and are meant to be run in a `bash` shell on a Unix-derived system. Such environments include both the default Terminal and iTerm in Mac OS X, and the Terminal and shell in Ubuntu Linux.

Every script has a manifest file in the root of the repo (`Manifest.scriptname`), and then a requisite Installfest script named simply `scriptname`, for example: `Manifest.mac` and `mac`. The manifest file is a list of the component shell scripts that comprise the full Installfest script. Running the default `rake` task in the repo assembles each of the Installfest scripts dynamically from the contents of each component script named therein.

The individual components of the InstallFest script are stored in `scripts` and `tests`, and the Rake tasks (stored in the `Rakefile`) call Ruby scripts stored in `bin`.

**A pre-commit hook can be added to your repo** that automatically runs `rake` and adds the newly assembled Installfest script with your changes from the Manifests (and the `scripts/set_script_branch.sh` file, which sets an environment variable with the current git branch's name) to your commit. To add that hook, run the command below from the repo's root.

```bash
# will not overwrite an existing pre-commit hook...
if [[ ! -a .git/hooks/pre-commit ]]; then
  cat << EOF > .git/hooks/pre-commit
#!/usr/bin/env bash

rake
git add scripts/set_script_branch.sh
ls  Manifest* | sed -e 's/Manifest\.//g' | xargs git add
EOF
fi
```

Tests that can be run as part of a script, or helper functions to run such tests, are stored in the `tests` folder. All other components are stored in the `scripts` folder.

Commentary beyond code explanation (simple comments) is stored in `scripts/commentary`. System-independent components are stored in the base of `scripts`, and system-dependent components are stored in `scripts/systemname` (eg: `scripts/mac` and `scripts/ubuntu`). Settings (separate from installations, mostly for applications) and dotfiles are stored in `scripts/settings`.

```bash
.
├── Rakefile     #=> the rake task used to assemble or
├── bin          #   'build' a script from a manifest
│   └── build.rb #=> the build executable itself
├── scripts
│   ├── commentary
│   │   ├── #=> messages for the user
|   |   ...
│   ├── mac
│   │   ├── #=> mac-only components
|   |   ...
│   ├── ubuntu
│   |   ├── #=> ubuntu-only components
|   |   ...
│   └── settings
│       ├── dotfiles
│       │   ├── #=> dotfiles!
|       |   ...
|       ├── #=> other application settings,
|       |   #   possibly in directories for each application
|       ...
├── tests
│   ├── #=> testing (or other meta-) components
|   ...
├── Manifest.mac    #=> the list of components above
├── mac             #=> the script assembled from the manifest
├── Manifest.ubuntu
├── ubuntu
...
└── readme.md
```

### Naming

Files: Noun first, then verb. TODO (PJ) update this...

Vars: local whenever possible, use long names to avoid collisions, check
the builds with find, all caps with underscores.

### Linting

Run the bash linter (not available yet...)

### Testing and logging

The script downloads from [https//raw.githubusercontent.com](). Be aware: **it caches resources for one minute**, so you may not see your changes to the script immediately.

*Use a separate branch (or fork) from __master__ and __development__ for testing and working on features or new components*, of course. Users are pulling directly from **master** for builds.

Components exist to log the output of the scripts. Since the output is massive, they are set by default to log only:

- output sent to `STDERR`
- comments printed with the command `echo_log` or `echo >&2`
- output created by functions that use `echo_log`, such as those stored in the `tests/add_assert_functions.sh` component

Components also exist to share the log file via email. This will be helpful for knowing the status of students' installs done off-site.

It is recommended to add assertions that check the status of every component that installs or updates the target system, if for no other reason than to ensure that there is a log record of the changes made by the script.

### Creating new scripts

While adding components to the script library is always useful, as well as making updates to existing components to reflect changes in standard installations or bugfixes, it is important to test any changes made in a component that is included in existing manifests at the script level and the component level. What that means is, run every effected script when you make a change to a component to check for regression errors, please.

In order to minimize regression issues, please add new or special functionality to new components. Place the component in the right directory (system-specific, system-independent, user settings, tests, etc.), and create a new manifest.

The suggested structure for a component is:

```bash
                           #=> begin with a blank line! (be nice)
# this component will blow
# your minds so just get   #=> explain what component does
# ready for the madness

SCPTVAR=${SCPTVAR:-deflt}  #=> be sure any env vars declared
                           #   in another component are set
                           #   to defaults (be safe)
SCPTVARTWO="`pwd`/newdir"  #=> set any vars local to this
SCPTF="${SCTPVARTWO}/"+ \  #   component... use ALL CAPS!
      "${SCPTVAR}"         #   (ie, be consistent)
CNTNTS="put in the file!"

mkdir -p SCPTVARTWO        #=> perform the action
echo $CNTNTS > $SCPTFILE

#=> finally, assert that the script worked
assert_that "File was created" "cat $SCPTFILE" "$CNTNTS"
#=> assert_that checks that the second param can be eval'ed
#   without an error, and that any optional thrid param is
#   equivalent to the output from eval'ing the second param
```

... and the suggested structure for a manifest is:

```bash
#=> begin the script, handle options and set up logging
shebang
handle_options_and_start_logging
tests/add_assert_functions

#=> handle any options and/or set env vars for components
...

#=> explanation and/or directions for script
commentary/...

#=> if necessary (using sudo in components below)
capture_password

#=> insert your components here
...

```
