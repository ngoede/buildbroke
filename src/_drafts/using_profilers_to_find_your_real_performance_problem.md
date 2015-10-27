---
layout: post
title:  "Using Profilers to Find your Real Performance Problem"
categories: performance
---
This post is part of a series. If you are just joining us you can see the full series here.
-- List all posts with links

This post is all about what to do when you have decided to figure out what in your code might be leading to a performance problem you are seeing. Once you get some more insight into what is causing the problem in your code you can make a the choice if you should spend more time/money on changing the code to alleviate or eliminate the issue or if you should change or upgrade the environment.

I am going to use JetBrains DotTrace(Link to this) and C# for these examples but the concepts will generally apply to other languages and profilers. If you have never used a profiler at all it is probably a good idea to profile a very small application quickly and then poke around in the profiler to help you get some idea what is going on without getting overwelmed. If you are not using DotTrace some important things you need to figure out include determining how to attach the profiler to your system, how to tell it to start profilling, how to stop it, and how to generate its performance report.

When you fire up DotTrace you will see several options for how to attach or load your code into it. With DotTrace you idealy want it to start the application for you. This will allow it to do more in depth profiling. The three options to this effect are giving it an exe to run, pointing it at a windows service, or picking a web app hosted in your local IIS. You will also be given the option to start the profiling imediatly. Generally unless you are profiling the startup of your application you will not want to select this option. Instead we will manually start the profile later. There are two reasons for this choice:
* Activily profiling the application slows it down dramiticly and this may make it harder to get to the correct location in the application for the opertion you want to profile.
* It will cut down on the noise and irrelivent information in the performance report.

##Now that you have your application attached to the debugger
The next step is setting up your application to be able to trigger the operation you are trying to examine the performance up. The profiler will slow down the operation of your code so it is generally advisable to try to focus as tightly as possible. Once you have the application set up you should turn on the profiling, execute the operation, wait for it to complete, and then tell the profiler to generate its report.

##The performance report
Once the report generates you will be able to view the data in several different forms. In DotTrace my most common is a tree view that shows you a list of each thread in your application and then the methods it ran, and then under those the methods they called and so on until you hit just native code. Next to each method is the run time for that method and some other statistics. 