<!--
Creator:
Location: SF
-->

![](https://ga-dash.s3.amazonaws.com/production/assets/logo-9f88ae6c9c3871690e33280fcf557f33.png)

# GitHub Collaboration

### Why is this important?
<!-- framing the "why" in big-picture/real world examples -->
*This workshop is important because:*

- Git is a powerful tool for collaborating on code.

- GitHub is a popular online service for managing git repositories.

- Using git repositories for collaboration will be important throughout a web developer's career.

- Branches are git's solution for managing different variations of a project, allowing developers to try things out safely or develop different features simultaneously. 

### What are the objectives?
<!-- specific/measurable goal for students to achieve -->
*After this workshop, developers will be able to:*

- Create their own git branches and explain a pattern for using branches to develop a full application.

- Make a new repository and add another developer as a collaborator.

- Resolve a merge conflict.

### Where should we be now?
<!-- call out the skills that are prerequisites -->
*Before this workshop, developers should already be able to:*

* Use git to stage and commit changes locally.

* Explain what the following terms mean for GitHub: pull, push, fork, clone.

## Branches

In Git, branches will be a part of your everyday development process. When you want to add a new feature or fix a bug — no matter how big or how small — you'll creat a new branch to hold your changes. This makes sure that unstable code is never committed to the main code base, and it gives you the chance to clean up your feature’s history before merging it into the main branch.

Branches are incredibly lightweight "movable pointers" that help us as developers make experimental changes! A branch in git is just a label or pointer to a particular commit in a repository, along with all of it's history (parent commits).

What makes a branch special in git is that we're always on a specific branch. When we commit, the current branch HEAD moves forward to the new commit. Another way to say that is the HEAD always stays at the tip of the branch.

Terminology: HEAD is simply a reference to the current or most recent commit!


<img src="https://www.atlassian.com/git/images/tutorials/collaborating/using-branches/01.svg" width="70%">






###Q. Why is branching an important part of git?


> A. Branches are useful for many reasons, but some of the most common ones:

> 1. To allow experimentation. By switching to a new branch, we can experiment,
and if the experiment fails, we can delete it and easily switch back to master
(or another branch of our choice). If it succeeds, we can merge those changes
into master.
2. To allow work to proceed on multiple features (or by multiple people) without
interfering. When a feature is complete, it can be merged back into master.
3. To allow easy bug fixes on a stable version while features are being developed.

## `git fetch`, `git merge`, and `git pull`

Fetching, merging, and pulling are related commands that you will frequently use to update your local repository to include your collaborator's work.

[`git fetch`](https://git-scm.com/docs/git-fetch) gets all of the updates from the remote repositories without changing the location of the local HEAD.

[`git merge`](https://git-scm.com/docs/git-merge) joins two different places in your development tree. This is frequently used to bring together your changes with the changes you just fetched. If you were on branch `add-auth` and you had just `git fetch`'d updates from the remote, you could then `git merge origin/add-auth`. This would join your changes and the changes that had been made to this branch on origin. You also commonly use merge to pull changes from one branch into another so that your current branch doesn't become out of date while you work.

[`git pull`](https://git-scm.com/docs/git-pull) is the combination of fetching and merging to the newly fetched version of the current branch.

![image](https://cloud.githubusercontent.com/assets/6520345/15020568/663aa804-11d7-11e6-83f6-774e43bc2ea6.png)

## Collaboration Workflows

There are two main scenarios for collaborating on coding projects:

1. You **fork** another developer's project and make pull requests from *your remote fork* to the *project's remote*.
2. Another developer makes you a **collaborator** on a project they own, giving you the ability to make pull requests directly from the project's *remote feature branches* to the project's *remote master*. (Note that as a collaborator on a project, you also have the ability to push directly to the master branch, which you should NEVER do.)


![github-collab-diagram](https://cloud.githubusercontent.com/assets/7833470/12072895/69abd404-b0b1-11e5-8d8c-4ff54c13b0a0.png)


**For this project, you should be collaborators!**

## Practice: Create and resolve a merge conflict

What happens if two people on a team change the same file?  Merge conflicts (often)!  That might sound like a big deal, but it's easy to handle with your team.  Let's practice resolving a merge conflict.


#### Set Up a Repository!
1. Pair up. Have one partner create a brand new repository locally, make an index.html and a README.md, and commit:

 ```bash
 mkdir git-collaboration-practice
 cd git-collaboration-practice
 git init
 touch index.html
 touch README.md
 git add index.html README.md
 git commit -m "sets up initial file structure"
 ```
 
2. Have the same partner create a new repository on GitHub. The repo owner should copy the clone URL for the new repository to their clipboard.

3. Back in the local repository, add the GitHub repository as a new `origin` remote, and push the single commit so far to GitHub:

 ```bash
 git remote add origin <YOUR CLONE URL>
 git push origin master
 ```
 
4. On GitHub, check that the first commit is showing in the repository. 

#### Collaborate!

4. Now, the repository owner should [add your partner as a collaborator](https://help.github.com/articles/adding-collaborators-to-a-personal-repository/).

3. The collaborator should clone the repository.  The collaborator will not need to fork. 

4. Each person is about to change the files, so each person will need to make one new branch in their local repository. Name the branches with different branch names, like `intro` and `authors`:

 The repo owner might do:
 ```bash
 git branch intro
 git checkout intro
 ```
 
 The collaborator might do:
 ```bash
 git branch authors
 git checkout authors
 ```
 
 > As a shorthand, the `git checkout -b` command creates and checks out a branch all at once. For example, `git checkout -b intro`. 

5. Each person should now make a change to the `README.md` and to the `index.html` on their own local copy. Add at least 2 lines to each file, then `git add` and `git commit` your changes. 

6. Now, each person should push their work to GitHub **on their branch**. 
  ```bash
  git push origin intro
  ```

  ```bash
  git push origin authors
  ```

7. [Open a pull request](https://help.github.com/articles/creating-a-pull-request/#creating-the-pull-request) from each new branch to the master branch.

#### Merge Changes!

1. Choose a pull request to accept first. It shouldn't have any merge conflicts with the master branch, so you can just merge it in on GitHub after your partner has looked over it. 

2. The second pull request should be a little more interesting. We hope that we have created at least one merge conflict. You'll know you have a merge conflict if GitHub tells you you "cannot merge automatically."  

3. The person whose commit has a conflict should now [follow the collaborator scenario](https://github.com/SF-WDI-LABS/shared_modules/blob/master/how-to/github-collaboration-workflow.md#collaborator-scenario) starting at step 3 and using their branch name instead of `auth`. Resolve the merge conflicts locally with help from the person who already made changes. Once you've tested that the merged version still looks how you want, commit and push your changes to GitHub. 

4. Have your partner review the change and merge the pull request. 

5. Feel free to delete this practice repository from your local machine and from GitHub. 

## Talking Points for Teams

1. Set guidelines for merging pull requests before you start. How many people should review the pull requests before they're merged?  What branch should they be merged into? (Consider making a "develop" or "staging" branch to merge into instead of merging into the master branch. Once your app is complete, then you can merge your development branch into the master branch as your first major "release.")

2. Make very descriptive commit messages! The team members who are reading them should be able to tell at a glance what you were working on.

3. Clearly delineate who's working on what, and keep an updated task list. (Trello is great for this!) Things will go much more smoothly if team members work on features that don't overlap. This is especially important if you're not all working in the physical location. It's not uncommon for wires to get crossed!

4. Don't have multiple team members working on the same feature branch at one time, on different computers. If you're pair programming with someone, only use one computer to avoid having differing code on the same branch. 

5. When merge conflicts arise, it's up to the individual contributor to reseolve them. But work with your team! Follow the steps for [resolving merge conflicts locally](#resolving-merge-conflicts-locally), make sure to delete any merge junk from your code, and then push your cleaned-up branch to GitHub.  


## Resources

* **[WDI In-depth Guide for Teams Using GitHub](https://github.com/SF-WDI-LABS/shared_modules/blob/master/how-to/github-collaboration-workflow.md)**
* <a href="https://help.github.com/articles/adding-collaborators-to-a-personal-repository" >Adding collaborators to a personal repository</a>
* <a href="http://nvie.com/posts/a-successful-git-branching-model" >A successful Git branching model from industry</a>
* <a href="https://help.github.com/articles/using-pull-requests" >Using pull requests</a>
* <a href="https://www.youtube.com/watch?feature=player_detailpage&v=ZDR433b0HJY#t=2791s">A talk on Git branches and HEAD</a>
* <a href="http://ohshitgit.com/">**Oh Shit, Git!** - how to fix git mistakes</a>

## Tutorials

* **We recommend you try Levels 1-3 in the main section  of this [git branching tutorial](http://pcottle.github.io/learnGitBranching/).** Stop at 4: "Rebase Introduction". Take your time:
  * Read all the dialogs. They are part of the tutorial.
  * Think about what you want to achieve.
  * Think about the results you expect before you press enter.
  * Whenever you see/type `git commit`, you can assume some changes have been made and staged.
* The top row of the Remote section of the [git branching tutorial](http://pcottle.github.io/learnGitBranching/) also covers helpful material for collaborating through Git and GitHub. 
* <a href="https://www.codeschool.com/courses/try-git" >Try Git - Code School</a>
* <a href="https://github.com/Gazler/githug">githug</a>
