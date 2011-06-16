---
title: AapropsSkype 20110616
---

Participants:
-------------

Ah Fu, Peter, Andreas

Cruisecontrol
-------------

notifications don't work, Andreas will investigate

XML autogeneration
------------------

Peter likes Ah Fu's implementation

now extend it

generate schema / XML file

How to generate the schema?

Jaxb has a schema generator. That can be used to generate an initial
schema and then modify it.

The goal is to get the table into java and then use it in the approach
to calculate molecular mass.

Element table: should be ok up to atomic number 82

source should be XML.

Generate the periodic table as the large XML file.

Then use the new loading code to load it.

Precision issue
---------------

Peter: remove Utils.roundToDecimals() from the main methods. Only use it
in the test case. The main methods should return full available
precision. I.e. in the PeptideProperties class, remove all methods that
have the decimals in the method call.

Outlook for this week
---------------------

XML

`schema for Elements`  
`build up periodic table`  
`parse it`

Precision

`remove methods with digits argument from PeptideProperties`

Peter:

`will provide feedback on the Profeat features.`

Andreas:

`fix cruisecontrol`
