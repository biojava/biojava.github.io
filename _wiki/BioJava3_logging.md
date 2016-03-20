---
title: BioJava3 logging
---

BioJava Logging Usage Policy
----------------------------

-   SLF4J established as BioJava logging facade
    -   <http://www.slf4j.org/>
-   Standard for initializing logger by class
    -   `private final static Logger logger = LoggerFactory.getLogger(<<Class_Name.class>>);`
    -   Where \<<Class_Name.class>\> like “BioJavaAADemo.class”
        -   Note, use current (this) class’ name
-   Use SLF4J substitution pattern (`‘{}’`)
    -   Most importantly, for efficiency. String concatenation is
        avoided and toString() is not called if the logging statement is
        filtered.
        -   Meaning if logging level is set to INFO, then all strings in
            any DEBUG statements will not be concatenated/toString()’d
        -   Also, calls to `isDebugEnabled()` or DEBUG constant is not
            necessary and redundant
    -   Enhances readability/conciseness
    -   Example:
        `logger.info("Protein Sequence: {}, Peptide Properties: {}", pSequence.getAccession(), peptide.getIsoelectricPoint(pSequence));`
-   No “magic” logs; meaning logs should stand alone, and be reasonable
    understandable to an independent developer.
    -   No printing of random IDs standalone
        -   `logger.info(protein.getAccesstion());`
    -   No random symbols
        -   `logger.debug(“>>>@+”);`
    -   Mostly, just add context to the log statement
-   Demo classes
    -   Should use `System.out` for logging and other output
        -   For simplicity
-   Logging Levels
    -   Production, log level set to: WARN
    -   Test, log level set to: INFO
    -   Error (logger.error)
        -   Serious issue, fatal error, process can not continue.
        -   Must be investigated immediately.
        -   No system can tolerate items logged on this level.
        -   <u>Example</u>: NPE, database unavailable, mission critical
            use case cannot be continued.
    -   Warning (logger.warn)
        -   The process may be able to continue, but not necessarily
            guaranteed.
        -   The application may be able to tolerate warning messages,
            but they should always be justified and examined.
        -   <u>Example</u>: “Application running in development mode”,
            “Administration console is not secured with a password”, or
            “Format not recognized”.
    -   Info (logger.info)
        -   Important business process information
            -   Process started/finished
        -   In an ideal world, administrator or advanced user should be
            able to understand INFO messages and quickly find out what
            the application is doing.
        -   An action that changes the state of the application
            significantly (database update, external system request).
        -   <u>Example</u>: if an application is all about booking
            airplane tickets, there should be only one INFO statement
            per each ticket saying “[Who] booked ticket from [Where] to
            [Where]“.
    -   Debug (logger.debug)
        -   Developers stuff exclusively.
    -   Trace (logger.trace)
        -   Very detailed information, intended only for development.
        -   The distinction between DEBUG and TRACE is the most
            difficult, but if you put logging statement and remove it
            after the feature has been developed and tested, it should
            probably be on TRACE level.

### References

Data in “Logging Levels” section borrowed from:
<http://www.javacodegeeks.com/2011/01/10-tips-proper-application-logging.html>
