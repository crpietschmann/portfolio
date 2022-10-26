---
layout: post
blogengineid: 00000000-0000-0000-0000-000000000000
title: "My Workflow for Build5Nines Weekly Newsletter Generation"
date: 2022-10-26 13:00:00 -0500
comments: true
published: true
categories: ["Business", "Blogging"]
tags: ["Blogging","Business","Consulting","Authority"]
---

For about 7 years now I've been publishing a weekly newsletter that goes along with my <https://Build5Nines.com> website / blog. It's a weekly newsletter that you can sign up with your email address to receive weekly updates on the latest news and blogs in the community around Microsoft cloud technologies. If you aren't aware, Build5Nines is a website / blog that's dedicated to many topic areas around Microsoft cloud technologies. At the moment the newsletter has approximately 12,000 email subscribers.

I thought I'd take a moment to share a brief look into my own workflow for creating the Build5Nines Weekly Newsletter. It does take manual steps, as I personally do author the newsletter each week, however, I do have a little automation to help save time in this process. Let's take a look at the tools and workflow process I follow.

## What tools do I use to generate the newsletter?

I have a few tools that I use to help me keep track of links to include in the newsletter, pull in RSS feeds, and generate HTML content for the newsletter itself. Really, these tools are mostly about saving me time. When I first started the Build5Nines Weekly Newsletter I manually did everything, then I started adding tools that helped along the way to speed up the process each week. Originally I think it took me about 1 hours to put together the newsletter to send, and today it takes me about 5 minutes generally.

The following is a list of the tools and services I use in my process for generating the newsletter:

- [MailChimp](http://eepurl.com/ichARb) - I use [MailChimp](http://eepurl.com/ichARb) to manage the email subscriber list and to send out the newsletter emails.
- [Feedly](https://feedly.com) - I use [Feedly](https://feedly.com) to subscribe to blog and website feeds. I can mark links to _"read later"_ so I know which links to include in the next weeks newsletter.
- [Wordpress.com](https://wordpress.com/refer-a-friend/P4wEL3KT49eAyxkWoO0B/) - I use [Wordpress.com](https://wordpress.com/refer-a-friend/P4wEL3KT49eAyxkWoO0B/) to host [Build5Nines.com](https://Build5Nines.com) blog where I post a web version of the newsletters.
- Custom Automation Code - I have some custom code written using an Azure Functions serverless app that helps me generate the HTML content that I can past in the newsletter based on the saved "read later" links and other blog feeds I pull in. This code uses the [Feedly](https://feedly.com) REST API for integration with that service.

_Disclaimer: FYI, This post does contain some referral links to the services I pay for and use to create my newsletter. If you follow those links and become a customer of those services then I will receive a referral bonus on my account. I have not been paid by anyone to write this article, and am only promoting services I use myself._

## Workflow I follow for generating Newsletter

When I author the Build5Nines Weekly Newsletter I post it as both a blog post on <https://Build5Nines.com> and send it as an email to subscribers. This gives both RSS/ATOM subscribers and Email subscribers the ability to follow and read the newsletter to offer a broader level of accessibility. it also serves as the benefit of having all the previous newsletters archived on <https://Build5Nines.com> which isn't required, but I personally like that they are archived publicly there.

The following is an overview of the steps in my workflow for generating the newsletter:

1. Throughout the week, I use [Feedly](https://feedly.com) to keep up to date on blogs and websites in the Microsoft and cloud technology space. Within Feedly, I mark links to _"read later"_ so mark them for inclusion in the newsletter.
2. When it's time to generate the newsletter, I use my custom Azure Functions serverless code to generate HTML content in the correct formatting so I can easily _"copy/paste"_ all the links into the newsletter. The code pulls in links marked as _"read later"_ from [Feedly](https://feedly.com), as well as RSS/ATOM feeds from other sources to automatically pull in links from other sources such as links to all the weeks latest blog articles from <https://Build5Nines.com>.
3. I have a draft template of the newsletter blog post in [Wordpress](https://wordpress.com/refer-a-friend/P4wEL3KT49eAyxkWoO0B/) that I make a copy of, then paste in all the HTML content for the newsletter, as well as write any custom content for the week.
4. I go through all the link again to _"copy/paste"_ and curate links to include in the _"This weeks top links"_ section of the newsletter. This let's me draw attention to certain links that look like the more interesting topics of the week at the top of the newsletter.
5. Then I publish the post to <https://Build5Nines.com>.
6. I go into [MailChimp](http://eepurl.com/ichARb) and replicate the previous weeks newsletter campaign, _"copy/paste"_ in the content that we previously published from the blog post published on <https://Build5nines.com>, modify any formatting of the email newsletter as necessary, then send it to all current subscribers. It's worth noting that my email newsletter contains _"This weeks top links"_ and the weeks Microsoft Azure announcements, and not the entire list of links. The email contains links to the blog article on <https://Build5Nines.com> where subscribers can read the full newsletter contents. This keeps the email from being extremely long.
7. Go into [Feedly](https://feedly.com), and delete all links that are marked for _"read later"_ since they were published in the newsletter already. This clears it out and gets it ready to start marking new links for the next weeks newsletter.

Never be afraid of manual steps, but always automate tasks you need to repeat over and over again. In the beginning it took me an hour to generate the newsletter since I would _"copy/paste"_ each individual link manually. Then I after I got the format of the newsletter figured out, I started using my coding skills to write automation code to generate the HTML content so I could easily _"copy/paste"_ blocks of generated content each week.

## Why do I publish a newsletter?

There are a few reason that I have an email newsletter from my blog / website. One of the biggest is to help others consume an aggregate of the communities latest blog articles and news to make it easier for others to keep up-to-date on the latest updates. I already spend a fair amount of time keeping up-to-date myself, and this helps me share that effort and time for others to benefit from as well. Another big reason I have the newsletter is to help share and promote blog articles from the community in a _"lift others up in the community effort"_. Other people promote my content and I enjoy promoting others great content too. The community is stronger if we all work together!

There is also a general recommendation that if you have a blog that you should create an email list of some kind. A major reason for this is to help get people interested in your website or blog subscribed so you can reach out to them with your content and special offers directly. This helps keep those same people to keep coming back and consuming your content. There are business reasons for this and this can be a great way to help promote and grow your own business. So, essentially, I agree with the advice, if you have a blog then you should create an email list of some kind.

On the topic of using the email list to market and make money from, I have generally very careful with my newsletter. People are trusting me with their email addresses and that I wont spam them. I have had some sponsors pay for advertisement in the newsletter some over the years, and am very careful in making things tasteful and not annoying to my subscribers. I also will NEVER share my subscribers email addresses with any third party. I feel very strong about being a good steward with my email newsletter and to not break the trust of my subscribers.

I hope this write up helps those who have been thinking about setting up an email list or newsletter for their own blogs. At the very least, it helps add some more transparency to how I manage my own <https://Build5Nines.com> blog. Thanks for your interest in this topic!
