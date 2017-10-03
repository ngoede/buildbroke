---
layout: post
title:  "The Failure of Infinite Capacity - A Product Management Trap"
categories: product-management product agile
---
One of the main principals of agile software development according to the [Agile Manifesto](http://agilemanifesto.org/principles.html) is that teams will work to continuously deliver valuable software. Further, they will do this by working on and delivering the features and capabilities that provide the greatest value first. Obviously, any understanding of the value a particular feature delivers is a hypothesis based on the teams current understanding of the Customer's[^1] needs. By learning as they release new software into production they can evolve their understanding of the Customer's needs. This fact allows teams to continue to make software more valuable without necessarily trailing off in their ability to do so.

However, a common desire from stakeholders and product managers is to get more done faster. This would be fine and dandy except that it is often not accompanied by a corresponding increase in feedback and customer based product development. This means if the team keeps adding new things to work on without new learning and does so in order of value then the last item the add will be the least valuable. <!--more-->

The result of this is that the longer the list of things a team works on before going back to customers for feedback the lower the average value of each feature. Even if we assume the the minimum value of a feature is greater than zero(which I think is unlikely) the average value of a feature will approach the minimum possible. Additionally,  since increases in capacity are inevitably associated with hiring more staff, costs increase. Even if we naively assume that productivity will increase linearly this just means that costs increase at the same rate[^2]. Therefore, the more capacity the organization has the greater chance they are doing work that is less valuable than the cost of doing it.

![Cost of Feature Development vs Value](/images/costOfFeatures.png)

Rather than maximize capacity for feature development organizations should strive to balance capacity for development with capacity for feedback and product development. Further, they should recognize that the answer for how to grow the product is not always more software development.

[^1]: In this context Customer stands in for what ever number of people or organizations that your software solves problems or provides value for.
[^2]: Often as has been understood in software development for [years](https://en.wikipedia.org/wiki/The_Mythical_Man-Month) costs actually rise faster than productivity because each additional staff member increases overhead and thus provides less value than the previous staff member. This only serves to make the situation worse.
