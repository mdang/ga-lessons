# Outline: Git & GitHub

### Objectives

* Describe reasons for using version control
* Explain the difference between centralized and distributed repos
* Explain what Git is and how it works
* List common Git commands 
* Start a repo by initializing locally
* Add and commit changes
* Explain what GitHub is and why we need it
* Explain the difference between clone and fork
* Push and pull changes from GitHub

## Exercise: Git Whiteboard

**5 min - Pair Exercise**

This exercise helps illustrate the value of using a version control system like Git. 

### What is Git? 

[Git](https://git-scm.com/) is a program for the command line that allows you to:

* Revert individual files back to a previous state
* Revert an entire project back to a previous state
* Compare changes over time
* See who last modified something that might be causing an issue

> **Public Service Announcement:** 
Git has a steep learning curve. Don't worry if you don't get it right away, you'll get plenty of practice everyday in this course.

### Types of version control

- Centralized
 * [Subversion](http://subversion.apache.org/)
 * CVS
- Distributed
 * [Git](http://git-scm.com/)

Benefits of working locally
  * Speed
  * Don't need to be connected to the internet to save progress
  * Can take chances and not worry about how it will affect others 

### How Git works 

<img src="https://git-scm.com/book/en/v2/book/01-introduction/images/areas.png">
Diagram from [git-scm.com](git-scm.com)

- **Working Directory**: Holds the actual files you're working on
- **Index**: Acts as a staging area
- **HEAD**: Points to the last commit you've made

### Git commands 
  - `git init`
  - `git status`

    * Untracked files
    * Tracked files
     - Unmodified 
     - Modified
     - Staged

<img src="https://git-scm.com/book/en/v2/book/02-git-basics/images/lifecycle.png">
Diagram from [git-scm.com](git-scm.com)

  - `git add`
   - **NOTE:** This command stores a snapshot of the file as is, if you remember something and go back to edit it, it must be staged again if you want those changes in the commit.
  - `git commit`
  - `git mv`
  - `git rm`
  - `git log`

## Exercise: Git Practice 

**20 min**

https://gist.github.com/mdang/3065eedb93d9da10ee4e

## GitHub

Why do we need a centralized repository?

### Git commands for working with remote repos
  - `git clone`
   * Clone vs Fork
   * **Warning:** Gitception can occur if you try to initialize a repository more than once
  - `git push`
  - `git fetch`
  - `git merge`
  - `git pull` - A combination of both fetch and merge

## Exercise: Add local git repo to GitHub

**10 min**

Create a new repository on [GitHub](http://www.github.com) and connect our local repository to this repository.

## Exercise: Clone class repo

**5 min**

[WDI 3 Class Repository](https://github.com/ga-students/wdi-atx-3-class)
