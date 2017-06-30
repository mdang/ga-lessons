## Git(Hub) Fundamentals

### Learning Objectives

* Describe reasons for using version control
* Explain what Git is and why we use it
* Start a repo by initializing locally
* Add and commit changes
* Check the status of a repo
* Explain what role GitHub plays
* Create a repo on GitHub
* Clone and fork existing repositories
* Push commits to a remote repo
* Explain the difference between fetch and pull
* Explain the difference between clone and fork

### Class Exercise 

**You Do - 10 min**

Demonstrate the need for Git

https://gist.github.com/mdang/c601cf7edc3c28f6f580

### What is Git? 

Git is a distributed version control sytem. This means that clients don't just check out the latest snapshot, they fully mirror the entire repository. There's no single point of failure. Every clone is a full backup of the data.

### Why do we use Git? 

> **QUESTION**: Why do we use Git? Why not just timestamp directories and save multiple versions?

Git allows you to: 

* Revert files back to a previous state
* Revert the entire project back to a previous state
* Compare changes over time
* See who last modified something that might be causing a problem
* See who introduced an issue and when

It's almost impossible to lose a backup of your work if you create a snapshot (commit) at any point. It gives you freedom to explore and try new things without the worry of losing your work. For the most part data is added not deleted

##### Distributed vs Centralized

> Show diagram of what it means to be **distributed** vs **centralized**. Focus on local part, and explain by end of class we'll work in GitHub for a centralized store. 

- We are going to focus on the local part now, then move on to working with a remote repository
- Explain how working locally differs from SVN

##### Benefits of working locally

* speed
* don't need to be connected to the internet to save progress, you could be working with it on an airplane
* can take chances and not worry about how it will affect others 

##### Diagram of Git

- Explain that each checkout is a full copy of the repository

### Working with Git

<img src="https://git-scm.com/book/en/v2/book/01-introduction/images/areas.png">

The Git directory is where Git stores the metadata and object database for your project. This is the most important part of Git, and it is what is copied when you clone a repository from another computer.

The working directory is a single checkout of one version of the project. These files are pulled out of the compressed database in the Git directory and placed on disk for you to use or modify.

The staging area is a file, generally contained in your Git directory, that stores information about what will go into your next commit.

## Exercise: Most Important & Most Confusing

**2 minutes**

Describe the most important thing you learned and identify any area of confusion. 

<hr>

### Working with Git on the command line

##### 1. Initialize a new Git repository

``` git init ```

##### 2. Create files 

``` touch list.html ```

``` subl list.html ```

##### 3. Check the status

``` git status ```

* Untracked files - Any files in the working directory that were not in the last snapshot and are not in the staging area
* Tracked files
 - Unmodified 
 - Modified
 - Staged

<img src="https://git-scm.com/book/en/v2/book/02-git-basics/images/lifecycle.png">

##### 4. Add the files to the staging area

``` git add list.html ```

> NOTE: 'git add' stores a snapshot of the file as is, if you remember something and go back to edit it, it must be staged again if you want those changes in the commit. 

Check ``` git status ``` now

##### 5. Commit your changes

``` git commit -m "Short description about the commit" ```

##### * Renaming/moving files 

``` git mv list.html list2.html ```

##### * Removing files 

``` git rm list.html ```

##### * View the commit history 

``` git log -p -2 ```
 * -p displays the diff in each commit
 * -2 limits the diff to two lines 

``` git log --pretty=oneline ```

### Class Exercise 

**20 min**

https://gist.github.com/mdang/3065eedb93d9da10ee4e

### Why do we need a centralized repository? (GitHub)

* work in teams
* backup our data in case our machine crashes
* resume
* social

#### Cloning vs Forking a repository

A **clone** is a copy of an existing repository. We can create as many clones as we want, wherever we want.

**Forking** creates a copy of someone else's GitHub repo to your GitHub account. The forked repo is not perfectly identical - but it includes all the same source files, issues, and commit history.
  - Used for open source contributions so that not everyone has to have write access to the code in order to contribute
  - Propose bug fixes

#### Cloning an existing GitHub repository 

**We Do**

``` git clone git@github.com:ga-students/wdi-atx-2-class.git ```

#### Forking an open source project

Search for any popular repository and show how easy it is to fork into our own repository

**NOTE:** Students will be using a variation of the following link to submit homework:

https://www.atlassian.com/git/tutorials/comparing-workflows/forking-workflow

1. Fork the homework repo
2. Clone your version of the repo 
3. Add a remote ```upstream``` 
4. To get the latest updates, they will run ``` git pull upstream master ```
5. They will then submit a pull request 

#### Create your own GitHub repository

https://github.com/new

**NOTE** Initialize the repo with a README or there won't be a master branch

**You Do**

Clone the repository you just created on GitHub

#### Pushing changes back to your remote repository

``` git push ``` / ``` git push origin master ```

#### Pulling down the latest updates 

* ``` git fetch ``` - Obtains the latest updates from the remote repository
* ``` git merge ``` - Merges the new updates with your existing working copy
* ``` git pull ``` - A combination of both fetch and merge

## Class Exercise

Update the class repo with some new content. Have the students do a ``` git pull ``` to get the updates

### Future Git lesson topics

* Branching
* Working on the same repository with other developers
* Pull requests
* Merge conflicts
