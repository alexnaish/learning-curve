# GIT

GIT is the de-facto version control system used for managing source-code. Originally invented by none other than the founder of Lunix (Linus Torvalds), its grown in popularity since it was first released in April 2005. Its free and open-source (meaning you can use it for free and contribute to it if you ever wanted to). For the name itself, I'll let Mr Torvalds explain:

> Linus Torvals - I'm an egotistical bastard, and I name all my projects after myself. First 'Linux', now 'git'.

To summarise how long development took - development started on 3 April 2005, the project was announced on 6 April, was used to track itself on the 7th April, handled the first merge of multiple branches on the 18th April, was turned over for "maintenance" on the 25th April and was released as 1.0 on 21st December 2005. Not a bad turnaround for the foundation of modern software engineering.

## In a nutshell

GIT is a `distributed` (spread out across multiple machines), revision-control system. Put simply, GIT tracks changes to files that are made in "revisions" or "commits". You make your changes to a selection of files, you "stage" your changes and then you "commit" to them. That commit is a point in time that records the changes you make to the particular files.

### Repositories

`GIT` works with "repositories" (or "repos" for short). This is just a fancy name for a "project" really, we don't need to delve too much deeper right now.

If our project is an existing project, can can `clone` the repository - this will create a new folder with the same name as the repo name ("learning-curve" in the example below), download all the files from your `origin` as well as all the `GIT` references and history and place it into the newly created folder.

```
git clone git@github.com:alexnaish/learning-curve.git
```

### Branches

Within a repository, `GIT` works with `branches`. The default branch for a new project is `master`. 

A `GIT` branch is similar in ways to a tree branch - they can diverge from another branch without affecting the original branch. The only difference with `GIT` branches is that these branches can "rejoin" or "merge" back in with other branches.

In our terms, it's just a way of separating work streams so that they don't affect each other. For instance, if I was working on a new feature and you were working on a completely different feature, it makes sense if we work on separate branches. I don't want my code changes to affect your work and vice versa. Moving onto a new branch is easy:

```
git checkout -b my_new_feature
```

Congratulations, you just created a brand new **local** branch. Since we've just created this branch, its only a local branch - it doesn't exist on your `origin` server. When you're ready for it to be shared, we need to push it up to the `origin`. Thats a simple task:

```
git push -u origin my_new_feature
```

This pushes the new branch and commits up to the `origin` and the `-u` flag tells `GIT` to make your local branch be tracked against the newly created `remote` branch.

### Commit History

At all times, you'll have a local `history` of changes on your machine and your `origin` or `remote` (Github for us) has another copy. 

Imagine you pulled down a branch called `my_existing_feature` from the `origin`, at this point in time the local history matches the `origin` history as its not had a chance to drift apart. So right now, the following is true: 

| Your History | Origin's History |
|-------|-------|
|A|A|
|B|B|
|C|C|

`A`, `B` and `C` are just commits.

Great, all pulls down nicely and you begin some work. You make some changes, you commit them with something like the following:

```
git add index.html new_image.png
git commit -m 'Add a new image to portfolio section'
```

So with the above commands, we've `staged` two files for the commit, we've committed the staged files and added a message for the commit (when running `git commit` the `-m` flag allows us to easily set a commit message).

So now we have something like:

| Your History | Origin's History |
|-------|-------|
|A|A|
|B|B|
|C|C|
|D||
|E||
|F||

We're ahead of the `origin`! Nothing to worry about, we just need to `push` them up to same branch on the origin. We can run the following command to push our changes up and synchronise:


```
git push origin my_existing_feature
```

Easy.

### Merging

Now heres the tricky part. We have to consider the `distributed` aspect - normally you will be working in a team of other developers. They might be working on the same codebase, sometimes even the same files at the same time. GIT has to consider how your changes can mesh together with your colleague's changes - this is called `merging`. 

What if someone pushed their changes to `origin` before you did? What happens if your `local` and `origin` don't match up? Never fear, `GIT` has you covered. Imagine you run the following to check the status:

```
git fetch;
git status;
```

GIT will tell you that your local branch has changes that origin doesn't and that origin has commits that you don't. It will be a slightly cryptic message, something like `your branch is 3 commits ahead and 3 commits behind`. Little bit confusing. What its basically saying is that the history looks like this:

| Your History | Origin's History |
|-------|-------|
|A|A|
|B|B|
|C|C|
|D|G|
|E|H|
|F|I|

If we're lucky, we can simply pull down the `remote` branch and `GIT` will magically merge the changes for us and everything will be rainbows and unicorns. Easy:

```
git pull origin my_existing_feature
```

Hopefully, if you then rerun `git status`, you'll be informed something similar to `you are 3 commits ahead of origin/my_existing_feature`. Great, `GIT` merged without any issues and we can push and be happy!

### Conflicts

However sometimes if you and your colleague have made changes to the same place in the same file `GIT` won't be able to determine which change to use - this is called a `merge conflict` and is exactly what it sounds like. Most of the time `GIT` does a good job and intelligently merges the changes, however sometimes you will need to manually choose whether to keep your changes or to accept the `incoming` change (or a mix of both!). Most code editors show this nicely to you, with big sections within the issue files showing your changes against the `incoming` changes and you just click on which one you want to keep.

Once done, `GIT` stages the changes made while fixing the `conflict` and we commit them. This is known as a `merge commit`. Once done, we could potentially end up with something like this (note the missing local commits on the `origin`):

| Your History | Origin's History |
|-------|-------|
|A|A|
|B|B|
|C|C|
|D||
|G|G|
|E||
|H|H|
|I|I|
|F||
|J (Merge Commit)|| 

This is fine, we're ahead of the `remote` branch - we just need to push it up like we did before!

```
git push origin my_existing_feature
```

### Merging

I briefly mentioned the `master` branch. There are many different ways of handling branches and code changes. However, the way I like to work is to keep the `master` branch as the "source of truth" for the application - as in **NO** active development work happens on the `master` branch. If you are wanting to work on a new feature, create a new branch, perform all the work required on that branch and then when complete we can `merge` that branch into `master`.

Now the way I've been doing this in recent years is through a technique called `Pull Requests` (PR for short). A PR allows other developers to view or "approve" your work before its released onto the `master` branch. A PR basically says "I want to merge branch X into branch Y". Normally, branch Y here would be `master`.

However, in the good old days (¯\_(ツ)_/¯), we could do this through the command line very easily:

```
git checkout master
git merge --squash branch_to_be_merged
git commit -m 'Merge branch_to_be_merged into master!'
git push
```

In the above, we make sure we're on the master branch, we run the `git merge` command with the branch we want to pull in specified, we commit all the changes that the merge recorded and then we push it up to `origin`!
