---
layout: post
blogengineid: 73b4583b-9f6a-400c-8fe2-cf8db20b75ee
title: "Silverlight: Embed IronRuby within XAML Part 2"
date: 2010-10-17 10:44:27 -0500
comments: true
published: true
categories: ["Silverlight", "IronRuby"]
tags: ["Silverlight", "DLR", "Ruby"]
redirect_from: 
  - /post/2010/10/17/Silverlight-Embed-IronRuby-within-XAML-Part-2.aspx
  - /post/2010/10/17/Silverlight-Embed-IronRuby-within-XAML-Part-2
  - /post/2010/10/17/silverlight-embed-ironruby-within-xaml-part-2
  - /post.aspx?id=73b4583b-9f6a-400c-8fe2-cf8db20b75ee
---
<!-- more -->

In the previous post I explored the possibility of <a href="/post/2010/10/02/Silverlight-Embed-IronRubyDLR-Scripting-within-XAML-using-IValueConverter-and-Custom-UserControl.aspx">embedding IronRuby / DLR Script within XAML using both an IValueConverter and Custom UserControl</a>. I spent a little more time experimenting with the DLRScriptUserControl I posted, and came up with some small modifications to it that allow UI event handlers to be wired up using a DLR language (such as IronRuby.  <h3>Loading Assemblies Into the ScriptEngine.Runtime Context</h3>  
Something nice with how the ScriptEngine class allows you to execute a script of IronRuby (or other DLR language) is that it requires the implementer of the ScriptEngine (not the DLR script writer) to call “ScriptEngine.Runtime.LoadAssembly” in order to make a certain CLR assembly accessible within the DLR script that gets executed. This allows the scripts to be run in a sort of sandboxed environment.  
There are two ways of doing this:  <pre class="csharpcode"><span class="rem">// One: Load the assemblies of known types you want to</span>
<span class="rem">//      make available within the script.</span>
<span class="rem">// Load System.Windows</span>
engine.Runtime.LoadAssembly(<span class="kwrd">typeof</span>(UserControl).Assembly);
<span class="rem">// Load System.Windows.Browser</span>
engine.Runtime.LoadAssembly(<span class="kwrd">typeof</span>(HtmlPage).Assembly);
            

<span class="rem">// Two: Load assemblies using thier Full Name</span>
engine.Runtime.LoadAssembly(
    Assembly.Load(<span class="str">&quot;System.Windows, Version=2.0.5.0, Culture=neutral, PublicKeyToken=7cec85d7bea7798e&quot;</span>)
    );
engine.Runtime.LoadAssembly(
    Assembly.Load(<span class="str">&quot;System.Windows.Browser, Version=2.0.5.0, Culture=neutral, PublicKeyToken=7cec85d7bea7798e&quot;</span>)
    );</pre>
<style type="text/css">

.csharpcode, .csharpcode pre
{
	font-size: small;
	color: black;
	font-family: consolas, "Courier New", courier, monospace;
	background-color: #ffffff;
	/*white-space: pre;*/
}
.csharpcode pre { margin: 0em; }
.csharpcode .rem { color: #008000; }
.csharpcode .kwrd { color: #0000ff; }
.csharpcode .str { color: #006080; }
.csharpcode .op { color: #0000c0; }
.csharpcode .preproc { color: #cc6633; }
.csharpcode .asp { background-color: #ffff00; }
.csharpcode .html { color: #800000; }
.csharpcode .attr { color: #ff0000; }
.csharpcode .alt 
{
	background-color: #f4f4f4;
	width: 100%;
	margin: 0em;
}
.csharpcode .lnum { color: #606060; }</style>


The first method is easiest when the assembly you wish to load is already referenced by the host application. It also allows you to easily support being able to migrate your application to a newer version of the framework since it will load the version of the assembly that your application is compiled for, rather than the specific version stated in the full assembly name.

<h3>Loading Assemblies within DLRScriptUserControl</h3>


Here’s a modified version of DLRScriptUserControl from the previous post that includes the above snippets to load both “System.Windows” and “System.Windows.Browser” assemblies into the ScriptEngine.Runtime context.

<pre class="csharpcode"><span class="kwrd">public</span> <span class="kwrd">class</span> DLRScriptUserControl : UserControl
{
    <span class="kwrd">public</span> <span class="kwrd">object</span> Script { get; set; }

    <span class="kwrd">public</span> DLRScriptUserControl()
    {
        <span class="kwrd">this</span>.Loaded += <span class="kwrd">new</span> RoutedEventHandler(DLRScriptUserControl_Loaded);
    }

    <span class="kwrd">void</span> DLRScriptUserControl_Loaded(<span class="kwrd">object</span> sender, RoutedEventArgs e)
    {
        <span class="rem">// Create IronRuby Engine</span>
        ScriptEngine engine = Ruby.CreateEngine();

        <span class="rem">// Load necessary assemblies for event handling, etc.</span>
        <span class="rem">// Load System.Windows</span>
        engine.Runtime.LoadAssembly(<span class="kwrd">typeof</span>(UserControl).Assembly);
        <span class="rem">// Load System.Windows.Browser</span>
        engine.Runtime.LoadAssembly(<span class="kwrd">typeof</span>(HtmlPage).Assembly);
            
        <span class="rem">// Give IronRuby access to this control via a variable named 'Ctrl'</span>
        engine.Runtime.Globals.SetVariable(<span class="str">&quot;Ctrl&quot;</span>, <span class="kwrd">this</span>);
            
        <span class="rem">// Execute the code</span>
        engine.Execute(<span class="kwrd">this</span>.Script <span class="kwrd">as</span> <span class="kwrd">string</span>, engine.CreateScope());
    }
}</pre>

<h3>Handle UI Event within Embedded IronRuby using DLRScriptUserControl</h3>


Now that the “System.Windows” and “System.Windows.Browser” assemblies are loaded and accessible to the DLR script that’s executed (in this case IronRuby) we can use their namespaces within code. 


The below example demonstrates how to:

<ol>
  <li>Get references to the controls created within the xaml code for the control </li>

  <li>Set the Text property of the TextBlock in the control </li>

  <li>Attach an event handler to the Button control’s Click event </li>
</ol>


I have also included a second example (commented out) of using IronRuby to add an event handler to the Click event in case you are interested in seeing two methods of accomplishing this.

<pre class="csharpcode"><span class="kwrd"><</span><span class="html">local:DLRScriptUserControl</span> <span class="attr">x:Name</span><span class="kwrd">=&quot;testusercontrol&quot;</span><span class="kwrd">></span>
    <span class="kwrd"><</span><span class="html">local:DLRScriptUserControl.Script</span><span class="kwrd">></span>
        <span class="kwrd"><</span><span class="html">system:String</span> <span class="attr">xml:space</span><span class="kwrd">=&quot;preserve&quot;</span><span class="kwrd">></span>
            # init variables that point directly to the controls
            # within the control
            txtName = Ctrl.FindName('txtName')
            btnRubyButton = Ctrl.FindName('btnRubyButton')
                    
            # Set some text to the txtName TextBlock control
            txtName.Text = 'Hello from IronRuby'
                    
            # Add Click event handler to the button
            btnRubyButton.click do |s, e|
                System::Windows::Browser::HtmlPage.Window.Alert('Hello from IronRuby')
            end
                    
                    
            # This method of handling the event works, but the previous is easier to read
            # def btnRubyButton_Click(s,e)
            #     System::Windows::Browser::HtmlPage.Window.Alert('Hello from IronRuby!')
            # end
            # Ctrl.FindName('btnRubyButton').click.add method(:btnRubyButton_Click)
        <span class="kwrd"></</span><span class="html">system:String</span><span class="kwrd">></span>
    <span class="kwrd"></</span><span class="html">local:DLRScriptUserControl.Script</span><span class="kwrd">></span>
    <span class="kwrd"><</span><span class="html">local:DLRScriptUserControl.Content</span><span class="kwrd">></span>
        <span class="kwrd"><</span><span class="html">StackPanel</span><span class="kwrd">></span>
            <span class="kwrd"><</span><span class="html">TextBlock</span> <span class="attr">x:Name</span><span class="kwrd">=&quot;txtName&quot;</span><span class="kwrd">></span>Default<span class="kwrd"></</span><span class="html">TextBlock</span><span class="kwrd">></span>
            <span class="kwrd"><</span><span class="html">Button</span> <span class="attr">x:Name</span><span class="kwrd">=&quot;btnRubyButton&quot;</span> <span class="attr">Content</span><span class="kwrd">=&quot;IronRuby Button&quot;</span><span class="kwrd">></</span><span class="html">Button</span><span class="kwrd">></span>
        <span class="kwrd"></</span><span class="html">StackPanel</span><span class="kwrd">></span>
    <span class="kwrd"></</span><span class="html">local:DLRScriptUserControl.Content</span><span class="kwrd">></span>
<span class="kwrd"></</span><span class="html">local:DLRScriptUserControl</span><span class="kwrd">></span></pre>
<style type="text/css">

.csharpcode, .csharpcode pre
{
	font-size: small;
	color: black;
	font-family: consolas, "Courier New", courier, monospace;
	background-color: #ffffff;
	/*white-space: pre;*/
}
.csharpcode pre { margin: 0em; }
.csharpcode .rem { color: #008000; }
.csharpcode .kwrd { color: #0000ff; }
.csharpcode .str { color: #006080; }
.csharpcode .op { color: #0000c0; }
.csharpcode .preproc { color: #cc6633; }
.csharpcode .asp { background-color: #ffff00; }
.csharpcode .html { color: #800000; }
.csharpcode .attr { color: #ff0000; }
.csharpcode .alt 
{
	background-color: #f4f4f4;
	width: 100%;
	margin: 0em;
}
.csharpcode .lnum { color: #606060; }</style>


As you can see, by including these assemblies (or any others you want/need) you can easily turn the DLR script used for the control (as in the previous article) from providing very basic business logic, to being a full code behind for the control.

<h3>Dynamically Load the Entire Control (XAML + Script) at Runtime</h3>


Being able to embed IronRuby (or any DLR language) within XAML is nice, but what’s the benefit if it is still compiled as a resource within the assembly. In most cases you could use C# (or VB.NET) to accomplish the same results since everything ends up compiled within the same assembly.


To make things much more dynamic, by allowing the XAML it’s DLR script to be loaded at runtime, you can use the XamlReader to parse/load the entire thing at runtime. This would allow you to store your customized XAML + IronRuby within a database or some other file and load it at runtime. By loading this all at runtime, it would allow you to make your application scriptable and each script could be modified individually without requiring you to recompile, test and deploy the entire application if all you wanted to change was one simple little script.


To modify the previous example of DLRScriptUserControl to load it from a xaml file at runtime, we’ll follow these steps:

<ol>
  <li>Add a ContentPresenter to the Silverlight application where the DLRScriptUserControl will be displayed. </li>

  <li>Save the XAML + Script for the DLRScriptUserControl to a file that is stored within the website hosting the Silverlight application </li>

  <li>Add code to the application (within the MainPage.Load event in this case) to download the XAML and load it into the ContentPresenter using the XamlReader class. </li>
</ol>


****


**Step 1: Heres the ContentPresenter to add to the application**

<pre class="csharpcode"><span class="kwrd"><</span><span class="html">ContentPresenter</span> <span class="attr">x:Name</span><span class="kwrd">=&quot;parseXamlTest&quot;</span><span class="kwrd">></</span><span class="html">ContentPresenter</span><span class="kwrd">></span></pre>
<style type="text/css">

.csharpcode, .csharpcode pre
{
	font-size: small;
	color: black;
	font-family: consolas, "Courier New", courier, monospace;
	background-color: #ffffff;
	/*white-space: pre;*/
}
.csharpcode pre { margin: 0em; }
.csharpcode .rem { color: #008000; }
.csharpcode .kwrd { color: #0000ff; }
.csharpcode .str { color: #006080; }
.csharpcode .op { color: #0000c0; }
.csharpcode .preproc { color: #cc6633; }
.csharpcode .asp { background-color: #ffff00; }
.csharpcode .html { color: #800000; }
.csharpcode .attr { color: #ff0000; }
.csharpcode .alt 
{
	background-color: #f4f4f4;
	width: 100%;
	margin: 0em;
}
.csharpcode .lnum { color: #606060; }</style>


****


**Step 2: Here’s the XAML + Script to save in a file within the website**


In this case we are saving it as “DLRControl.xaml.” Also it is important to note that the root element within the XAML must have namespace declarations for all the namespaces used within the XAML file.

<pre class="csharpcode"><span class="kwrd"><</span><span class="html">local:DLRScriptUserControl</span>
            <span class="attr">xmlns</span><span class="kwrd">='http://schemas.microsoft.com/winfx/2006/xaml/presentation'</span>
            <span class="attr">xmlns:x</span><span class="kwrd">='http://schemas.microsoft.com/winfx/2006/xaml'</span>
            <span class="attr">xmlns:system</span><span class="kwrd">='clr-namespace:System;assembly=mscorlib'</span>
            <span class="attr">xmlns:local</span><span class="kwrd">='clr-namespace:SLXamlEmbeddedScript;assembly=SLXamlEmbeddedScript'</span>
            <span class="attr">x:Name</span><span class="kwrd">='testusercontrol'</span><span class="kwrd">></span>
    <span class="kwrd"><</span><span class="html">local:DLRScriptUserControl.Script</span><span class="kwrd">></span>
        <span class="kwrd"><</span><span class="html">system:String</span> <span class="attr">xml:space</span><span class="kwrd">='preserve'</span><span class="kwrd">></span>
            # init variables that point directly to the controls
            # within the control
            txtName = Ctrl.FindName('txtName')
            btnRubyButton = Ctrl.FindName('btnRubyButton')
                    
            # Set some text to the txtName TextBlock control
            txtName.Text = 'Hello from IronRuby'
                    
            # Add Click event handler to the button
            btnRubyButton.click do |s, e|
                System::Windows::Browser::HtmlPage.Window.Alert('Hello from IronRuby')
            end
                    
            # This method of handling the event works, but the previous is better
            # def btnRubyButton_Click(s,e)
            #     System::Windows::Browser::HtmlPage.Window.Alert('Hello from IronRuby!')
            # end
            # Ctrl.FindName('btnRubyButton').click.add method(:btnRubyButton_Click)
        <span class="kwrd"></</span><span class="html">system:String</span><span class="kwrd">></span>
    <span class="kwrd"></</span><span class="html">local:DLRScriptUserControl.Script</span><span class="kwrd">></span>
    <span class="kwrd"><</span><span class="html">local:DLRScriptUserControl.Content</span><span class="kwrd">></span>
        <span class="kwrd"><</span><span class="html">StackPanel</span><span class="kwrd">></span>
            <span class="kwrd"><</span><span class="html">TextBlock</span> <span class="attr">x:Name</span><span class="kwrd">='txtName'</span><span class="kwrd">></span>Default<span class="kwrd"></</span><span class="html">TextBlock</span><span class="kwrd">></span>
            <span class="kwrd"><</span><span class="html">Button</span> <span class="attr">x:Name</span><span class="kwrd">='btnRubyButton'</span> <span class="attr">Content</span><span class="kwrd">='IronRuby Button'</span><span class="kwrd">></</span><span class="html">Button</span><span class="kwrd">></span>
        <span class="kwrd"></</span><span class="html">StackPanel</span><span class="kwrd">></span>
    <span class="kwrd"></</span><span class="html">local:DLRScriptUserControl.Content</span><span class="kwrd">></span>
<span class="kwrd"></</span><span class="html">local:DLRScriptUserControl</span><span class="kwrd">></span></pre>
<style type="text/css">

.csharpcode, .csharpcode pre
{
	font-size: small;
	color: black;
	font-family: consolas, "Courier New", courier, monospace;
	background-color: #ffffff;
	/*white-space: pre;*/
}
.csharpcode pre { margin: 0em; }
.csharpcode .rem { color: #008000; }
.csharpcode .kwrd { color: #0000ff; }
.csharpcode .str { color: #006080; }
.csharpcode .op { color: #0000c0; }
.csharpcode .preproc { color: #cc6633; }
.csharpcode .asp { background-color: #ffff00; }
.csharpcode .html { color: #800000; }
.csharpcode .attr { color: #ff0000; }
.csharpcode .alt 
{
	background-color: #f4f4f4;
	width: 100%;
	margin: 0em;
}
.csharpcode .lnum { color: #606060; }</style>


****


**Step 3: Download and Load the XAML at Runtime**


You could place this code anywhere in the app, but for this example I just placed it within the MainPage.Load event handler in the application.

<pre class="csharpcode"><span class="kwrd">void</span> MainPage_Loaded(<span class="kwrd">object</span> sender, System.Windows.RoutedEventArgs e)
{
    var client = <span class="kwrd">new</span> WebClient();
    client.DownloadStringCompleted += (s, args) => {
        <span class="rem">// Load XAML once downloaded, and set the resulting</span>
        <span class="rem">// UI control to the content of the ContentPresenter</span>
        parseXamlTest.Content = XamlReader.Load(args.Result);
    };
    <span class="rem">// Download the XAML file</span>
    client.DownloadStringAsync(
        <span class="kwrd">new</span> System.Uri(<span class="str">&quot;http://localhost:9028/DLRControl.xaml&quot;</span>)
        );
}</pre>
<style type="text/css">

.csharpcode, .csharpcode pre
{
	font-size: small;
	color: black;
	font-family: consolas, "Courier New", courier, monospace;
	background-color: #ffffff;
	/*white-space: pre;*/
}
.csharpcode pre { margin: 0em; }
.csharpcode .rem { color: #008000; }
.csharpcode .kwrd { color: #0000ff; }
.csharpcode .str { color: #006080; }
.csharpcode .op { color: #0000c0; }
.csharpcode .preproc { color: #cc6633; }
.csharpcode .asp { background-color: #ffff00; }
.csharpcode .html { color: #800000; }
.csharpcode .attr { color: #ff0000; }
.csharpcode .alt 
{
	background-color: #f4f4f4;
	width: 100%;
	margin: 0em;
}
.csharpcode .lnum { color: #606060; }</style>

<h3>Conclusion</h3>


My initial goal when experimenting with the DLR was to figure out some techniques that could be used to make an application easily scriptable and allow functionality to be built as plugins that are just loaded and executed without the need to be compiled to an assembly first. While these examples provide a good start to making an application scriptable, there is still much to do yet in order to allow the script plugins to interact with each other.


**Download the Code: **

<div style="padding-bottom: 0px; margin: 0px; padding-left: 0px; padding-right: 0px; display: inline; float: none; padding-top: 0px" id="scid:8eb9d37f-1541-4f29-b6f4-1eea890d4876:d2b7394e-0db3-4f4d-b3b0-182aa242efab" class="wlWriterEditableSmartContent">
<div><a href="/files/SLXamlEmbeddedDLRScriptPart2_2.zip" target="_self">SLXamlEmbeddedDLRScriptPart2.zip</a></div></div>
