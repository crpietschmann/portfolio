---
layout: post
blogengineid: 683215b1-c45a-467a-a458-b2a81ab48816
title: "2012 Bing Maps Feature Wish List"
date: 2011-12-19 14:42:13 -0600
comments: true
published: true
categories: ["Bing Maps", "GIS"]
tags: ["Bing Maps"]
redirect_from: 
  - /post/2011/12/19/2012-Bing-Maps-Feature-Wish-List.aspx
  - /post/2011/12/19/2012-Bing-Maps-Feature-Wish-List
  - /post/2011/12/19/2012-bing-maps-feature-wish-list
  - /post.aspx?id=683215b1-c45a-467a-a458-b2a81ab48816
---
<!-- more -->

The Bing Maps Silverlight control is really sweet (although it hasn’t been updated in forever) and the Ajax v7 control was a huge improvement performance wise over v6. However, the Bing Maps platform has a long way to go before I would consider it to be the mapping development platform I would hope it could someday become.  <h3>Bing Maps Wish List</h3>  
Here’s a list of some features that I hope make their way into the Bing Maps platform for us developers to be able to utilize:  
**1) Bring 3D Mapping Back!! With more features!**  
There used to be a Bing Maps 3D control that could be used; except it was abandoned by Microsoft this year (2011.) The story of Bing Maps 3D started about the same time Bing Maps was first released back when it was called Virtual Earth (a far better name in my opinion.) The truth of the 3D support was that it only supported Windows (as it was an ActiveX control) and the developer API wasn’t very well documented. It almost seemed like they really didn’t want people using it.  
Obviously, the HTML / JavaScript development stack is not robust enough to support such features. Also, as became obvious with the old control, an ActiveX control is not a viable option either. The best development option for building a 3D map control is to expand the Silverlight control to support 3D. Also, it is essential to bring an identical developer experience to Windows 8 “Metro” Apps via a native control that is identical in functionality to the Silverlight control (with 3D added of course.)  
Also, who cares about Street View or what ever other antiquated 2D map view. 3D is where the future is! If Bing Maps doesn’t get it, someone else will.  
**2) Native Bing Maps control for Windows 8 “Metro” Apps**  
I know Windows 8 isn’t even to the Beta stage yet, but the lack of a native Bing Maps control makes it a huge pain to build mapping apps on the new platform. Also, by forcing us to use the Ajax control doesn’t allow us to use C# or .NET for building “Metro” apps.  
Also, I think a native Bing Maps control for Windows 8 “Metro” Apps should be free for developers to use (not require Bing Maps for Enterprise licensing at all) since it will really help push the adoption of Windows 8. Many people don’t really know it yet, but mapping is still what they want to use when visualizing their data. Give us the tools to show them the light!  
**3) Open Source Bing Maps Controls**  
Free Bing Maps by releasing the controls as Open Source! This would allow us to better implement them, since we’ll be able to dissect them to see how to best build our apps. Then we could also write “best practice” type articles to pass our new found knowledge on to other Bing Maps developers that may be looking to build the same stuff.  
Also, this would be a huge benefit that Google doesn’t currently offer either.  
Some fear that by open sourcing the Bing Maps controls it will open the ecosystem up to developers using their own custom versions that aren’t supported by Microsoft; thus causing technical support issues when they run into issues. Well, if you just take one look at ASP.NET MVC then you’ll see that this just isn’t true.  
Just to clarify: I’m not suggesting making the server-side backend of Bing Maps open source. I’m only referring to the Ajax control, Silverlight control and other developer tools.  
**4) Ability to Submit Bug Reports**  
Currently the only place for us to submit bug reports for anything relating to Bing Maps is to tell each other about it in the Bing Maps Developer Forums, and then hope that a member of the Bing Maps team at Microsoft finds the post and eventually works to get it fixed. It’s almost like the Bing Maps team doesn’t want to hear about Bugs (I know this isn’t true, but that’s the image it projects to the community.) Please, give us a Bug report system on MS Connect of some where.  
**5) Independent Resource Site / Central Hub for Bing Maps Development**  
Both <a href="http://www.silverlight.net">Silveright</a> and <a href="http://www.asp.net">ASP.NET</a> have their own resource websites full of screencasts, articles, samples, forums and other stuff. Bing Maps is really a huge platform with many different controls and tools. There is so much information scattered on the web for Bing Maps development, but not a decent place that aggregates it all together. There needs to be a better place for developer to go to figure out how to do stuff and to get help. In fact many developers aren’t even aware of a lot of the functionality available in the Bing Maps platform due to the lack of a full resource site.  
**6) Better and Separate Forums for Bing Maps**  
The <a href="http://social.msdn.microsoft.com/Forums/en-US/vemapcontroldev/threads">Bing Maps developer forums</a> are still all lumped together into a single forum for all Bing Maps development: Ajax, Silverlight, 3D, WPF, Windows Phone 7, Android, iPhone, Web Services, Bing Maps Apps, etc. Also, to make things worse, Bing Maps doesn’t even have it’s own forums, and is instead still part of the Windows Live Developer Forums. Bing Maps has never really been part of Windows Live (even when it was Virtual Earth), but someone along the way seemed to think it was. It’s about time to get this changed.  
**7) Beta Releases Before Final Release**  
There have been a few times that a new update to the Ajax v7 control was released that causes peoples sites to break. Sometimes this will happen, but almost every time an update is released? C’mon, sometimes I wonder myself whether the Bing Maps team fully tests things before releasing them. If it’s not a security fix, please let us Beta test a release before forcing all those using Ajax v7 to use the latest “greatest” update. Even if we only have a week to test before it goes live. If an app I built breaks, my customers don’t care if it’s my fault or Microsoft; they will ALWAYS blame me!  
**8) Ask for Feature Suggestions**  
Other product teams, such as <a href="http://www.mygreatwindowsazureidea.com">Windows Azure, use UserVoice</a> to to allow customers / users to suggest and vote on which features they would like in future releases. Allowing us to prioritize our feature requests in this fashion would greatly help the Bing Maps team know what to work on next.  <h3>Conclusion</h3>  
The above is a list of changes and new stuff that I would like to see come to Bing Maps. Hopefully we’ll see some of then in the near future, but remember we wont see all of them since this is just my own personal wish list. If I think of any others over the next few weeks, I’ll add them to the list.
