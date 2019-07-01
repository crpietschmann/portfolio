---
layout: post
blogengineid: e46cfcd4-020b-48fc-beae-f7f12a586dae
title: "AjaxControlToolkit TabContainer: TabPanel.Visible='False' should not display header text"
date: 2007-05-02 13:52:00 -0500
comments: true
published: true
categories: ["blog", "archives"]
tags: ["asp.net"]
redirect_from: 
  - /post/2007/05/02/AjaxControlToolkit-TabContainer-TabPanelVisible3dFalse-should-not-display-header-text
  - /post/2007/05/02/ajaxcontroltoolkit-tabcontainer-tabpanelvisible3dfalse-should-not-display-header-text
  - /post.aspx?id=e46cfcd4-020b-48fc-beae-f7f12a586dae
---
<!-- more -->

<span id="ctl00_ctl00_ctl00_Content_ProjectBaseMain_ProjectMain_DescriptionLabel">If you set the visible property of TabPanels within your TabContainer to false, it still shows the Header Text in the page when rendered. What should happen is any TabPanels with Visible set to False should be hidden. A <a href="http://www.codeplex.com/AtlasControlToolkit/WorkItem/View.aspx?WorkItemId=8474">fix for this has been posted to the AJAX Control Toolkits Issue Tracker</a>, but we have to wait for the next release to get the fix in place.</span>

<span>**Is there a work around?**</span>

<span>Below is an Inherited class I created using the fix described to allow me to fix this issue myself until the next release.</span>

<span style="color: #0000ff; font-size: x-small;"> </span>

<span style="color: #0000ff; font-size: x-small;">public</span><span style="font-size: x-small;"> </span><span style="color: #0000ff; font-size: x-small;">class</span><span style="font-size: x-small;"> </span><span style="color: #2b91af; font-size: x-small;">FixedTabContainer</span><span style="font-size: x-small;"> : AjaxControlToolkit.</span><span style="color: #2b91af; font-size: x-small;">TabContainer
</span><span style="font-size: x-small;">{
</span><span style="color: #0000ff; font-size: x-small;">   protected</span><span style="font-size: x-small;"> </span><span style="color: #0000ff; font-size: x-small;">override</span><span style="font-size: x-small;"> </span><span style="color: #0000ff; font-size: x-small;">void</span><span style="font-size: x-small;"> RenderHeader(</span><span style="color: #2b91af; font-size: x-small;">HtmlTextWriter</span><span style="font-size: x-small;"> writer)
   {
      </span><span style="color: #0000ff; font-size: x-small;">foreach</span><span style="font-size: x-small;"> (TabPanel panel </span><span style="color: #0000ff; font-size: x-small;">in</span><span style="font-size: x-small;"> Tabs)
      </span><span style="font-size: x-small;">{
         </span><span style="color: #0000ff; font-size: x-small;">if</span><span style="font-size: x-small;"> (panel.Visible) </span><span style="color: #008000; font-size: x-small;">//added this line
            </span><span style="font-size: x-small;">panel.RenderHeader(writer);
      }
   }
}</span>

Well, actually, the above code doesn't work!

<span style="font-size: x-small;">**Compiler Error Message: **<span style="font-family: Arial;">CS0122: 'AjaxControlToolkit.TabPanel.RenderHeader(System.Web.UI.HtmlTextWriter)' is inaccessible due to its protection level</span>
</span>

I then tried to Inherit from the AjaxControlToolkit.TabPanel class within my namespace, but that doesn't get around the protection level of the RenderHeader method.

**Conclusion**

Basically, the only way to fix this before the next release comes (that is assuming they put the fix in the next release) is to implement this fix in the toolkit's source code yourself and then compiling it in. This is actually something I don't like to do just in case I make some change to the toolkit manually and then forget to carry that over when upgrading to the latest version when it comes out, but it is nice you have the ability to do is since the <a href="http://codeplex.com/atlascontroltoolkit">AJAX Control Toolkit is Open Source</a>.

**UPDATE:
Here's a rather easy workaround that I found to this issue...** You just set Visible to False and set the HeaderText to a blank string if you don't want the TabPanel to be shown. This worked perfectly in the instance I needed it to work. Below is a simplified version of what I did.

<span style="color: #0000ff; font-size: x-small;"><</span><span style="color: #a31515; font-size: x-small;">ajaxToolkit</span><span style="color: #0000ff; font-size: x-small;">:</span><span style="color: #a31515; font-size: x-small;">TabPanel</span><span style="font-size: x-small;"> </span><span style="color: #ff0000; font-size: x-small;">runat</span><span style="color: #0000ff; font-size: x-small;">="server"</span><span style="font-size: x-small;"> </span><span style="color: #ff0000; font-size: x-small;">ID</span><span style="color: #0000ff; font-size: x-small;">="tabPeople"</span><span style="font-size: x-small;"> </span><span style="color: #ff0000; font-size: x-small;">Visible</span><span style="color: #0000ff; font-size: x-small;">='</span><span style="font-size: x-small;"><%# ShouldBeShow() %></span><span style="color: #0000ff; font-size: x-small;">'</span><span style="font-size: x-small;"> </span><span style="color: #ff0000; font-size: x-small;">HeaderText</span><span style="color: #0000ff; font-size: x-small;">='</span><span style="font-size: x-small;"><%# ShouldBeShow() ? "People" : "" %></span><span style="color: #0000ff; font-size: x-small;">'></span>

 
