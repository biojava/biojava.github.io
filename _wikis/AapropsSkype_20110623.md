---
title: AapropsSkype 20110623
---

Participants:
-------------

Ah Fu, Peter, Andreas

Where are we
------------

Generate XML - problems generating the Schema automatically. Some parts
seem to be missing. Peter: works ok for me, try to run as Junit test,
that will generate it. Ah Fu: problem with spaces in file path. After
some fiddling around, we could fix the issue. Next step: modify schema
and be as restrictive as possible.

Organisation of serialized XML files
------------------------------------

move files into resources folder.

things related to tests should be in src/tests/

things related to production use should be in src/main/java/

Outlook for the week
--------------------

Start writing the tutorial, what the API can do.

Continue on requirements from last week, Compound needs more work. How
to deal with isotopes, test with an example. Also: XML needs to be
simplified to be more user friendly. Have a method that provides the
element file and only if users want to define their own switch to that
one.
