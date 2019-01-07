---
title: Documentation
permalink: wiki/Documentation
menu: main
---

There are three main sources of documentation for BioJava: the tutorial, the cookbook and the Javadoc APIs. The most appropiate one will depend on you needs. As a rule of thumb, the tutorial is best suited for beginners looking for an introduction to the general structure and features of the library, while the cookbook is intended for more advanced users looking for a specific use case. Another useful guide are the demos in each BioJava module.

The BioJava tutorial
--------------------

The goal of the tutorial is to give an educational introduction into some of the features that are provided by BioJava and each of its modules.

The tutorial is being hosted on GitHub at [https://github.com/biojava/biojava-tutorial](https://github.com/biojava/biojava-tutorial).

The BioJava CookBook
--------------------

The CookBook is a collection of common bioinformatics problems solved using BioJava explained step by step. The CookBook was included in the mediawiki pages and it has been migrated to the current website.
You can access it [here](BioJava%3ACookBook4.0).

The Javadoc APIs
----------------

And finally the collection of Javadoc APIs. The link will take you to the generated HTML version of the Javadoc. You can choose from the following versions:

{% comment %}
    List all biojava versions.

    Relies on site.static_files, which lists all static files. Matches /docs/api<version>/*

    Note that the split starts with an empty "", so the api is in position 2. Directories are not
    enumerated, so we get it from each file and then get a unique list as a second step.

    Adds about 40s to the build time.
{% endcomment %}
{%- capture versions -%}
    {%- for file in site.static_files-%}
        {%- assign splitpath = file.path | split: '/' -%}
        {%- if splitpath.size == 4 and splitpath[1] == "docs" and splitpath[2] contains "api" -%}
            {{splitpath[2]|replace_first:"api", ""}},
        {%- endif -%}
    {%- endfor %}
{%- endcapture -%}
{%- assign uniq_versions = versions | split: "," | uniq | sort_natural | reverse-%}
{% for version in uniq_versions %}
{%- if version != "" -%}
* [Javadoc API for BioJava {% if version < "3.0.0" %}legacy {% endif %}{{version}}]({{site.baseurl}}/docs/api{{version}}/index.html)
{% endif -%}
{% endfor %}
