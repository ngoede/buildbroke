---
layout: post
title:  "# Ways you are Doing TDD Wrong"
categories: programing tdd
---
1. You think TDD is about writing/generating all the tests for the feature you plan to write in advance AND then writing all the code.
2. You think most of your tests should be writen from the perspective of the end user and should execute the entire system.
3. You can't tell what production code your test is testing from just looking at the contents of the test.
4. You can't figure out what the test is asserting.
5. You can't tell why the test is asserting what it is. The name of the test is unclear and/or the setup is unclear. Tests should be explainitive in addition to being tests.
6. Everytime you go to make a small change to the production code you have to make a large change to tests. This is often expressed in the form of changing many tests at once for one change.
7. Writing a new test or modifying an existing one results in more than 10 minutes of work changing production code. 
8. Your test suite takes long enough to run that it doesn't get run.
9. When you run your tests sometimes they pass and sometimes they fail even though no code changes between runs.
10. You have tests that have no obvious way to break. It should be easy to figure out what change to the code would result in a test breaking. No, adding a throw exception line doesn't count.