---
layout: post
title:  "How to Interview Developers"
categories: development management
---
Interviews for software development are often very broken and there are [lots](https://medium.com/@evnowandforever/f-you-i-quit-hiring-is-broken-bb8f3a48d324) of [articles](https://www.daedtech.com/the-whiteboard-interview-adulthood-deferred/) explaining how. The [history](https://twitter.com/Hillelogram/status/962424365819277312) of one of the more popular questions demonstrates how reason is often left behind in interview design. Google, one of the more famous users of complex coding problems and whiteboard interviews, found that their interview process no better at [predicting success than random chance](https://www.theregister.co.uk/2013/06/20/google_hiring_procedures/). In other words, choosing randomly from all the resumes would have gotten them just as many successful employees and just as many not as their interview process did. It is quite clear we waste lots of time and money to get at best middling results from our interview processes in general.

Thankfully, it is not all hopeless. In addition to the many that have written about the problems with interviews there are many people trying to find better ways to choose successful coworkers. In his book [Joy Inc.](https://www.amazon.com/gp/product/1591847125/ref=as_li_qf_asin_il_tl?ie=UTF8&tag=nickgoede-20&creative=9325&linkCode=as2&creativeASIN=1591847125&linkId=b939d12c6903616cf1e393484ba9d8a5) Richard Sheridan talks about the interview process that they use at [Menlo Innovations](http://menloinnovations.com/). It focuses on creating a simulation of how real work at Menlo is done. Also, the interview process at Menlo is designed so that the candidate interacts with their actual perspective coworkers. Then those same coworkers are the ones to decide if they want to make the candidate an offer.

## The Simulated Work Interview

Having spent hundreds of hours interviewing software developers for positions both junior and senior I have come to the conclusion that simulating the work is often an excellent place to get started with job interviews. To that end this article will describe some of the practices that seem to have worked well for me. A lot of what I think makes an effective interview is related to how the work is done in the team that is hiring. So that said, take the method described in this article as an example to get you started and not a prescription.

Interviews serve several different primary purposes:

* Evaluating the candidate's ability to do the core work
* Evaluating the candidate's ability to work well with their perspective teammates
* Selling the candidate on wanting to take the job

A great way get started meeting all three of these purposes is to have the candidate do some sort of simulated work activity with their perspective team members. This serves both to help the team evaluate the candidate but also to give the candidate a realistic impression of what working on the team will be like.

## Ideas for Simulated Work Activities

My favorite simulated work activity for teams that pair program is to conduct a [pairing interview](https://www.youtube.com/watch?v=x6MnEZlW7pU). If you can the best way to do this is to have the candidate pair with one or two members of the team on actual work the team is doing at the moment. If having them work on actual production code would be problematic then create a task or series of tasks just for interviews. It is _very important_ that these tasks are not brain teasers disguised as programing problems. However, it should be something with a bit of meat so no [Fizz Buzz](http://wiki.c2.com/?FizzBuzzTest) either.

If possible break out some task the team has done in the past and find a way to make it possible in a stand-alone environment. If that does not work for the team there many [code katas](http://codekata.com/) available that code serve as the basis for a pairing interview. Remember that the candidate is dealing both working with new people and on potentially new things but also under the stress that we all face knowing we are being evaluated.

However, if your team doesn't pair program you should not including pairing in the interview as it does not give the candidate a realistic portrayal of the job. Other options include giving the candidate a short non-essential contract(which you should pay them for) then evaluate and discuss their work as you would another team members. If that is not possible another option I have explored is to have the candidate review code(either real or created for the purpose). Ensure that you discuss not just the issues but also how they would deal with them. This is an example of a code review exercise Anthony Sciamanna and I created in the past and taken from [this repository](https://github.com/ngoede/interview-exercise).

{% gist adfd1381e4cd03ab70842473ccb98beb %}

The common theme of all of these suggestions are that they allow the candidate to experience the real work or as close to it as the team can make possible and that they interact with actual team members during the interview. This serves to educate the candidate on the position, provide a realistic opportunity for the team to evaluate their work, and provide for interaction with the team.

## What Else Should be in the Interview

The rest of the interview should consist of helping the candidate understand what the position is, making them comfortable, answering any general questions they have about the organization or job, and trying to learn what they value in a position and organization. These parts are already fairly common in interviews so I will not go into detail about them but remember that the purpose is as much about learning about the candidate as it is about them learning about the position and why they should be interested.

Regardless of exactly how the interview is structured the candidate should be informed in advance what the process will be. This allows them to prepare and potentially ask questions about how the interview will work. As interviewers this is to your benefit as it will reduce nervousness caused by the interview process and lead to better conversations. It may also lead to some candidates self-selecting to not continue but this is preferable to blindsiding them with an interview they are uncomfortable with.

Lastly, you should make a decision on the candidate in a timely manner and allow the candidate to know the results as soon as possible. Candidates that don't hear back in a timely manner will often assume that the result of the interview was a no and that the company does not respect candidates enough to communicate that. This can lead to having a reputation as not valuing the time of candidates which many people will also take to reflect.

## Final Thoughts and the Future

Unfortunately, as Google found out, it is very possible for an interview process you think works well to in fact be no better than random chance. As the advice above is based on my direct experiences and the writings of others and not on scientific study you should take it with due skepticism. Even more troubling is the possibility that certain types of interviews may be biased against certain type of candidates that would otherwise be awesome for the position. This is a very serious concern and requires hard work from the industry to learn how to do better. It is my hope that making interviews more like the work is a way to reduce structural bias in the interview but I can not back this up with any kind of data.