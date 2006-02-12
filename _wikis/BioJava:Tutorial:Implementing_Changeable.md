---
title: BioJava:Tutorial:Implementing Changeable
tags:
 - Tutorial
---

**By [Matthew Pocock](mailto:mrp@sanger.ac.uk)**

We are going to implement a simple `ChangeEvent` source that stores a
string `name` property and can inform other objects if this name
changes. By the end of this tutorial you should be comefortable with the
general issues surrounding implementing event sources and for ensuring
that resources are allocated as needed.

The Nameable interface
----------------------

By convention, BioJava always defines changes in an interface. This
allows a range of implementations to provide a unified API to a change
without mandaiting them to shair any code. We will define the `Nameable`
interface.

    package demos.Changeable;

    import org.biojava.utils.*;

    public interface Nameable extends Changeable {

The first thing we must do is define the `ChangeType` that indicates
that the name has changed. By convention, it is a public static final
field of the interface and is named in upper-case, with word boundaries
indicated by underscores. The constructor needs a description, and also
the name of the current class and the name of the field. This is so that
during serialization, the `ChangeType` instance will resolve correctly
both over time and between VMs.

      /**
       * The ChangeType that indicates that the name property has changed.
       */
      public static final ChangeType NAME = new ChangeType(
        "The name has changed.", // human-readable description
        "demos.Changeable",      // the current class name
        "NAME"                   // field name
      );

Now we have the definition of the accessor methods.

      /**
       * Return the name associated with this Nameable.
       *
       * @return the name property
       */
      public String getName();

      /**
       * Change the name associated with this Nameable.
       *
       * @param the new value for the name property
       * @throws ChangeVetoException if for any reason the name could not be set
       */
      public void setName(String name)
      throws ChangeVetoException;
    }

and that's it for the `Nameable` interface.

The simplest implementation - extend AbstractChangeable
-------------------------------------------------------

The simplest way to implement the `Nameable` interface is to inherit
from `AbstractChangeable`. This is the aproach we will take here.
Firstly we will define the class and add a couple of constructors.

    package demos.Changeable;

    import org.biojava.utils.*;

    public class SimpleChangeable
    extends AbstractChangeable
    implements Nameable {
      private String name;

      public SimpleChangeable() {
        this(null);
      }

      public SimpleChangeable(String name) {
        this.name = name;
      }

The getName method can also be written in the obvious way.

      public String getName() {
        return name;
      }

The process of informing listeners requires some bagage to be present -
in particular, the list of listeners. This would impose overhead on all
instances of `Changeable`, regardless of whether listeners exist or not.
The solution to this is to lazily instantiate the supporting objects.
Fortunately, `AbstractChangeable` handles all of this for you. The two
methods you need to use are `hasListeners()`, which will return `true`
if there are any listeners at all and false otherwise. If there are no
listeners, then the name can be set directly.

      public void setName(String name)
      throws ChangeVetoException {
        if(!hasListeners()) {
          this.name = name;
        } else {

If there are listeners, then the method `getChangeSupport` is used to
retrieve the `ChangeSupport` instance that maintains the listeners list.
You should then synchronize on this to ensure that no listeners are
added or removed while the name is being set.

          ChangeSupport cs = getChangeSupport(Nameable.NAME);
          synchronized(cs) {

Next, we make a new ChangeEvent to describe how the object wishes to
alter, we fire a preChange notification to the listeners so that they
have a chance to veto the change, we make the change and lastly we
inform the listeners that the change has been made.

            ChangeEvent ce = new ChangeEvent(this, Nameable.NAME, name, this.name);
            cs.firePreChange(ce);
            this.name = name;
            cs.firePostChange(ce);
          }
        }
      }
    }

That is the end of the implementation.

Using ChangeSupport directly
----------------------------

The previous example used `ChangeSupport` to store a list of listeners
but via the `AbstractChangeable` class. Java only allows classes to
inherit from one other class. This means that if you have a class that
must implement `Changeability` but already is derived from another
class, you can't use `AbstractChangeable`. You can, however, still use
`ChangeSupport`. To illustrate this, we will look at the code in
`AbstractChangeable` that wires in the `ChangeSupport` object.

`AbstractChangeable` is in the package `org.biojava.utils`, and
implements `Changeable`. It is abstract as you must sub-class to provide
code to actualy fire events.

    package org.biojava.utils;

    public abstract class AbstractChangeable implements Changeable {

The listener networks are not preserved during serialization. This is
partly to prevent arbitrarily large networks of objects being dumped,
and partly because listeners can be safely added in custom
serialization/deserialization code.

      private transient ChangeSupport changeSupport = null;

The hasListeners method is implemented in the obvious way. It is
protected, because it is realy a memory optimization method, and not
part of the external interface of extending classes.

      protected boolean hasListeners() {
        return changeSupport != null;
      }

To retrieve the `ChangeSupport` delegate, we need to provide an access
method. Again, this is protected and implemented in the obvious way.

      protected ChangeSupport getChangeSupport(ChangeType ct) {
        if(changeSupport == null) {
          changeSupport = new ChangeSupport();
        }

        return changeSupport;
      }

Some subclasses may wish to override this method and lazily instantiate
resoruces when the first listener for a particular `ChangeType` is
added. In this case, the overriden method should first call
`super.getChangeSupport` and then perform any checkes it wishes.

Now that the protected methods are in place, we can provide the bodies
of the listener management methods. These firstly use `getChangeSupport`
to retrieve the delegate, and then ask it to add or remove a listener.
We must synchronize on the delegate to make sure that it maintains in a
consistent state.

      public void addChangeListener(ChangeListener cl) {
        ChangeSupport cs = getChangeSupport(null);
        synchronized(cs) {
          cs.addChangeListener(cl);
        }
      }

      public void addChangeListener(ChangeListener cl, ChangeType ct) {
        ChangeSupport cs = getChangeSupport(ct);
        synchronized(cs) {
          cs.addChangeListener(cl, ct);
        }
      }

      public void removeChangeListener(ChangeListener cl) {
        ChangeSupport cs = getChangeSupport(null);
        synchronized(cs) {
          cs.removeChangeListener(cl);
        }
      }

      public void removeChangeListener(ChangeListener cl, ChangeType ct) {
        ChangeSupport cs = getChangeSupport(ct);
        synchronized(cs) {
          cs.removeChangeListener(cl, ct);
        }
      }
    }

And that is the end of the class. You should be able to cut-and-paste
this code into your own `Changeable` objects to implement the basic
delegate-management.

Using an abstract class to provide the event handeling
------------------------------------------------------

Often there are a number of implementatoins of an interface that are
almost exactly the same except for the particulars of how data is
stored. It is a shame to write the event code multiple times. A useful
design pattern for this is to provide an abstract class that takes care
of all the synchronization issues and calles stub methods to perform the
actual access to object state. Here is an example of that for the
`Nameable` class.

The abstract class will look like this.

    public abstract class AbstractNameable implements Nameable {
      public void setName(String name)
      throws ChangeVetoException {
        if(!hasListeners()) {
          setNameImpl(name);
        } else {
          ChangeSupport cs = getChangeSupport(Nameable.NAME);
          synchronized(cs) {
            ChangeEvent ce = new ChangeEvent(this, Nameable.NAME, name, this.name);
            cs.firePreChange(ce);
            setNameImpl(name);
            cs.firePostChange(ce);
          }
        }
      }

      protected abstract void setNameImpl(String name)
      throws ChangeVetoException;
    }

The implementation would look something like this.

    public class MyNameable extends AbstractNameable {
      private String name;

      public String getName() {
        return this.name;
      }

      public void setName(String name)
      throws ChangeVetoException {
        this.name = name;
      }
    }

This split between the abstract implementation that handles all of the
event guts and a realy light-weight implementation that controls access
to data-storage is very useful in practice, and is used extensively in
BioJava, particularly in the `org.biojava.bio.dist` package.

What next?
----------

By now, you should be able to define interfaces that are Changeable, and
to write implementations of these interfaces using AbstractChangeable or
by delegating to ChangeSupport directly. For cases where there are many
implementations that differ only in the means of data-storage, you
should be able to factor the Changeablility code into an abstract class,
and subclass this for each form of data-access.
