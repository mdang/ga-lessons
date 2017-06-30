## Git Practice 

**20 min**

- Initialize a new directory in your workspace 
 1. `cd` into `~/code/wdi` and `mkdir` a new folder called `git_practice`
 2. `cd` into ``` git_practice ```
 3. Run ``` git init ``` to initialize a new Git repository 
- Create 3 new files
 1. Run ``` touch file1.txt file2.txt file3.txt ```
- Check the status of your Git repository
 1. Run ``` git status ```

> Note that the three files you've added are marked as **untracked** because you haven't added them to Git yet. Git's not sure what you want to do with them, so it's basically ignoring them for now.

- Start tracking these files by adding them to Git
 1. Use ``` git add . ``` to stage all the files in the current directory that have been modified. In this case, it's all of them.
 2. Check the status of your git repository now by using ``` git status ```

> Note that the files are now marked as **new file**

- Commit your changes
 1. Use ``` git commit -m "Brief description of the changes made" ```
- Edit a couple of your files with some new content
 1. Check the status of the repository with ``` git status ```

> Note that your files are now marked as **modified**

- Stage your files for the next commit
 1. Use `git add .` to stage any modified files
- Commit your new changes 
 1. Use ``` git commit -m "Brief description of the changes made" ```
- View the history of commits 
 1. Use ``` git log ``` to view the history of commits made

### Bonus

- Try removing `file3.txt` from your repository with `git rm file3.txt`
- Try renaming one of the remaining files with `git mv`
