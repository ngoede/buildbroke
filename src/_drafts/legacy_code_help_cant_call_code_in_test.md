---
layout: post
title:  "Legacy Code Help: Can't Call Code in Test"
categories: development
---
## What is Legacy Code

Legacy code means lots of things to different people. Generally though, most can agree that code that is hard to understand, hard to change or both is legacy code. Micheal Feathers in his book [Working Effectively with Legacy Code](https://www.amazon.com/dp/0131177052/ref=cm_sw_em_r_mt_dp_U_PcTxDbGHF7KWE) the defines legacy code as code that has no automated tests. As Michael is part of the Extreme Programming tradition when he says automated tests he means small fast tests where each test is focused on only a small part of the code. Extreme Programming refers to these as Unit Tests. For more about what these sorts of tests look like and ways you might write them I recommend Anthony Sciamanna's article [xUnit is not Unit Testing](https://anthonysciamanna.com/2014/12/06/xunit-is-not-unit-testing.html). This article will focus on the idea that you want to modify some code, that code currently lacks tests, and that you want to add tests to support your new change.

## Stop Digging

This brings us to one of the core tenets of making any sort of improvement to a codebase long term. Accept that going forward you won't create new code that isn't up to your new standards and that when you modify existing code you will bring that modified code up to those standards. If you don't do this then what tends to happen, in my experience, is either new code written to the old standards grows faster than the improvement can keep pace with or the hardest to change code never gets improved and continues to bog down the codebase.

## Explanation of Example of Problems Calling Code You Want To Change

There are a number of the common problems related to trying to call legacy code in tests when it wasn't written with tests in mind. Typically, we are talking about code in a typical Object Oriented style language so we will start with problems related to constructing the object itself in a test harness.

Roughly speaking there are two major issues you may run into constructing an object in a test. The first is that the object may require a dependency be passed in that itself can not be constructed in a test and can not be easily substituted for. Often this is a concrete dependency(NOTE: Find a definition to link to). The second is that the object does something problematic in the constructor itself. Examples of this could include construction of a problematic dependency inline, hitting the database, or using a global variable. As a general rule, the more code you see inside the constructor and the more concrete instead of abstracted dependencies it has the more likely it is you will have problems constructing it in a test.

The next source of problems we encounter is in the method or function we want to write a test for. Some of these problems mirror the constructor issues such as use of problematic dependencies. However, you will also encounter issues that people not experienced in writing unit tests in code will never give a second thought to. These include things like using built-ins in the language for getting the current date or time, generating random numbers, or using framework constructs. All of these either need to be controlled within the context of the test or require that we harness way more of the system in a test than we like. Our tests, for instance, shouldn't have to run with in the context of web server.

## Legacy Code Paradox

One of the hardest things about working with Legacy Code is that we don't want to change it because it is hard to understand and lacks tests but we often can't write tests without changing it. This leads us to two conclusions.

1. We may need temporary tests that don't meet our normal expectations or standards for tests. They might be slow or depend on things we would rather they don't. They might even require manual setup or be entirely manual. This is okay because these tests serve as scaffolding to help us refactor safely so we can write tests we will keep.
2. We may need to carefully perform a minimal amount of refactoring type changes without the safety net of tests. In the event we need to use this it is important we lean on our tools as much as possible and take very small steps.

Tests that are used as scaffolding to support making changes that will allow us to write tests we are happy keeping are often called characterization or pining tests. Unlike normal unit tests these tests are less focused on specifying what the code should do and more on locking down what it currently does. This is because, with legacy code we are assuming, other than the change we want to make, that it works correctly in production. Therefore, for now, we just want to find out what the code does and create tests that try to lock that down so that when we refactor the code to allow unit tests we don't change the behavior in the process. Sometimes you will find bugs during this process and it is important to note them but wait until you are past this stage to address them. Right now we just want to lock down functionality and then refactor to support writing unit tests. We can then drive those bug fixes with unit tests and be confident we are only making the changes we intend.

Of course all of this needs to be approached pragmatically. We want to write tests that lock down as little code as possible allowing us to refactor and make it possible to make the changes we need to make. This means you shouldn't just write tests for code you don't need to change and you should try to isolate and do this with the smallest bit of code you possibly can and still make your changes.

## Some Tools

The following are some tools that will help you out of difficult situations involving code you can't call or objects you can't construct in test. They do so by either creating, quickly, a new isolated place to add your changes or allow you to separate out the parts that interfere with testing so you can focus on the parts you need to change and can write tests for. All of them will look like they move the design backwards or don't fix the bigger problems. This is true. However, they start to create areas of code that we can safely refactor and this redesign. As you continue to address legacy code and write tests larger and large parts of the code will become open to redesign.

### Sprout Method

The first of these tools that we are going to discuss is Sprout Method. It is applicable when you need to make a modification inside an existing logic flow, like a large method for instance, that you either can't call in a test harness easily or that is complex in a way that makes it hard to test the effect of your intended changes. Sprout method allows you to use tests to drive out the new functionality without getting bogged down in refactoring the existing method. However, this is also its downside. It lets you write new code but doesn't improve the existing code. However, if the alternative is writing new code without tests than the trade-off is clearly worth it. This can be a good way for a team to get started working with legacy code without getting bogged down in make existing code testable.

The first step of applying Sprout Method is to identify the place in the existing code where you need to make a change. Often this will involve taking some variable or data that the existing code is using, processing it in some fashion, and then continuing on with the existing logic flow from there. In the following code you can see example(much simpler than is realistic of course) of code where we have identified the location where we want the modification to occur.

{% gist 7de4d2909a4cf583d61c372888649b24 %}

Next, we add the call to the new method we want to make in the spot it is needed, passing existing variables required for the new logic (a small number, if not see Sprout Class bellow) as parameters and setting the return value to an existing variable if needed. Then create the new method, ideally asking your tool such as an IDE to do it for you.

{% gist 59c96d313c1492cffd6cf9af123620a9 %}

Now, we should have a method that is empty except for possibly returning something to make the compiler happy. If it is not already make the method public and proceed to drive out its logic with tests refactoring along the way.

### Sprout Class

This next tool is very similar to Spout Method. However, instead of creating a new method we will create a whole new class. One of the more obvious reasons to use this over sprout method is when we cannot find a straightforward way to make the original class that we want to modify able to be instantiated in a test harness.

The first step in Sprout class is the same as Spout Method, identify the place in the existing code where we need to make our change or add new code. Then, create a new class that will hold this code. Now, identify if any existing dependencies created by the old class will be needed by the new. Once this is done new up the new class at the spot identified previously and pass in any relevant dependencies to the constructor. Now, add a method to the new class that will do the work and call it from the existing code passing in any date it will require as method parameters and using the return value to set an existing variable as required. Finally, use TDD to develop the new method in the new class.

### Extract and Override

Extract and Override is in some ways the opposite of the previous two techniques. Previously, we got around troublesome code by taking our new code and putting it outside the grasp of the problematic code but with extract and override we instead remove the problematic code from the rest of the code and then make our changes with tests. This approach serves us best when either a single dependency(or a very small number of them anyway) is the problem or a small number of lines of code are the problem.

It works by identifying this code, such as a call to the database or code to get the current date and time, and moving it carefully to its own method. Then, we can inherit from the the original class and replace the untestable code with something that either tracks calls to that method(if we need to check that in the test) or does nothing. Then we can write tests for the original code(just enough to let us start changing it) and then refactor the code and TDD the new changes.

Follow up steps might include extracting the new method as a separate dependency that can be injected into the class. This is particularly useful to help us break down large objects or if the functionality of the new dependency would be useful elsewhere.

## Only the First Step

Something I cannot stress enough about working in legacy code and the improvement there of is that it is a process. Many of the techniques in this article may even seem like they made the design worse. Sometimes this true in a sense but what they have done no mater what is help to stop making the hole you are in deeper and make code that is easier to improve in the future. As you continue to work with in the legacy code and rehabilitate the parts you need to change more and more of the code that actually changes will become no longer legacy code and you will also see the design improve as the shackles of worry are taken off and you can change the design with confidence and greater ease. Many larger code bases will tend to have substantial bits of code that hardly ever change or even never change. It is perfectly normal for these parts to be rehabilitated more slowly or even stay legacy code. Resist the temptation to turn your rehab project into a rewrite.
