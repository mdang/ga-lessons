# Git(Hub)

### Lesson Objectives

* Explain the difference between cloning and forking a repo
* Explain the uses of Git and GitHub for tracking changes and collaborating on projects
* Write some code to improve their work, commit the changes, and write a strong commit message
* Deploy their first live website using gh-pages

## Review

- What does it mean when we say Git is a distributed version control system vs centralized?
- Why do we need Git? 
 - Revert files back to a previous state
 - Revert the entire project back to a previous state
 - See who introduced an issue and when
 - Automation, deployment 
- Benefits of working locally
 - Speed
 - Don't need to be connected to the internet to save progress
 - Free to experiment without impacting others
- Working with Git
 - Working directory
 - Staging area
 - .git repository
- States 
 - Untracked
 - Unmodified
 - Modified
 - Staged
- Commands
 - `git init`
 - `git add`
 - `git status`
 - `git commit`
 - `git log`
 - `git branch`
 - `git checkout`
 - `git merge`

## Why do we need a centralized repository? (GitHub)

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

``` git clone git@github.com:ga-students/wdi-atx-7-class.git ```

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

> Initialize the repo with a README or there won't be a master branch

**You Do**

Clone the repository you just created on GitHub

#### Pushing changes back to your remote repository

``` git push ``` / ``` git push origin master ```

#### Pulling down the latest updates 

* ``` git fetch ``` - Obtains the latest updates from the remote repository
* ``` git merge ``` - Merges the new updates with your existing working copy
* ``` git pull ``` - A combination of both fetch and merge

## We Do

Update the class repo with the Git Haiku class exercise. Have the students do a ``` git pull ``` to get the updates

<hr>

## Class Exercise  - Git Haiku

**20 min**

https://gist.github.com/mdang/e6b45f9554a64c8d44fd

<hr>

## Pull Requests

Why create pull requests? What are they used for?

## Class Exercise: Most Important & Most Confusing

**2 min**

* Describe the most important thing you learned about Git today 
* What is most confusing? 

## Remote Branches

``` origin ``` is not special, it's the default name given when you clone a git repo

To view remote branches, use: 

``` 
git remote -v 
```

#### Pushing to remote branches

``` git push origin testing ```

#### Deleting a remote branch

``` git push origin --delete serverfix ```

## Class Exercise 

**20 min**

https://gist.github.com/mdang/9ef6df246e23a795936b

<hr>
