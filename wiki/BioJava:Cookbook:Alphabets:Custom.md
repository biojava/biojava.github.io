---
title: BioJava:Cookbook:Alphabets:Custom
---

How do I make a custom Alphabet from custom Symbols?
----------------------------------------------------

This example demonstrates the creation of a 'binary' alphabet that will
have two Symbols, zero and one. The custom made Symbols and Alphabet can
then be used to make SymbolLists, Sequences, Distributions etc.

    import org.biojava.bio.symbol.*;
    import org.biojava.bio.*;
    import java.util.*;

    public class Binary {
      public static void main(String[] args) {

        //make the "zero" Symbol with no annotation
        Symbol zero =
            AlphabetManager.createSymbol("zero", Annotation.EMPTY_ANNOTATION);

        //make the "one" Symbol
        Symbol one =
            AlphabetManager.createSymbol("one", Annotation.EMPTY_ANNOTATION);

        //collect the Symbols in a Set
        Set symbols = new HashSet();
        symbols.add(zero); symbols.add(one);

        //make the Binary Alphabet
        FiniteAlphabet binary = new SimpleAlphabet(symbols, "Binary");

        //iterate through the symbols to show everything works
        for (Iterator i = binary.iterator(); i.hasNext(); ) {
          Symbol sym = (Symbol)i.next();
          System.out.println(sym.getName());
        }

        //it is usual to register newly creates Alphabets with the AlphabetManager
        AlphabetManager.registerAlphabet(binary.getName(), binary);

        /*
         * The newly created Alphabet will have been registered with the
         * AlphabetManager under the name "Binary". If you retreive an instance
         * of it using this name it should be canonical with the previous instance
         */
        Alphabet alpha = AlphabetManager.alphabetForName("Binary");

        //check canonical status
        System.out.println(alpha == binary);
      }
    }
