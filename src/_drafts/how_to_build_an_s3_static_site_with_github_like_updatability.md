---
layout: post
title:  "How to Build an S3 Based Blog That Updates via Git Push"
categories: blog development
---
Would you like to have a blog that can withstand having a post on the front page of Hacker News, costs less than a dollar a month, and can be updated by just pushing to a Git repository? Perhaps you have tried hosting your blog on GitHub Pages but got frustrated by visitors sometimes having a long pause before the site loads, by the lack of HTTPS, or by the lack of control over how the static site is generated. Or maybe you tried out WordPress and were frustrated by the cost of the hosting, the constant need for security updates, or the poor performance.

If this sounds like you or maybe you just want to know how to host a static site easily on AWS S3 for other reasons then keep reading for step by step directions how to use S3, Travis CI, and GitHub to create a static site you can update easily, use your choice of static site generator for and that will never go down under load.

## Getting Started

First, you need to create a repository on GitHub and create a static site in it with the correct structure. What you want is a directory called "src" or something similar that will hold the raw form of your site/blog that will be compiled by your static site generator of choice. Most static site generators like Jekyll make it easy to generate a base site for a blog to get you started. Another option is to clone a blog you find on GitHub that you like or find a template at one of the various websites that have them. You're also welcome to clone the GitHub repository for this blog.

Next, you will want to setup an automated way via a script to setup the environment to build your static site, a single easy command to build it and likely one to deploy it on your local machine so you can see what it looks like before you deploy. I recommend either shell scripts or the build scripting tool of the language/environment your static site generator was created with. For this blog I am using Jekyll so I scripted it via Bundler and Rake. I recommend taking a look at Rakefile in this blog's repository to get an idea what you are looking for.