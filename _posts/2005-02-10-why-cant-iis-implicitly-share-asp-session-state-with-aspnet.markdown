  ---
  layout: post
  title: "Why can't IIS implicitly share ASP Session state with ASP.NET??"
  date: 2005-02-10 15:39:00 -0600
  comments: true
  published: true
  categories: ["blog", "archives"]
  tags: ["General"]
  alias: ["/post/2005/02/10/Why-cant-IIS-implicitly-share-ASP-Session-state-with-ASPNET", "/post/2005/02/10/why-cant-iis-implicitly-share-asp-session-state-with-aspnet"]
  ---
<!-- more -->
{% include imported_disclaimer.html %}
Why can't IIS implicitly share ASP Session state with <a title="ASP.NET" href="http://asp.net" target="_blank">ASP.NET</a>?? This is really a drag on starting to&nbsp;convert an ASP application to ASP.NET. Of course, you could use SQL Server to store your Sessions state, but then you'd have to rewrite that portion of your ASP application first. I don't want to, Why can't I just use <EM>Session(&#8221;myData&#8221;) </EM>in ASP and ASP.NET and have it point to the same Session value? C'mon guys!!
