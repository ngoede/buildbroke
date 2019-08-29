---
layout: post
title:  "Legacy Code Help: Can't Call Code in Test"
categories: development
---
## What is Legacy Code ##

Legacy code means lots of things to different people. Generally though, most can agree that code that is hard to understand, hard to change or both is legacy code. Micheal Feathers in his book [Working Effectively with Legacy Code](https://www.amazon.com/dp/0131177052/ref=cm_sw_em_r_mt_dp_U_PcTxDbGHF7KWE) the defines legacy code as code that has no automated tests. As Michael is part of the Extreme Programming tradition when he says automated tests he means small fast tests where each test is focused on only a small part of the code. Extreme Programming refers to these as Unit Tests. For more about what these sorts of tests look like and ways you might write them I recommend Anthony Sciamanna's article [xUnit is not Unit Testing](https://anthonysciamanna.com/2014/12/06/xunit-is-not-unit-testing.html). This article will focus on the idea that you want to modify some code, that code currently lacks tests, and that you want to add tests to support your new change.

## Stop Digging ##

This brings us to one of the core tenets of making any sort of improvement to a codebase long term. Accept that going forward you won't create new code that isn't up to your new standards and that when you modify existing code you will bring that modified code up to those standards. If you don't do this then what tends to happen, in my experience, is either new code written to the old standards grows faster than the improvement can keep pace with or the hardest to change code never gets improved and continues to bog down the codebase.

## Explanation of Example of Problems Calling Code You Want To Change ##

There are a number of the common problems related to trying to call legacy code in tests when it wasn't written with tests in mind. Typically, we are talking about code in a typical Object Oriented style language so we will start with problems related to constructing the object itself in a test harness.

Roughly speaking there are two major issues you may run into constructing an object in a test. The first is that the object may require a dependency be passed in that itself can not be constructed in a test and can not be easily substituted for. Often this is a concrete dependency(NOTE: Find a definition to link to). The second is that the object does something problematic in the constructor itself. Examples of this could include construction of a problematic dependency inline, hitting the database, or using a global variable. As a general rule, the more code you see inside the constructor and the more concrete instead of abstracted dependencies it has the more likely it is you will have problems constructing it in a test.

The next source of problems we encounter is in the method or function we want to write a test for. Some of these problems mirror the constructor issues such as use of problematic dependencies. However, you will also encounter issues that people not experienced in writing unit tests in code will never give a second thought to. These include things like using built-ins in the language for getting the current date or time, generating random numbers, or using framework constructs. All of these either need to be controlled within the context of the test or require that we harness way more of the system in a test than we like. Our tests, for instance, shouldn't have to run with in the context of web server.

## Legacy Code Paradox ##

One of the hardest things about working with Legacy Code is that we don't want to change it because it is hard to understand and lacks tests but we often can't write tests without changing it. This leads us to two conclusions.

1. We may need temporary tests that don't meet our normal expectations or standards for tests. They might be slow or depend on things we would rather they don't. They might even require manual setup or be entirely manual. This is okay because these tests serve as scaffolding to help us refactor safely so we can write tests we will keep.
2. We may need to carefully perform a minimal amount of refactoring type changes without the safety net of tests. In the event we need to use this it is important we lean on our tools as much as possible and take very small steps.

## Sprout Method ##

## Sprout Class ##

## Extract and Override ##

## Only the First Step ##
