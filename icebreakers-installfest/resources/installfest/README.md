# WDI InstallFest Script

This repo holds the scripts used in the installation, setup, and creation of 
"dotfiles" (ie, application settings) for the development environments of 
students in General Assembly's Web Development Immersive program.

## How do I run an Installfest Script?

The script comes in three basic flavors: the default full install for Mac OS, 
the default full install for Ubuntu Linux, and smaller scripts that ensure a 
current and standardized install of Ruby is being used.

**Warning**: in their default form, these scripts are very invasive, 
overwriting settings and versions for applications and tools used in the 
course. **If you have dearly loved dotfiles, ensure that you back them up before 
running the script!** *(We will back them up too, but just in case...)*

## Step 0 (Preparation)

Make sure you have your GitHub account information with you, including:

- the email address you used to sign up,
- your GitHub username, and
- your GitHub password.

Note: on Mac, you need to run the script as a User with Administrator
priviliges. If you only have a single user, then this is fine. If you
have multiple users, let the instructors know!

## Step 1

##### For Mac OS

Paste this script into a Terminal prompt:

```
bash <(curl -sL https://raw.githubusercontent.com/GA-WDI/installfest/master/builds/mac)
```

##### ~~For Ubuntu Linux~~

~~Paste this script into a Terminal prompt:~~

~~`bash <(wget -qO- https://raw.githubusercontent.com/GA-WDI/installfest/master/builds/ubuntu)`~~

*Sadly, the Ubuntu script is out of date and is not currently 
supported. If you'd like to help get it back in to working order, let us
know!*

##### Run the script

Follow the instructions! **Note: it is helpful to increase the size of the 
terminal while running the script.**

## Step 2

##### Reload the terminal screen

The new environment **will not work** with the current, open, terminal. Use 
`⌘+N` in Mac OS, or `Shift+Ctrl+N` in Ubuntu, to open a new terminal
window.

Make sure that there are no errors (on the load page)!

## Step 3

##### Final Set-up, Mac OS

1. **Google Chrome**: [download and install][chrome-link] the Google Chrome
   web browser. Open the browser and set it as default!
2. **Spectacle** (for Macs): open Spectacle using Spotlight, by pressing `⌘-Space`
   and typing `spec`, and then pressing `Return`. It will direct you to change
   your Accessibility settings to allow it to control windowing.
3. **Terminal**: open Terminal using Spotlight (`⌘-Space`, and type `term`),
   and then open the Preferences pane (`⌘-,`), choose Profiles, and then import
   the profile "Tomorrow Night.terminal" from the Desktop by clicking on the
   gear symbol at the bottom of the list of themes and choosing `Import...`.
   Then set that profile to the default by clicking on it and choosing 
   "Default." When you open a new terminal window it should have a black
   background.
4. **Sublime Text**: open the terminal as above, and then open Sublime Text
   by typing `subl .` Make sure that Sublime Text opens.
5. **Slack**: ensure that you can open Slack (`⌘-Space`, and type `sla`) and 
   communicate with your classmates!
6. **Files**: in your terminal, type `cd ~/code`. You should now have a 
   directory here where you can store all of your programming projects! When
   you then type `ls` to list the contents of that directory, you should see
   a directory named `wdi` — this is where you can store all of your class
   work.

<!-- LINKS -->

[chrome-link]: https://www.google.com/chrome/browser/desktop
