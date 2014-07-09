ECPC_GITHUB
===========

##GITHUB REPO FOR ECPC PROJECT
Author: mc
Date: 20-06-2014

###INSTALLING GIT

GIT is a Version Control System, that records changes to a file or a set of files over time so that you can recall specific versions later. 

See:
http://git_scm.com/book/en/Getting-Started-About-Version-Control
 
1. Download GIT from http:/git_scm.com/downloads.
Notice that: 
1.1. if you download GIT for Windows, you will be downloading Git Bash as well.  Git Bash is a CLI (Command Line Interface, some sort of console or terminal). You will be using Git Bash for many of the operations you require. Installation should be straight forward BUT if you have Cygwin in your computer, BE CAREFUL, and check whether you need to follow precise instructions in this case. 
1.2. If you are using Mac, you do not need Git Bash, since you will work from the Terminal. 

2. From Git Bash or the Terminal, we need configure username and email. You do this by entering the following commands, one at a time:
git config --global user.name "yourusername"
git config -- global user.email "youremail"

3. Check everything is ok with
git config --list

4. Exit with 
exit

---

###GITHUB
Github is a website that has been developed to allow you to collaborate on projects together with other researchers/developers. In fact, it is a web-based hosting service for software development projects that use the GIT version control system.  

1. Setup a Github account
2. Edit your profile (if you so wish)
3. Create a repository from GITHUB
    3.1. Go to http://github.com/yourusername
    3.2. Click on repositories. Click on new. Select "public" ("private" repos require payment or education account). Check the box next to "initialize this repo with a README". And create a repo. You have created a repo in your GITHUB account. 
4. Creating a copy of this repo in your computer.
    4.1. With Git Bash or Terminal, create a new directory wherever you want to have the GITHUB repo. Use 
mkdir nameofdirectory
    4.2. Initialise your local repo: Go to the directory you have just created 
    cd nameofdirectory
    And from the directory do
    git init
    4.3. Point to your local repository at the remote repository in GITHUB doing
    git remote add origin https://github.com/yourusername/repoyouwanttobringtoyourcomputer.git
    4.4. Clone the repo in your computer with
    git clone https://github.co/calzada/repoyouwanttobringtoyourcomputer.git

YOU ARE DONE!

5. You can also clone other researchers'/developers' repos. This is called forking.
    5.1. Search for the repos of your interest by clicking "Explore". Click on "Fork" if you want to have access to another repo.
    5.2. Follow step 4 above (from 4.1. to 4.4.)

6. You could also create a directory in your local computer and then create a repo from it. For thi follow instructions in git - the simple guide:
http://rogerdudler.github.io/git-guide/

---

### BASIC GIT AND GITHUB COMMANDS
Git works following this path:

workspace ---> index ---> local repo ---> remote repo

In short, this means you start a document in your local directory in your computer. You need to index files (and changes) to tell git that they should be controlled. So your files are at your local repo (and are updated in the local repo via commit) and then they are sent to the remote repo (in GITHUB) via push. 

So this is how you do this: 

1. You create a file in your local directory.
2. You need to add this file in order to send it to the index and keep track of it. You do 
*git add . [sends files to the index]
or
*git add -u [updates tracking for files that changed names or were deleted]
or
*git add -A [does both of the previous]
You should always do this (with all changes) and before commiting
3. You commit changes to your local repo. In this way you save an intermediate version. 
*git commit -m "you write a message here so that you remember later on what this commit does". [Commit only updates your local repo].
4. You push changes to the remote repo (in GITHUB)
*git push

### Editing GITHUB and updating local repo 
Once you enter GITHUB you may also work there change things in the remote repo, commit changes in the remote repo. If you want to send changes to your computer, you need to go to your directory and from there do
*git pull origin master
 
##### REMEMBER: You may also create branches and tags.

---

### ECPC WORKFLOW

1. First time you work with ECPC_GITHUB
*You need to fork ECPC_GITHUB and clone it in your computer. You are then ready to work. Follow the instructions above.
2. From then on:
*the first thing you do is update your local repo from remote repo with
*git pull origin master 

(You do this in case someone else in the group has introduced changes since you worked last).
Then you follow instructions above.
