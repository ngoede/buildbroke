---
layout: post
title:  "So, You Have a Performance Problem?"
categories: performance
---
Performance problems in software systems can be very frustrating. They often come about just when you are feeling most successful in your business or product. You have more users or prospects than ever and things are breaking down. There are a number of ways you might have found out about this. Here are a few:
* Your users are complaing (Hint: Your performance monitoring might be lacking.)
* Through your performance monitoring
* Your system goes down (Not good, do just about whatever it takes to get back up even if it is a bandaid)

##Well this is great. What am I supposed to do now?
Your first step is to figure out what physical computing resource is running out and determine if your problem will be better fixed through changing your hardware or changing your code. Hopefully, your existing performance monitoring solution can help you with this. If not then either get a commercial monitoring solution such as [New Relic](https://newrelic.com/) or if your system is simple enough use the performance monitoring built into the operating system of the hardware your system runs on.

Generally you are going to expect to find that either your CPU is maxed out in some fashion(This might just be one core if your system is single or primarily single thread dependent), your memory usage is maxed, you are seeing lots of waiting for storage or you are getting strange network behavior(bandwith, latency, or droped packets for instance). If none of these appear to be problem then your issue may be one of some other system resource being capped such as connections to end users or connections to the database. Remember you need to check every server involved in your system. Your webserver might be fine even as your database is falling over.

If you identify a CPU, memory, or storage constraint as the bottleneck then your first question should probably be "What would it cost me to upgrade my hardware such that this problem goes away?". Assuming this problem seems tied to number of users or amounnt of business the users are doing in your system the next question should be "How long would that solution last me?".

##Whats next?
Now, that you know the answer to those two questions you need to find out an estimate of what it would cost (in dollars or person hours) to find the bottlenecks in the code and if this would be cheap enough what it would cost to make them perform better on the existing hardware or some hardware that is different than current but would be cheaper than what you figured out above. Given that you now know what it would cost to fix this problem either by hardware upgrades or changing the code you should be able to make a choice about which would provide the highest ROI for your system or product.

##Next time
In the next post in the series we will look into how to find the problem in your code if you decide to go that route.