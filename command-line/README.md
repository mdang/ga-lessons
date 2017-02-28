# CLI & Computer Basics

### Learning Objectives

* Describe what the Terminal is and how we can use it to interface with an operating system
* Compare and contrast the use cases of a CLI vs. a GUI
* Explain the difference between relative vs. absolute paths
* Explain what command options are and how to use them
* Use the most common commands to navigate and modify files / directories via the Terminal window (`cd`, `pwd`, `mkdir`, `rm -r`, `mv`, `cp`, `touch`)
  * Use the 'pwd' command to see the path of the current directory
  * Use the 'ls' command  to list the contents in the current directory (including hidden files)
  * Use the 'man' command to look up documentation for other commands
  * Create new files and directories using 'touch' and 'mkdir'
  * Change directories using 'cd'
  * Copy, move and delete files and directories using 'cp', 'mv', and 'rm'
* Use directory shortcuts '.', '..', '~' to navigate the filesystem using relative paths
* Create a bash alias
* Explain the roles of .bash_profile, .bash_login
* Open files and directories in Sublime from the command line
* Minimize typing by using tab completion to autocomplete file and folder names

### What is the terminal?

The Terminal is a program included with all versions of Mac OS X and Linux. It manages the input/output for command line programs. When launched, it provides a command line interface (Unix shell) to control the underpinnings of the UNIX based operating system. You use the terminal to access the Unix shell. 

Most developers are reluctant to use the command line at first and only do it because they have to but learn to love it quickly (relatively speaking).

### What is a shell? 

A shell is simply a type of command line program, which contains a very simple, text-based user interface enabling us to access all of an operating system's services. It is, very simply, a program that accepts text as input and translates that text into the appropriate functions that you want your computer to run.

Bash (Bourne Again SHell) is a Unix shell and command language, it's the default shell on Linux and OS X. It's the primary interface users see when they log in.

> Bash was written as a free software replacement to the Bourne shell (sh)

*Taken from Just for fun: [Type like a hacker](http://hackertyper.com/)*

### Some reasons for using the CLI

* There are things that can't be accomplished with a GUI, mainly because nobody bothered to write a GUI for that command or functionality
* Automation. You can write scripts that perform any series of actions and have complete control over what happens. You can't do this with a GUI, GUI's are always changing
* You can perform tasks by remote login even with a slow connection
* Because Unix was written from the terminal up, most everything can be configured through the command line
* You can write documentation and assist people easier, instead of taking and sending screenshots you can walk through what commands to use
* It's much quicker to type in commands then to go through endless menu options to find what you're looking for

### We Do

Go over the couple of options for opening Terminal
* Spotlight - ``` CMD + Spacebar ```
* Application -> Utilities -> Terminal

> Create a shortcut to the terminal so it's easy to access going forward.

## Paths  

Every file or folder in a file system can be read, written, and deleted by referencing its position inside the filesystem. When we talk about the position of a file or a folder in a file system, we refer to its "path". There are a couple of different kinds of paths we can use to refer to a file – **absolute paths** and **relative paths**.

*Directory* is an important term that's used interchangeably with *folder*. Though they are not exactly the same thing, when we say "navigate to your project directory" think of this as "navigate to your project folder".  Here's a little more information:

_Strictly speaking, there is a difference between a directory which is a file system concept, and the graphical user interface metaphor that is used to represent it (a folder)...If one is referring to a container of documents, the term folder is more appropriate. The term directory refers to the way a structured list of document files and folders is stored on the computer. It is comparable to a telephone directory that contains lists of names, numbers and addresses and does not contain the actual documents themselves._

*Taken from [Close-To-Open Cache Consistency in the Linux NFS Client](http://www.citi.umich.edu/projects/nfs-perf/results/cel/dnlc.html)*

#### What is an absolute path?

An absolute path is defined as the specific location of a file or folder from the root directory, typically shown as `/`. The root directory is the starting point from which all other folders are defined and is not normally the same as your **Home** directory, which is normally found at `/Users/[Your Username]`.

#### Working with unix commands and file paths

Typing `cd` - a command for "change directory" with no parameters takes us to our home directory.

```bash
cd
```

If we type in `pwd` - a command for "print working directory" from that folder, we can see where we are in relation to the root directory.

Some examples of absolute path:

```bash
/usr/local/bin/git
/etc/example.ext
/var/data/database.db
```

Notice, all these paths started from `/` directory which is a root directory for every Linux/Unix machines.

#### What is a relative path?

A relative path is a reference to a file or folder **relative** to the current position, or the present working directory(pwd). If we are in the folder `/a/b/` and we want to open the file that has the absolute path `/a/b/c/file.txt`, we can just type:

```bash
open c/file.txt
```

or

```bash
open ./c/file.txt
```

At any time, we can also use the absolute path, by adding a slash to the beginning of the path. The absolute path is the same for a file or a folder regardless of the current working directory, but relative paths are different, depending on what directory we are in.  Directory structures are laid out like `directory/subdirectory/subsubdirectory`.

Below are some examples of using relative and absolute path for the same action:

1. My present location is `/wdi/lessons` and now I want to change directory to `/wdi`.

  * Using relative path: `cd ..`
  * Using absolute path: `cd /wdi`

2. My present location is `/wdi/lessons` and I want to change the location to `/wdi/labs`

  * Using relative path: `cd ../labs`
  * Using absolute path: `cd /wdi/labs`

### Commands 

``` pwd ```

``` cd ```

* Discuss absolute and relative links
* Use directory shortcuts '.', '..', '~' to navigate the filesystem
* Use tab completion for navigating faster
* Use ``` CTRL + a ``` to move to the beginning of the line
* Use ``` CTRL + e ``` to move to the end of the line
* Use ``` OPTION <- ``` or ``` ESC, b ``` to move back one word
* Use ``` OPTION -> ``` ``` ESC, f ``` to move forward one word 
* From Finder, drop a folder into the terminal and the path to that file will populate on the command line

``` ls ```

  - Explain command options and how you can use them 
  - ``` ls -al ```

``` mkdir ```

* Although not required, keep all folders and file names in lowercase, no spaces
* Compare and contrast *nix file names vs Windows, and case sensitivity

``` touch ```

* Use ``` open ``` to access the file as you would by double clicking it

``` man ```

``` cp ```
  - ``` cp index.html index.bak ```

``` mv ```
  - Used to move or rename files
  - ``` mv myfile.txt destination-directory ```

``` rm ```
  - Recursive option ``` -r ```
  - https://www.reddit.com/r/webdev/comments/5rd79m/gitlab_employee_just_ran_rm_rf_on_their/

``` subl / atom ```

``` nano / vim ```

## Class Exercise

**20 min**

https://gist.github.com/mdang/7b025b4188aea93dbde2

<hr>

## Customizing your Environment

When a user logs in to the terminal the shell checks `.bash_profile` for environment specific variables and startup programs to run.

Order that the shell checks to find additional settings. Once one is found it stops looking beyond that. 

1. .bash_profile 
2. .bash_login
3. .profile

``` source ```

``` reload ```

### Bash Alias 

Aliases allow us to create shortcuts without having to type longer commands and options everytime 

``` alias alias_name="command_to_run" ```

``` unalias alias_name ```

> The alias set is only active for the current session. Once the terminal is closed the alias is forgotten unless it's set again in .bash_profile 

## Class Exercise

**15 min**

https://gist.github.com/mdang/75673af53ecdd168052ef2a064cb9e21

<hr>

## Additional Commands 

* ``` grep ```

 * ``` grep foo /etc/passwd ```

* ``` sudo ```

Sudo is a program for Unix-like computer operating systems that allows users to run programs with the security privileges of another user, by default the superuser. Sudo stands for "superuser do".

### Symlinks

A symlink (symbolic link) is a special file containing a path to another file. This path can be absolute or relative. symlinks can work across file systems, and can even point to different files, if you for example unplug an external hard drive and replace it with another one, which has a different file at the same path. A symlink can point to either files or directories.

``` ln -s source_file myfile ```

### Environment variables

``` export ```

``` export FOO="bar" ```

``` echo "$FOO" ```

## Class Exercise 

**20 min**

https://gist.github.com/mdang/680f9a82378220ee54cee1fe80f0361c
