---
title: BioJava:CookbookPortuguese
---

BioJava in Anger - um livro de receitas para aqueles que tem pressa
-------------------------------------------------------------------

BioJava pode ser grande e intimidador. Este documento foi montado para
aqueles que, como nós, tem pressa em obter resultados e ir direto ao
ponto, com a finalidade de auxilia-los no desenvolvimento de programas
utilizando Biojava. Cerca de 99% das tarefas comuns no uso do Biojava
estão descritas aqui, de forma que não se faz necessário decorar 99% de
sua API.

A página foi inspirada em vários outros livros de receitas e segue a
linha "Como eu faço...?". Cada "Como eu faço?" esta linkado a alguns
codigos de exemplo que faz o que voce precisa e algumas vezes mais do
que espera. Basicamente se voce encontrar o código voce pode copiá-lo e
colá-lo em seu programa e ele irá executar normalmente. Eu esforcei-me
ao máximo para manter o código o mais óbvio possível.

Biojava in Anger é mantido por [Mark Schreiber](User:Mark "wikilink").
Se voce tem qualquer sugestão, dúvidas ou comentários contate a [lista
do biojava](mailto:biojava-l@biojava.org). Para se inscrever na lista
clique [aqui](http://biojava.org/mailman/listinfo/biojava-l)

Esta tradução para o Portugues (Brasil) é mantida por [ Dickson S.
Guedes](User:Guedes "wikilink"), porém não está completa, isto não
impede que seja alimentada com maiores informações pois, por se tratar
de um sistema Wiki, correções podem ser feitas desde que estejam de
acordo com o documento original [neste
link](BioJava:Cookbook "wikilink").

Anúncios
--------

Você encontra também a versão em
[Francês](Biojava:CookbookFrench "wikilink") do 'Biojava in Anger'
(traduzido por Sylvain Foisy).

Você também pode ler uma versão em
[Japonês](http://www.geocities.jp/bio_portal/bj_in_anger_ja/) (traduzida
por Takeshi Sasayama and Kentaro Sugino, atualizada em 14 Ago 2004).

Ou ainda em
[Chinês](http://www.cbi.pku.edu.cn/chinese/documents/PUMA/biojava/index-cn.html)?
(traduzido por Wu Xin).

Apresentações
-------------

Está é uma apresentação no PowerPoint para [API do BioJava API
1.4](http://www.biojava.org/docs/bj_in_anger/BioJavaAPI.ppt) (uma versão
traduzida está sendo providenciada)

Publicações
-----------

Busque informações no [Google
Scholar](http://scholar.google.com/scholar?q=biojava) sobre publicações
a respeito do BioJava.

Como eu faço para....?
----------------------

### Instalação

-   [Onde eu encontro a instalação do
    Java](http://java.sun.com/downloads/)? (esta página está
    exclusivamente em Ingles)
-   [Como obter a instalação do BioJava](BioJava:GetStarted "wikilink")?
    (esta página está exclusivamente em Ingles)

### Alfabetos e Simbolos

-   [Como obter o Alfabeto de DNA, RNA ou
    Proteina](Biojava:CookbookPortuguese:Alphabets "wikilink")?
-   [Como crio alfabetos customizados a partir de simbolos
    customizados](Biojava:CookbookPortuguese:Alphabets:Custom "wikilink")?
-   [Como crio um CrossProductAlphabet, por exemplo, um alfabeto de
    codons](Biojava:CookbookPortuguese:Alphabets:CrossProduct "wikilink")?

### Manipulação básica de sequencia

-   [Como eu crio uma Sequence a partir de uma String ou como eu crio
    uma String a partir de um objeto
    Sequence](Biojava:CookbookPortuguese:Sequence "wikilink")?

### Tradução e transcrição

-   [Como eu faco para transcrever DNA em RNA e este em
    Proteina](Biojava:CookbookPortuguese:Translation "wikilink")?

### Proteoma

-   [Como eu calculo a massa e o pI de um
    peptideo](Biojava:CookbookPortuguese:Proteomics "wikilink")?

### Sequencia de E/S

-   [Como eu escrevo Sequencias no formato
    Fasta](Biojava:CookbookPortuguese:SeqIO:WriteInFasta "wikilink")?

### BLAST e FASTA

-   [Como eu configuro um parser
    BLAST](BioJava:CookbookPortuguese:Blast:Parser "wikilink")?

### Contabilizações e Distribuições

-   [Como eu posso contar os residuos em uma
    Sequence](BioJava:CookbookPortuguese:Count:Residues "wikilink")?

### Interfaces de Usuário

-   [Como eu posso visualizar Anotações e características como
    árvore](BioJava:CookbookPortuguese:Interfaces:ViewAsTree "wikilink")?
-   [Como eu posso exibir uma sequencia na Interface
    Gráfica](BioJava:CookbookPortuguese:Interfaces:ViewInGUI "wikilink")?
-   [Como eu posso exibir uma Sequencia de
    coordenadas](BioJava:CookbookPortuguese:Interfaces:Coordinates "wikilink")?
-   [Como eu posso exibir
    características](BioJava:CookbookPortuguese:Interfaces:Features "wikilink")?
-   [Como eu posso exibir características sumárias da Proteina /
    Peptideo](BioJava:CookbookPortuguese:Interfaces:ProteinPeptideFeatures "wikilink")?

### BioSQL and Sequence Databases

-   [How do I set up BioSQL with
    PostgreSQL](BioJava:CookbookPortuguese:BioSQL:SetupPostGre "wikilink")?
    (by [David Huen](User:David "wikilink"))
-   [How do I set up BioSQL with
    Oracle](BioJava:CookbookPortuguese:BioSQL:SetupOracle "wikilink")?
    (by [Richard Holland](User:Richard "wikilink"))
-   [How do I add, view and remove Sequence Objects from a BioSQL
    DB](BioJava:CookbookPortuguese:BioSQL:Manage "wikilink")?

### Genetic Algorithms

-   [How can I make a Genetic Algorithm with
    BioJava](BioJava:CookbookPortuguese:GA "wikilink")?

### Estrutura da Proteina

-   [Como eu posso ler um arquivo
    PDB?](BioJava:CookbookPortuguese:PDB:read "wikilink")
-   [Como eu posso mutar um
    residuo?](BioJava:CookbookPortuguese:PDB:mutate "wikilink")

### Protein Alignments and Secondary Structure Prediction with STRAP (by Christophe Gille)

-   [Introduction to the STRAP
    API](http://www.charite.de/bioinf/strap/Scripting.html)
-   [STRAP/BioJava
    interoperability](http://www.charite.de/bioinf/strap/biojava.html)
-   [How do I make a multiple sequence
    alignment](http://www.charite.de/bioinf/strap/biojavaInAnger_SequenceAligner.html)?
-   [How can predict protein secondary
    structure](http://www.charite.de/bioinf/strap/biojavaInAnger_SecondaryStructure_Predictor.html)?

Disclaimer
----------

This code is generously donated by people who probably have better
things to do. Where possible we test it but errors may have crept in. As
such, all code and advice here in has no warranty or guarantee of any
sort. You didn't pay for it and if you use it we are not responsible for
anything that goes wrong. Be a good programmer and test it yourself
before unleashing it on your corporate database.

Copyright
---------

The documentation on this site is the property of the people who
contributed it. If you wish to use it in a publication please make a
request through the [biojava mailing
list](mailto:biojava-l@biojava.org).

The code is [open-source](wp:Open source "wikilink"). A good definition
of open-source can be found
[here](http://www.opensource.org/docs/definition_plain.php). If you
agree with that definition then you can use it.
