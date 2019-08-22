---
layout: post
title:  "Legacy Code Help: Can't Call Code in Test"
categories: development
---
## What is Legacy Code ##

Legacy code means lots of things to different people. Generally though, most can agree that code that is hard to understand, hard to change or both is legacy code. Micheal Feathers in his book [Working Effectively with Legacy Code](https://www.amazon.com/dp/0131177052/ref=cm_sw_em_r_mt_dp_U_PcTxDbGHF7KWE) the defines legacy code as code that has no automated tests. As Micheal is part of the eXtreme Programming tradition when he says automated tests he means small fast tests where each test is focused on only a small part of the code. eXtreme Programming refers to these as Unit Tests. For more about what these sorts of tests look like and ways you might write them I recommend Anthony Sciamanna's article [xUnit is not Unit Testing](https://anthonysciamanna.com/2014/12/06/xunit-is-not-unit-testing.html). This article will focus on the idea that you want to modify some code, that code currently lacks tests, and that you want to add tests to support your new change.

## Stop Digging ##

This brings us to one of the core tenets of making any sort of improvement to a codebase long term. Accept that going forward you won't create new code that isn't up to your new standards and that when you modify existing code you will bring that modified code up to those standards. If you don't do this then what tends to happen, in my experience, is either new code written to the old standards grows faster than the improvement can keep pace with or the hardest to change code never gets improved and continues to bog down the codebase.

## Explanation of Example of Problems Calling Code You Want To Change ##

## Sprout Method ##

## Sprout Class ##

## Extract and Override ##

## Only the First Step ##