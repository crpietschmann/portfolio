---
layout: post
blogengineid: 19fce326-b2f2-45a7-b1b0-da2f45fdcb07
title: "C#: Give your object a Default Indexer Property"
date: 2007-03-17 14:40:00 -0500
comments: true
published: true
categories: ["blog", "archives"]
tags: ["General", "General"]
redirect_from: 
  - /post/2007/03/17/C-Give-your-object-a-Default-Indexer-Property
  - /post/2007/03/17/c-give-your-object-a-default-indexer-property
  - /post.aspx?id=19fce326-b2f2-45a7-b1b0-da2f45fdcb07
---
<!-- more -->

I've seen/used objects within the .NET Framework that have default indexer properties (ie: SqlDataReader, System.Collections.Generic.List). Now how exactly do I give my own custom object type a default indexer property?

Well, it's actually rather simple. Heres an example of a Club object with a People collection of type Person that has a default indexer property set up:<FONT color=#0000ff size=2>

public</FONT><FONT size=2> </FONT><FONT color=#0000ff size=2>class</FONT><FONT size=2> </FONT><FONT color=#2b91af size=2>Club<BR></FONT><FONT size=2>{<BR></FONT><FONT color=#808080 size=2>  ///</FONT><FONT color=#008000 size=2> </FONT><FONT color=#808080 size=2><summary><BR></FONT><FONT color=#808080 size=2>  ///</FONT><FONT color=#008000 size=2> Collection of Person objects in the Club<BR></FONT><FONT color=#808080 size=2>  ///</FONT><FONT color=#008000 size=2> </FONT><FONT color=#808080 size=2></summary><BR></FONT><FONT color=#0000ff size=2>  private</FONT><FONT size=2> </FONT><FONT color=#2b91af size=2>List</FONT><FONT size=2><</FONT><FONT color=#2b91af size=2>Person</FONT><FONT size=2>> _people = </FONT><FONT color=#0000ff size=2>new</FONT><FONT size=2> </FONT><FONT color=#2b91af size=2>List</FONT><FONT size=2><</FONT><FONT color=#2b91af size=2>Person</FONT><FONT size=2>>();<BR></FONT><FONT color=#0000ff size=2>  public</FONT><FONT size=2> </FONT><FONT color=#2b91af size=2>List</FONT><FONT size=2><</FONT><FONT color=#2b91af size=2>Person</FONT><FONT size=2>> People<BR>  {<BR></FONT><FONT color=#0000ff size=2>    get</FONT><FONT size=2> { </FONT><FONT color=#0000ff size=2>return</FONT><FONT size=2> _people; }<BR></FONT><FONT color=#0000ff size=2>    set</FONT><FONT size=2> { _people = </FONT><FONT color=#0000ff size=2>value</FONT><FONT size=2>; }<BR>  }

</FONT><FONT color=#808080 size=2>  ///</FONT><FONT color=#008000 size=2> </FONT><FONT color=#808080 size=2><summary><BR></FONT><FONT color=#808080 size=2>  ///</FONT><FONT color=#008000 size=2> The Default property of the Club object<BR></FONT><FONT color=#808080 size=2>  ///</FONT><FONT color=#008000 size=2> </FONT><FONT color=#808080 size=2></summary><BR></FONT><FONT color=#0000ff size=2>  public</FONT><FONT size=2> </FONT><FONT color=#2b91af size=2>Person</FONT><FONT size=2> </FONT><FONT color=#0000ff size=2>this</FONT><FONT size=2>[</FONT><FONT color=#0000ff size=2>int</FONT><FONT size=2> index]<BR>  {<BR></FONT><FONT color=#0000ff size=2>    get</FONT><FONT size=2> { </FONT><FONT color=#0000ff size=2>return</FONT><FONT size=2> _people[index]; }<BR></FONT><FONT color=#0000ff size=2>    set</FONT><FONT size=2> { _people[index] = </FONT><FONT color=#0000ff size=2>value</FONT><FONT size=2>; }<BR>  }<BR>}

</FONT><FONT color=#0000ff size=2>public</FONT><FONT size=2> </FONT><FONT color=#0000ff size=2>class</FONT><FONT size=2> </FONT><FONT color=#2b91af size=2>Person<BR></FONT><FONT size=2>{<BR></FONT><FONT color=#0000ff size=2>  public</FONT><FONT size=2> Person(</FONT><FONT color=#0000ff size=2>string</FONT><FONT size=2> name)<BR>  {<BR></FONT><FONT color=#0000ff size=2>    this</FONT><FONT size=2>._name = name;<BR>  }

</FONT><FONT color=#0000ff size=2>  private</FONT><FONT size=2> </FONT><FONT color=#0000ff size=2>string</FONT><FONT size=2> _name;<BR></FONT><FONT color=#0000ff size=2>  public</FONT><FONT size=2> </FONT><FONT color=#0000ff size=2>string</FONT><FONT size=2> Name<BR>  {<BR></FONT><FONT color=#0000ff size=2>    get</FONT><FONT size=2> { </FONT><FONT color=#0000ff size=2>return</FONT><FONT size=2> _name; }<BR></FONT><FONT color=#0000ff size=2>    set</FONT><FONT size=2> { _name = </FONT><FONT color=#0000ff size=2>value</FONT><FONT size=2>; }<BR>  }<BR>}</FONT>

And, here's example code of using that object:<FONT color=#008000 size=2>

// Create instance of Club object<BR></FONT><FONT color=#2b91af size=2>Club</FONT><FONT size=2> club = </FONT><FONT color=#0000ff size=2>new</FONT><FONT size=2> </FONT><FONT color=#2b91af size=2>Club</FONT><FONT size=2>();



</FONT><FONT color=#008000 size=2>// Add a couple Person objects to the Peopl collection of the Club<BR></FONT><FONT size=2>club.People.Add(</FONT><FONT color=#0000ff size=2>new</FONT><FONT size=2> </FONT><FONT color=#2b91af size=2>Person</FONT><FONT size=2>(</FONT><FONT color=#a31515 size=2>"Chris"</FONT><FONT size=2>));<BR>club.People.Add(</FONT><FONT color=#0000ff size=2>new</FONT><FONT size=2> </FONT><FONT color=#2b91af size=2>Person</FONT><FONT size=2>(</FONT><FONT color=#a31515 size=2>"Kate"</FONT><FONT size=2>));

</FONT><FONT color=#008000 size=2>// Change the name of the first Person in the People<BR></FONT><FONT color=#008000 size=2>// collection using the traditional method<BR></FONT><FONT size=2>club.People[0].Name = </FONT><FONT color=#a31515 size=2>"Joe"</FONT><FONT size=2>;

</FONT><FONT color=#008000 size=2>// Change the name of the first Person in the People<BR></FONT><FONT color=#008000 size=2>// collection using the Club objects Default property<BR></FONT><FONT size=2>club[0].Name = </FONT><FONT color=#a31515 size=2>"John"</FONT><FONT size=2>;</FONT>

And, remember just like any other method/property the Default Indexer Property can be overloaded. For instance, you can define one that accepts an Index as type integer, and also have one that accepts an Index of type string that does a dictionary lookup.

**Update 3/23/2007: **I have updated this post and changed the title, since there seems to be some confusion as to what I'm describing is a Default Property or Indexer Property. I think I'll just refer to it as a Default Indexer Property. Sorry for the confusion.

For further reference: <A href="http://msdn2.microsoft.com/en-us/library/2b6akew6(VS.71).aspx">MSDN: Default Properties for your Components</A>
