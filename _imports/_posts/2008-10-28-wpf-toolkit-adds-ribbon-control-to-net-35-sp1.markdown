  ---
  layout: post
  title: "WPF Toolkit adds Ribbon Control to .NET 3.5 SP1"
  date: 2008-10-28 17:49:00 -0500
  comments: true
  published: true
  categories: ["blog", "archives"]
  tags: ["General"]
  alias: ["/post/2008/10/28/WPF-Toolkit-adds-Ribbon-Control-to-NET-35-SP1", "/post/2008/10/28/wpf-toolkit-adds-ribbon-control-to-net-35-sp1"]
  ---
<!-- more -->
{% include imported_disclaimer.html %}
<p>The first release of the new WPF Toolkit was released today. This toolkit includes a new Ribbon control as well as the following: new WPF DataGrid, DatePicker/Calendar, and VisualStateManger. The coolest feature of this Toolkit (IMO) is the new Ribbon control. In .NET 4.0 there will be a ribbon control baked in, but thanks to the WPF Toolkit we have access to utilize the new Ribbon control today in WPF with .NET 3.5 SP1!</p>
<p>Download the WPF Toolkit October 2008 Release: <a href="http://www.codeplex.com/wpf/Release/ProjectReleases.aspx?ReleaseId=15598">http://www.codeplex.com/wpf/Release/ProjectReleases.aspx?ReleaseId=15598</a></p>
<p>Ribbon Feature Walkthrough: <a href="http://windowsclient.net/wpf/wpf35/wpf-35sp1-ribbon-walkthrough.aspx">http://windowsclient.net/wpf/wpf35/wpf-35sp1-ribbon-walkthrough.aspx</a></p>
<p><img src="/image.axd?picture=WPFToolkit_RibbonControl.png" alt="" /><br /><br />Here's some sample XAML markup for a complete Ribbon Tab with Button Groups defined:</p>
<p>[code:xml]</p>
<p>&lt;r:Ribbon&gt;<br />&nbsp;&nbsp;&nbsp; &lt;r:RibbonTab Label="Banking"&gt;<br />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &lt;r:RibbonGroup&gt;<br />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &lt;r:RibbonButton Command="me:AppCommands.Cut"/&gt;<br />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &lt;r:RibbonButton Command="me:AppCommands.Copy"/&gt;<br />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &lt;r:RibbonButton Command="me:AppCommands.Paste"/&gt;<br />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &lt;/r:RibbonGroup&gt;<br /><br />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &lt;r:RibbonGroup&gt;<br />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &lt;r:RibbonButton Command="me:AppCommands.AddNew"/&gt;<br />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &lt;r:RibbonButton Command="me:AppCommands.Clear" /&gt;<br />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &lt;r:RibbonButton Command="me:AppCommands.Delete"/&gt;<br />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &lt;/r:RibbonGroup&gt;<br /><br />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &lt;r:RibbonGroup&gt;<br />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &lt;r:RibbonButton Command="me:AppCommands.DownloadStatements"/&gt;<br />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &lt;r:RibbonButton Command="me:AppCommands.DownloadCreditCards"/&gt;<br />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &lt;r:RibbonButton Command="me:AppCommands.Transfer"/&gt;<br />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &lt;/r:RibbonGroup&gt;<br />&nbsp;&nbsp;&nbsp; &lt;/r:RibbonTab&gt;<br />&lt;/r:Ribbon&gt;</p>
<p>[/code]</p>
