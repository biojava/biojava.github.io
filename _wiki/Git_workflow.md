---
title: Git workflow
---

Git is a very flexible versioning system. There are often multiple ways
to accomplish a task. Here are some recommended workflows for BioJava.

Using github
------------

It is strongly advised to create a personal fork on github. This allows
new features to be fully developed before being merged into the main
repository. Some resources to help with this:

-   [Github: Fork a repo](https://help.github.com/articles/fork-a-repo)
-   [Github: Using pull
    requests](https://help.github.com/articles/using-pull-requests)

Merging options
---------------

Assume you are working in local fork, and that you have a remote 'main'
which points to the main biojava repository:

`$ git remote -v`  
`main    https://github.com/biojava/biojava.git (fetch)`  
`main    https://github.com/biojava/biojava.git (push)`  
`origin  https://github.com/<username>/biojava-sbliven.git (fetch)`  
`origin  https://github.com/<username>/biojava-sbliven.git (push)`

You've started a branch 'feature' and made a few commits, so now your
repository now looks like this:

`A -- B -- C <- master, main/master`  
`      \`  
`       -- D -- E <- feature`

Now you want to merge your changes back into main/master. There are
several ways which this can be accomplished

1.  Push the changes to your github fork, then issue a pull request
2.  Merge the feature branch into master locally, then push changes to
    the main repository (requires developer permission)
3.  Rebase your changes onto master, then push changes to the main
    repository (requires developer permission)

All three options will result in the changes being published in the main
repository, but they have different side effects. Here are some rules of
thumb to follow for deciding which merge strategy to persue:

-   If you don't have push access to the main repository, use pull
    requests
-   If the changes involve a major feature addition, use pull requests
-   If any of the changes could be controversial, use pull requests
-   For minor changes, use rebase

### Issuing a pull request

Issuing a pull request is the easiest option. Just synchronize with your
github fork (`git push` or use the github application), then use the
github website to start a new pull request as described
[here](https://help.github.com/articles/using-pull-requests). Make sure
that biojava/master is the base repository, and your feature branch is
the head repository. If the changes are associated with a particular
issue, make sure to mention the issue number in the description box when
creating the pull request (eg 'Fixing \#12').

Creating the pull request will generate a comment thread, much like an
issue. If an issue number was mentioned in the description, the original
issue will automatically get a link (eg 'bob referenced this issue: Pull
Request \#13').

If the pull request can be automatically merged, go ahead and do so if
you have permission and don't expect the merge to be controversial. If
the merge would result in conflicts, it may have to be manually merged
locally and then marked as resolved. Either way, merging will add a new
commit to the tree:

`A -- B -- C ---- F <- master, main/master`  
`      \         /`  
`       -- D -- E`

Pros:  

-   Creates a ticket on github for discussing the changes
-   Doesn't require push permission

Cons:  

-   Always adds a merge commit, complicating the repository history
-   Requires the additional step of resolving the pull request
-   Can't be done from within Eclipse

### Manual merging

Creating pull requests may be overkill for some changes. Manually
merging avoids creating a full ticket on github. However, it's more
dangerous since it directly modifies the main repository. Be absolutely
sure you understand how git merging works (see [Git Book: Basic
Branching and
merging](http://git-scm.com/book/en/Git-Branching-Basic-Branching-and-Merging)).
Mistakes from this technique will be immediately public.

To manually merge, issue these commands:

`git checkout master # switch to the destination branch`  
`git pull main master # make sure its up-to-date`  
`git merge --no-ff feature # merge the feature`  
`# fix conflicts, check that everything looks good`  
`git push main master # make changes public. Can't be undone!`

Omitting the `--no-ff` parameter will skip adding a new merge commit if
no activity has happened on the main repository. This may or may not be
desirable.

Pros:  

-   Complete control over the merge process
-   Can be done from command line or eclipse
-   Merge commit is optional for fast-forward merges

Cons:  

-   Usually needs a merge commit, complicating the repository history
-   Mistakes are immediately public without review
-   Needs developer permissions

### Using rebase

Rebasing gives very clean repository histories. Rather than merging two
lines of development, rebase applies all commits from one branch to the
head of the other branch, giving the illusion of one continuous line of
development. (See [Git Book:
Rebasing](http://git-scm.com/book/en/Git-Branching-Rebasing).) This
avoids the addition of many merge commits, which obscure real
developments in the git log.

`git checkout feature # switch to the feature branch, unlike a merge`  
`git rebase main/master feature # Moves all commits from the feature branch over to origin`

At this point, main/master should be a parent of the feature branch:

`A -- B -- C -- D' -- E' <- feature`  
`          ^\`  
`            master, main/master`

Now master can be moved up and pushed to the main repository

`git checkout master`  
`git merge feature # Fast-forward merge, so no commit message`  
`git branch -d feature # Delete feature branch`  
`# check that everything looks good and compiles`  
`git push main master # make changes public. Can't be undone!`

Pros:  

-   Never requires a merge commit
-   Simple linear history
-   Complete control over the merge process

Cons:  

-   Mistakes are immediately public without review
-   Needs developer permissions

