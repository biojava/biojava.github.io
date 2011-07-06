---
title: BioJava:CookBook:AAPROP:instabilityindex
---

### How is Instability Index computed?

The instability index provides an estimate of the stability of proteins
in a test tube. The authors of this method have assigned a weight value
of instability to each of the 400 different dipeptides (DIWV). Using
these weight values it is possible to compute an instability index (II)
which is defined as:

`                  i=L-1`

II = (10/L) \* Sum DIWV(x[i]x[i+1])

`                  i=1`

I\(10/L ∑_(i=1)^(L-1)▒〖DIWV〖(x〗_i,x_(i+1))〗\)nstability Index=

`    where: L is the length of sequence`

`           DIWV(x[i]x[i+1]) is the instability weight value for the dipeptide starting in position i.`

A protein whose instability index is smaller than 40 is predicted as
stable, a value above 40 predicts that the protein may be unstable.
