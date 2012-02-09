---
title: Algorithm Java port
---

Possible Java ports of Algorithms
=================================

We would be interested in having Java ports of the following algorithms:

`- Blast`  
`- Hmmer3`  
`- Dssp (some parts already available)`

### Couple of tools that might be useful for porting to Java

This software is available for $119 with a 15 day return.
<http://www.tangiblesoftwaresolutions.com/Product_Details/CPlusPlus_to_Java_Converter_Details.html>
It won't do perfect code but will get you close.

This is also an interesting approach <http://code.google.com/p/cibyl/>
where I can't imagine would work in a I/O or computationally intensive
application. Converting ASM to Bytecode takes out all the parsing
headaches. The JIT should still be able to take over and optimize.

I have used this before and works reasonably well.
<http://tech.novosoft-us.com/product_c2j.jsp> You get a Jar file that
maps all the ansi C libraries.
