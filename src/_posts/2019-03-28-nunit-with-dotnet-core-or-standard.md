---
layout: post
title:  "Using NUnit To Test With .NET Core"
categories: development testing
---
With .NET Core a few things have changed about how unit testing frameworks work in .NET. They have created a standardized interface for test runners and libraries to plug in to. This allows you to do things like always be able to run your tests with the 'dotnet test' command. Due to this a few extra dependencies are required in order to be able to run your tests whether from the command line, Visual Studio, Resharper, or Rider.
<!--more-->
First, in order to write tests against a .NET Core or .NET Standard project you will want to have your test project also be .NET Core or Standard..

Second, you will need the following Nuget packages:

- NUnit
- Microsoft.NET.Test.Sdk
- NUnit3TestAdapter

The first package is the NUnit Framework itself. The second is the Microsoft plumbing that allows modern .NET test runners to work. Finally, we have the package that glues together the standard .NET test running infrastructure and NUnit. At this point you should be able to write your first test and successfully run it.
