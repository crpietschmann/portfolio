  ---
  layout: post
  title: ".NET: Why aren't Private Abstract methods allowed?"
  date: 2008-02-26 22:08:00 -0600
  comments: true
  published: true
  categories: ["blog", "archives"]
  tags: ["C#", "vb.net"]
  alias: ["/post/2008/02/26/NET-Why-arent-Private-Abstract-methods-allowed", "/post/2008/02/26/net-why-arent-private-abstract-methods-allowed"]
  ---
<!-- more -->
<p>Sometimes when creating base objects you want to create methods that are overridable by object that inherit the base object, but keep the methods from being public. However, the compiler throws an exceptions when you try to define&nbsp;a method as "Private Abstract".</p>
<p><strong>Why doesn't the compiler like "Private Abstract" methods?</strong></p>
<p>The reason for this is Private methods can not be overriden. So, essentially the Abstract is useless if the method is Private.</p>
<p><strong>How can I create a "Private" method that's able to be overriden?</strong></p>
<p>Simple, you just declare the method as "Protected Abstract". Protected defines that the method is only accessible from within the class that declared it, and from within any derived class.</p>
