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
`main    `[`https://github.com/biojava/biojava.git`](https://github.com/biojava/biojava.git)` (fetch)`  
`main    `[`https://github.com/biojava/biojava.git`](https://github.com/biojava/biojava.git)` (push)`  
`origin  `[`https://github.com/`](https://github.com/)<username>`/biojava-sbliven.git (fetch)`  
`origin  `[`https://github.com/`](https://github.com/)<username>`/biojava-sbliven.git (push)`

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

