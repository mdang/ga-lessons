# WDI InstallFest Script

This repo holds the scripts used in the installation, setup, and creation of "dotfiles" (ie, application settings) for the development environments of students in General Assembly's Web Development Immersive program.

[You can head here to find out what is installed, and what the hardware specifications are for the program.][specs]

## How do I run an Installfest Script?

The script comes in three basic flavors: the default full install for Mac OS, the default full install for Ubuntu Linux, and smaller scripts that ensure a current and standardized install of Ruby is being used.

**Warning**: in their default form, these scripts are very invasive, overwriting settings and versions for applications and tools used in the course. If you have dearly loved dotfiles, ensure that you back them up before running the script.

##### For Mac OS

Paste this script into a Terminal prompt:

```
bash <(curl -sL https://raw.githubusercontent.com/ga-instructors/installfest_script/version2/mac)
```

##### For Ubuntu Linux

If you aren't familiar with Linux, then make sure to read "[Getting Started with Ubuntu][ubuntu]." Otherwise, just paste this script into a Terminal prompt:

```
bash <(wget -qO- https://raw.githubusercontent.com/ga-instructors/installfest_script/version2/ubuntu)
```

If you are a Linux user already, and only want to install our common Ruby environment, paste this script into a Terminal prompt:

```
bash <(wget -qO- https://raw.githubusercontent.com/ga-instructors/installfest_script/version2/ubuntu-rubyonly)
```

#### A successful install

A successful install means we can run the following:

```bash
rails new sample_app -d postgresql && cd sample_app
rails g scaffold pet name:string
rake db:create && rake db:migrate
rails server #=> testing on localhost:3000

git init
git add .
git commit -am 'first commit'

heroku create
git push heroku master

atom .
chrome
hipchat

# sinatra? node? rspec?
```

## How do I Contribute to (or edit) the Installfest Scripts?

For specific rules about making contributions or how to structure Pull Requests, please read [CONTRIBUTING.md]().


## What do the Installfest scripts do?

After the successful completion of an Installfest script, the target computer should have all of the necessary software installed to create web applications: to write, test, run, collaborate on, and host them online.

The target computer should also utilize common settings for applications and software development tools used in the course (unless the user overrode the script's default behavior).

In short, the scripts set up the target computer with a common development environment shared by all of the members and instructors of WDI. Which raises the questions:

- what is a development environment?
- how we teach development in WDI?
- what tools do we use to develop software?
- what other applications do we use in the course?
- what other tools and techs might one use while at GA?
- what are minimum and recommended specs for development hardware?

### What is a development environment?

A development (or dev) environment describes the technologies (including the specific versions of technologies), tools, and settings we work in while developing software. This includes everything from the hardware and operating system we use to the hotkeys and colors we program in to our text editors. Obviously, some of these qualities are more trivial than others, and many are a matter of personal choice. However, when in a guided, intensive learning environment, problems with colors or hotkeys can mean minutes or hours lost, and therefore lessons wasted. That is why we recommend creating a completely standardized dev environment across all students and instructors.

That being said, here are the most important facts:

- we program in a [Unix]()-like operating system, which means (for the most part) Mac OS X or Linux (we support the version known as [Ubuntu]()), **but not Windows**
- we use a terminal emulator (using a [bash]() "[shell]()") to interact with our OS in a standard, efficient way
- we use a window manager ([Spectacle]() in Mac OS X, or Ubuntu's built-in hotkeys for [Unity]()) with our OSes' graphical desktop interface to speed and simplify common tasks
- we use a straightforward text editor (the very new [Atom](), or [Sublime Text]()) with [syntax highlighting]() instead of a more complicated [IDE]()
- we use the [Chrome]() internet browser because of its built-in development tools
- we use [Git]() and [GitHub]() for version tracking (saving our program's "history") and collaboration (allowing multiple people to edit the same group of files), which have become industry standards despite their difiiculty
- we use the [Ruby]() programming language and interpreter to introduce ourselves to programming concepts
- we use the [SQL]() (pronounced "sequel") language to describe, store and retrieve information from a database
- we use the [Sinatra]() and [Ruby on Rails]() frameworks to develop web-based applications
- we use the core web language standards of HTML, CSS and JavaScript to implement web-based application interfaces
- we use jQuery and Backbone


TODO - we use tools and settings and a style guide.

### How do we teach development in WDI?

language stack
versions (why important)



|                           | Version | Technology | Client/Server | Installed |
|:--------------------------|:-------:|:----------:|:--------:|:-:|
| **[PostgreSQL][psql]**    | <span style="font-size:0.75em">(current)</span> | Database  | Server | &#x2713; |
| **[Ruby][ruby]**          | (MRI) 2.1.2 | Language     | Server   | &#x2713; |
| **[Sinatra][sinatra]**    | <span style="font-size:0.75em">(current)</span> | Framework | Server | &#x2713; |
| **[Rails][rails]**        | 4.1.0 | Framework    | Server   | &#x2713; |
| **[RSpec][rspec]**        | 2.?.? | Unit Testing | Server   | &#x2713; |
| **[JavaScript][jscript]** | <span style="font-size:0.75em">(current)</span> | Language  | Client | |
| **[jQuery][jquery]**      | 2.1.1 | Framework    | Client   | |
| **[Backbone][back]**      | 1.1.2 | Framework    | Client   | |
| **[Jasmine][jasmine]**    | ?.?.? | Unit Testing | Client   | |
| **[Capybara][capy]**      | ?.?.? | Acceptance <br> Testing | Client | &#x2713; |
| **[Heroku][heroku]**      | n/a   | Hosting      | n/a      | &#x2713;\* |

\* - some tools added and setup performed, but no specific application involved

[psql]:    http://www.postgresql.org/ "..."
[ruby]:    ... "..."
[sinatra]: ... "..."
[rails]:   ... "..."
[rspec]:   http://rspec.info/     "..."
[jscript]: ... "..."
[jquery]:  http://jquery.com/     "jQuery homepage"
[back]:    http://backbonejs.org/ "Backbone homepage and documentation"
[jasmine]: ... "..."
[capy]:    ... "..."
[heroku]:  ... "..."

### What tools do we use to develop software?

what tools do we need for web dev
suggested vs alternatives
settings

| App | Tool | Alternatives |
|:--:|:--:|:--:|
| **[Atom][txt]** | Text Editor | [Sublime Text](), <br> [Vim]() |
| **[Chrome][brw]** | Web Browser | [Firefox]() |
| **[Git][ver]** | Version Control | none |
| **[GitHub][clb]** | Code Sharing /<br> Collaboration | none |
| **[Trello][pro]** | Process <br> Management | [Pivotal Tracker]() |
| **[HipChat][cha]** | Chat / Messaging | [IRC](), [Slack]() |

[txt]: ... "..."
[brw]: ... "..."
[ver]: ... "..."
[clb]: ... "..."
[pro]: ... "..."
[cha]: ... "..."

### What other applications do we use in the course?

| App | Req'd for Class | System | Description |
|:----|:---------------:|:------:|:------------|
| __[rbenv][rbenv]__ | &#x2713; | Mac/Ubuntu | A Ruby version management tool. Similar to [RVM][rvm], but smaller and simpler. |
| __[figlet]()__  |  &#x2713; | Mac/Ubuntu  | An ASCII art generator. |
| __[Brew]()__\* | &#x2713; | Mac | A system-wide [package management]() system. Similar to [apt-get](). |
| __[Spectacle]()__\* | &#x2713; | Mac | A window management utility with hotkeys. Similar to the hotkeys in [Unity](). |
| __[Vim]()__\*\*  | &#x2713; | Ubuntu  | A very widely-used, terminal-based text editor. |
| __[Alfred]()__  |  | Mac  | A search and indexing tool that replaces Spotlight. |
| __[Dash]()__, __[Zeal]()__ |  | Mac, Ubuntu | Tools for storing, browsing and searching documentation. |
| __[Flux]()__  | | Mac/Ubuntu  | A monitor color management utility pegged to daylight. |
| __[Hub][hub]__ | | Mac/Ubuntu | A wrapper/plugin for Git that adds functionality. |
| __[Sublime Text]()__  | | Mac/Ubuntu | An alternate (very popular) text editor. |
| __[zsh]()__  | | Mac/Ubuntu  | An alternate terminal shell environment. |

 \* - copies a program or functionality included by default in Ubuntu Linux
 \*\* - copies a program or functionality included by default in Mac OS X

and various packages needed to make these work and the above work

[rbenv]: https://github.com/sstephenson/rbenv "rbenv on GitHub"
[rvm]: https://rvm.io/ "RVM homepage"
[hub]: https://hub.github.com/ "Hub hompeage"

### What settings and dotfiles do we use for applications?

settings as separate from default installations
how dotfiles work
colors and profiles for term and text editors
browser plugins
git settings
testing

read more: our style guide

### What other tools and techs might one use while at GA?

Other programming environments you may use in class or in another GA class. Also used by some of our applications and system tools.

- C & C++ (gcc/clang, make, autoconf) installed
- Node (node and npm) installed
- Python (python versions and pip, django) installed
- R (version, open source R studio) not installed (why)
- PHP (versions, composer, laravel) not installed (why)
- Java (versions, jdk) not installed (why)

### What are minimum and recommended specs for development hardware?

#### Minimum and recommended hardware specs

- Ruby: 16 MB
- Sublime: OS X (OS X 10.6 or later is required), 30 MB
- Homebrew: 10.7 or higher is recommended. 10.6 and 10.5 are supported on a best-effort basis.
- Mac System Requirements: In order to run 10.7 you'll need
  - an Intel Core 2 Duo, Core i3, Core i5, Core i7, or Xeon processor
  - 7 GB of available disk space
  - 2 GB of RAM
- Chrome
  - Mac OS X 10.6 or later, Intel, 350 MB
  - Ubuntu 12.04+, Intel Pentium 4 or later
- Class Repo ~ 500MB
- Brew Cellar ~ 1GB
- Atom ~ 200 MB
- HipChat ~ 25 MB
- FireFox ~ 115 MB
- Gems ~ 900 MB

#### Recommended hardware for purchase

- [MacBook Air 13-inch : 128 GB](http://store.apple.com/us/buy-mac/macbook-air?afid=p238%7CRCTP6vIR-dc_mtid_1870765e38482_pcrid_44677875010_&cid=aos-us-kwg-pla-mac)

#### Virtual machines and necessary hardware

...

~~~

## Assumptions

- Auto Completion
- Syntax Highlighting

~~~


## How do I get started with Ubuntu?

### What is Linux? What is Ubuntu?

What and why

...

### How can I use Linux on my machine?

1. In a virtual environment
2. As the local environment

...

### Installing a virtual environment

Install VirtualBox VM
Install Vagrant
Vagrant Up

...


Inside of the virtual environment we must:

- [set up the windowing to auto-resize](http://askubuntu.com/questions/104440/how-do-you-resize-the-standard-ubuntu-desktop-inside-of-virtualbox):

```bash
sudo apt-get install virtualbox-guest-dkms virtualbox-guest-utils virtualbox-guest-x11
```

### Why not use a Virtual Environment?

When weighing the options, we decided not use Vagrant to ensure all students were working in a common environment for three main reasons:

1. ownership
2. simplicity
3. Heroku

##### Ownership

We want the students to feel as if they are in control of their environments. That is, they should be able, within reason, to customize and optimize their coding experience as they see fit. Using a common install and then stepping away feels like a good way to set a baseline while allowing them ownership. While they could do the same with virtual machine, that undermines the entire reason of forcing them to work in a virtualized environment.

The precept holds as well: let's help them grow as individuals, and not enforce uniformity upon them. It seems to me weirdly patronizing to force them to work in an environment we've created, instead of giving them the tools to begin building their own.

##### Simplicity

Sure, having the students install Vagrant and run a VM may seem like it takes fewer steps than running this overcooked install script. But it's also removing a fair amount of agency. They don't afterwards have to interact with their dev environment, but only because of a reliance upon multiple layers of incredibly complicated software. It's giving the students "the magic" up front, which we've often seen lead to a number of questions we can't answer and misconceptions that are hard to clear up.

##### Heroku

As long as we are pushing our repos to Heroku for deployment, a VM seems unnecessary. But if we begin using a different and customizable hosting environment, and teaching students about basic DevOps, it may make sense to use Chef and Vagrant to configure servers and deploy.

### That being said...

We expect to build virtual machines using default setups, the installfest script and settings, and then have torrent links available here:

_**Don't use yet!** Not in working condition._

- [Download our our virtual Mac OS environment via BitTorrent.][mac-torrent]
- [Download our our virtual Ubuntu environment via BitTorrent.][ubuntu-torrent]

### Installing a bootable local environment

...

### Setting up the dev environment

- Set the desktop wallpaper with:

```bash
wget -O ~/Pictures/shortcut_wallpaper.jpg http://i.stack.imgur.com/krD8y.jpg
gsettings set org.gnome.desktop.background picture-uri "file://${HOME}/Pictures/shortcut_wallpaper.jpg"
```
http://i.stack.imgur.com/krD8y.jpg (--> need to host this!)

- Run the installfest script:

```bash
bash <( wget -qO- https://raw.githubusercontent.com/ga-instructors/installfest_script/ubuntu-merge/ubuntu)
```

### Learn the Unity desktop

- REALLY GOOD SHORTCUTS THING:
http://askubuntu.com/questions/28086/what-are-unitys-keyboard-and-mouse-shortcuts
- LESS GOOD THING: https://help.ubuntu.com/community/KeyboardShortcuts#Common_application_shortcuts
- SUPER, META, & HYPER KEYS: http://askubuntu.com/questions/19558/what-are-the-meta-super-and-hyper-keys
- OTHER TERMINOLOGY:
http://askubuntu.com/questions/10228/whats-the-right-terminology-for-unitys-ui-elements




[specs]:          #specifications              "Dev Environment and hardware specs"
[ubuntu]:         #getting-started-with-ubuntu "Ubuntu Guide"
[developing]:     how_to_use.md                   "How to use the script"
[mac-torrent]:    http://example.com/             "Mac GABox"
[ubuntu-torrent]: http://example.com/             "Ubuntu GABox"
