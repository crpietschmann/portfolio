---
layout: post
blogengineid: e06592b2-190b-4ac4-b992-c68081e89afd
title: "Silverlight: Embed IronRuby/DLR Scripting within XAML using IValueConverter and Custom UserControl"
date: 2010-10-02 14:40:00 -0500
comments: true
published: true
categories: ["blog", "archives"]
tags: ["DLR", "Ruby", "Silverlight"]
redirect_from: 
  - /post/2010/10/02/Silverlight-Embed-IronRubyDLR-Scripting-within-XAML-using-IValueConverter-and-Custom-UserControl
  - /post/2010/10/02/silverlight-embed-ironrubydlr-scripting-within-xaml-using-ivalueconverter-and-custom-usercontrol
  - /post.aspx?id=e06592b2-190b-4ac4-b992-c68081e89afd
---
<!-- more -->

After I wrote the “<a href="/post/2010/09/29/Intro-to-IronRubyDLR-Scripting-in-C-Silverlight-4-Application.aspx">Intro to IronRuby/DLR Scripting in C# Silverlight 4 Application</a>” post, I came across an interesting series on <a href="http://www.thinkbottomup.com.au/site/blog/Embedding_DLR_Scripts_in_XAML_Part_6">embedding DLR scripts in XAML with WPF</a>. This is an interesting series, although the code doesn’t run in Silverlight, due to the fact that Silverlight is only a subset of WPF and doesn’t support the <a href="http://msdn.microsoft.com/en-us/library/system.windows.markup.markupextension.aspx">System.Windows.Markup.MarkupExtension</a> class. I test out a couple things in Silverlight, and I was able to get similar DLR scripting functionality working under Silverlight using a combination of a simple, custom <a href="http://msdn.microsoft.com/en-us/library/system.windows.data.ivalueconverter.aspx">IValueConverter</a> and a custom UserControl class.  
If you are unfamiliar with <a href="http://timheuer.com/blog/archive/2008/07/30/format-data-in-silverlight-databinding-valueconverter.aspx">value converters</a> and the <a href="http://msdn.microsoft.com/en-us/library/system.windows.data.ivalueconverter.aspx">IValueConverter</a> interface (same for both Silverlight and WPF), you may want to look it up and learn how to create your own. Value converters are tremendously helpful when performing data binding.  <h3>Embedded IronRuby within XAML</h3>  
To start, here’s a few examples of IronRuby code embedded within a custom IValueConverter and custom UserControl. As you’ll see, this can be very effective to embed scripting to define how to display the values bound, or to manipulate the content of the custom user control. Although, you must keep in mind that this is not limited to simple tasks such as these. You have the full power of the DLR and .NET within the DLR scripts being executed, so there really is no limit to what could be coded within.  <pre class="csharpcode"><span class="kwrd"><</span><span class="html">UserControl</span> <span class="attr">x:Class</span><span class="kwrd">=&quot;SLXamlEmbeddedScript.MainPage&quot;</span>
    <span class="attr">xmlns</span><span class="kwrd">=&quot;http://schemas.microsoft.com/winfx/2006/xaml/presentation&quot;</span>
    <span class="attr">xmlns:x</span><span class="kwrd">=&quot;http://schemas.microsoft.com/winfx/2006/xaml&quot;</span>
    <span class="attr">xmlns:d</span><span class="kwrd">=&quot;http://schemas.microsoft.com/expression/blend/2008&quot;</span>
    <span class="attr">xmlns:mc</span><span class="kwrd">=&quot;http://schemas.openxmlformats.org/markup-compatibility/2006&quot;</span>
             
    <span class="attr">xmlns:system</span><span class="kwrd">=&quot;clr-namespace:System;assembly=mscorlib&quot;</span>
    <span class="attr">xmlns:local</span><span class="kwrd">=&quot;clr-namespace:SLXamlEmbeddedScript&quot;</span>
             
    <span class="attr">mc:Ignorable</span><span class="kwrd">=&quot;d&quot;</span>
    <span class="attr">d:DesignHeight</span><span class="kwrd">=&quot;300&quot;</span> <span class="attr">d:DesignWidth</span><span class="kwrd">=&quot;400&quot;</span>
    <span class="attr">x:Name</span><span class="kwrd">=&quot;root&quot;</span> <span class="attr">DataContext</span><span class="kwrd">=&quot;test&quot;</span><span class="kwrd">></span>
    <span class="kwrd"><</span><span class="html">UserControl.Resources</span><span class="kwrd">></span>
        <span class="rem"><!-- This converter uses a Ruby object's 'add' method</span>
<span class="rem">        to add 5 plus 5 and return the results</span>
<span class="rem">        --></span>
        <span class="kwrd"><</span><span class="html">local:DLRScriptValueConverter</span> <span class="attr">x:Key</span><span class="kwrd">=&quot;FivePlusFiveConverter&quot;</span> <span class="attr">xml:space</span><span class="kwrd">=&quot;preserve&quot;</span><span class="kwrd">></span>
            class AddFive
                def add
                    5 + 5
                end
            end
            a = AddFive.new
            a.add
        <span class="kwrd"></</span><span class="html">local:DLRScriptValueConverter</span><span class="kwrd">></span>

        <span class="rem"><!-- This converter uses the value being bound via data binding,</span>
<span class="rem">        passed through to IronRuby as 'ConverterValue', and generates a custom</span>
<span class="rem">        value to return. In this case it concatenates the FirstName and LastName</span>
<span class="rem">        properties --></span>
        <span class="kwrd"><</span><span class="html">local:DLRScriptValueConverter</span> <span class="attr">x:Key</span><span class="kwrd">=&quot;GetFullNameConverter&quot;</span> <span class="attr">xml:space</span><span class="kwrd">=&quot;preserve&quot;</span><span class="kwrd">></span>
            ConverterValue.FirstName + &quot; &quot; + ConverterValue.LastName
        <span class="kwrd"></</span><span class="html">local:DLRScriptValueConverter</span><span class="kwrd">></span>

    <span class="kwrd"></</span><span class="html">UserControl.Resources</span><span class="kwrd">></span>

    <span class="kwrd"><</span><span class="html">StackPanel</span> <span class="attr">x:Name</span><span class="kwrd">=&quot;LayoutRoot&quot;</span> <span class="attr">Background</span><span class="kwrd">=&quot;White&quot;</span><span class="kwrd">></span>
        
        <span class="rem"><!-- Bind using the FivePlusFiveConverter defined above --></span>
        <span class="kwrd"><</span><span class="html">TextBlock</span> <span class="attr">Text</span><span class="kwrd">=&quot;{Binding Converter={StaticResource FivePlusFiveConverter}}&quot;</span><span class="kwrd">></</span><span class="html">TextBlock</span><span class="kwrd">></span>
        
        <span class="rem"><!-- Bind using the GetFullNameConverter defined above --></span>
        <span class="kwrd"><</span><span class="html">TextBlock</span> <span class="attr">Text</span><span class="kwrd">=&quot;{Binding ElementName=root, Converter={StaticResource GetFullNameConverter}}&quot;</span><span class="kwrd">></</span><span class="html">TextBlock</span><span class="kwrd">></span>
        
        <span class="rem"><!-- Use DLRScriptUserControl (custom UserControl) to embed</span>
<span class="rem">        IronRuby code within XAML and execute it on the Content of</span>
<span class="rem">        the control. --></span>
        <span class="kwrd"><</span><span class="html">local:DLRScriptUserControl</span> <span class="attr">x:Name</span><span class="kwrd">=&quot;testusercontrol&quot;</span><span class="kwrd">></span>
            <span class="kwrd"><</span><span class="html">local:DLRScriptUserControl.Script</span><span class="kwrd">></span>
                <span class="kwrd"><</span><span class="html">system:String</span> <span class="attr">xml:space</span><span class="kwrd">=&quot;preserve&quot;</span><span class="kwrd">></span>
                    Ctrl.FindName('txtName').Text = 'Hello from IronRuby'
                <span class="kwrd"></</span><span class="html">system:String</span><span class="kwrd">></span>
            <span class="kwrd"></</span><span class="html">local:DLRScriptUserControl.Script</span><span class="kwrd">></span>
            <span class="kwrd"><</span><span class="html">local:DLRScriptUserControl.Content</span><span class="kwrd">></span>
                <span class="kwrd"><</span><span class="html">TextBlock</span> <span class="attr">x:Name</span><span class="kwrd">=&quot;txtName&quot;</span><span class="kwrd">></span>Default<span class="kwrd"></</span><span class="html">TextBlock</span><span class="kwrd">></span>
            <span class="kwrd"></</span><span class="html">local:DLRScriptUserControl.Content</span><span class="kwrd">></span>
        <span class="kwrd"></</span><span class="html">local:DLRScriptUserControl</span><span class="kwrd">></span>
        
    <span class="kwrd"></</span><span class="html">StackPanel</span><span class="kwrd">></span>
<span class="kwrd"></</span><span class="html">UserControl</span><span class="kwrd">></span></pre>
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


One thing to not about the above usage code, is that you must use *xml:space=”preserve”* when embeding the IronRuby/DLR scripts. This will ensure the line breaks are preserved in the resulting string. Without it the code will not run, since the IronRuby syntax depends on those line breaks.

<h3>DLRScriptValueConverter - IValueConverter</h3>


This value converter is really simple, and allows you to specify ConvertScript and ConvertBackScript to allow the value converter to convert in two way mode.


Also, as you’ll see from the code, you could make this value converter work with both IronRuby and IronPython, as the Language property suggests. Although, for this simple example, the only supported language is IronRuby. To support IronPython it’s just a matter of instantiating the appropriate ScriptEngine class to Execute the script with.

<pre class="csharpcode"><span class="kwrd">using</span> System;
<span class="kwrd">using</span> System.Windows.Data;
<span class="kwrd">using</span> System.Windows.Markup;
<span class="kwrd">using</span> Microsoft.Scripting.Hosting;

<span class="kwrd">namespace</span> SLXamlEmbeddedScript
{
    [ContentProperty(<span class="str">&quot;ConvertScript&quot;</span>)]
    <span class="kwrd">public</span> <span class="kwrd">class</span> DLRScriptValueConverter : IValueConverter
    {
        <span class="kwrd">public</span> DLRScriptValueConverter()
        {
            <span class="kwrd">this</span>.Language = <span class="str">&quot;IronRuby&quot;</span>;
        }

        <span class="kwrd">public</span> <span class="kwrd">string</span> Language { get; set; }
        <span class="kwrd">public</span> <span class="kwrd">string</span> ConvertScript { get; set; }
        <span class="kwrd">public</span> <span class="kwrd">string</span> ConvertBackScript { get; set; }

        <span class="preproc">#region</span> IValueConverter Members

        <span class="kwrd">public</span> <span class="kwrd">object</span> Convert(<span class="kwrd">object</span> <span class="kwrd">value</span>, Type targetType, <span class="kwrd">object</span> parameter, System.Globalization.CultureInfo culture)
        {
            <span class="kwrd">if</span> (<span class="kwrd">string</span>.IsNullOrEmpty(<span class="kwrd">this</span>.Language))
            {
                <span class="kwrd">throw</span> <span class="kwrd">new</span> InvalidOperationException(<span class="str">&quot;DLRScriptValueConverter.Language property must be set&quot;</span>);
            }
            
            <span class="kwrd">if</span> (<span class="kwrd">string</span>.IsNullOrEmpty(<span class="kwrd">this</span>.ConvertScript))
            {
                <span class="kwrd">throw</span> <span class="kwrd">new</span> InvalidOperationException(<span class="str">&quot;parameter or DLRScriptValueConverter.ConvertScript property must be contain a value&quot;</span>);
            }

            <span class="kwrd">if</span> (<span class="kwrd">this</span>.Language.ToLowerInvariant() != <span class="str">&quot;ironruby&quot;</span>)
            {
                <span class="kwrd">throw</span> <span class="kwrd">new</span> InvalidOperationException(<span class="kwrd">string</span>.Format(<span class="str">&quot;Unsupported DLR Language ({0}). Currently only IronRuby is supported.&quot;</span>, <span class="kwrd">this</span>.Language));
            }

            <span class="rem">// Create Ruby ScriptEngine</span>
            ScriptEngine engine = IronRuby.Ruby.CreateEngine();

            <span class="rem">// Make the &quot;value&quot; to be converted available to the DLR</span>
            engine.Runtime.Globals.SetVariable(<span class="str">&quot;ConverterValue&quot;</span>, <span class="kwrd">value</span>);

            <span class="rem">// Execute the script and return its result</span>
            <span class="kwrd">return</span> engine.Execute(<span class="kwrd">this</span>.ConvertScript);
        }

        <span class="kwrd">public</span> <span class="kwrd">object</span> ConvertBack(<span class="kwrd">object</span> <span class="kwrd">value</span>, Type targetType, <span class="kwrd">object</span> parameter, System.Globalization.CultureInfo culture)
        {
            <span class="kwrd">if</span> (<span class="kwrd">string</span>.IsNullOrEmpty(<span class="kwrd">this</span>.Language))
            {
                <span class="kwrd">throw</span> <span class="kwrd">new</span> InvalidOperationException(<span class="str">&quot;DLRScriptValueConverter.Language property must be set&quot;</span>);
            }

            <span class="kwrd">if</span> (<span class="kwrd">string</span>.IsNullOrEmpty(<span class="kwrd">this</span>.ConvertBackScript))
            {
                <span class="kwrd">throw</span> <span class="kwrd">new</span> InvalidOperationException(<span class="str">&quot;parameter or DLRScriptValueConverter.ConvertBackScript property must be contain a value&quot;</span>);
            }

            <span class="kwrd">if</span> (<span class="kwrd">this</span>.Language.ToLowerInvariant() != <span class="str">&quot;ironruby&quot;</span>)
            {
                <span class="kwrd">throw</span> <span class="kwrd">new</span> InvalidOperationException(<span class="kwrd">string</span>.Format(<span class="str">&quot;Unsupported DLR Language ({0}). Currently only IronRuby is supported.&quot;</span>, <span class="kwrd">this</span>.Language));
            }

            <span class="rem">// Create Ruby ScriptEngine</span>
            ScriptEngine engine = IronRuby.Ruby.CreateEngine();

            <span class="rem">// Make the &quot;value&quot; to be converted available to the DLR</span>
            engine.Runtime.Globals.SetVariable(<span class="str">&quot;ConverterValue&quot;</span>, <span class="kwrd">value</span>);

            <span class="rem">// Execute the script and return its result</span>
            <span class="kwrd">return</span> engine.Execute(<span class="kwrd">this</span>.ConvertBackScript);
        }

        <span class="preproc">#endregion</span>
    }
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

<h3>DLRScriptUserControl – Custom UserControl</h3>


Just like the value converter above, the DLRScriptUserControl control is really simple. It inherits from UserControl to allow you to set the controls Content property to the XAML you want it to display, and implements a Script property that allows you to define the IronRuby script to execute.


When the IronRuby script is executed during the controls Loaded event, the control passes IronRuby a global variable named ‘Ctrl’ that contains a reference to the DLRScriptUserControl object itself. Like the XAML example above, this allows you to execute any code you want against the control once it is Loaded.

<pre class="csharpcode"><span class="kwrd">using</span> System.Windows;
<span class="kwrd">using</span> System.Windows.Controls;
<span class="kwrd">using</span> IronRuby;
<span class="kwrd">using</span> Microsoft.Scripting.Hosting;

<span class="kwrd">namespace</span> SLXamlEmbeddedScript
{
    <span class="kwrd">public</span> <span class="kwrd">class</span> DLRScriptUserControl : UserControl
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
            
            <span class="rem">// Give IronRuby access to this control via a variable named 'Ctrl'</span>
            engine.Runtime.Globals.SetVariable(<span class="str">&quot;Ctrl&quot;</span>, <span class="kwrd">this</span>);
            
            <span class="rem">// Execute the code</span>
            engine.Execute(<span class="kwrd">this</span>.Script <span class="kwrd">as</span> <span class="kwrd">string</span>, engine.CreateScope());
        }
    }
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


The above code is rather simple, and not meant for production use. It is just a basic prototype framework of how you might embed some DLR scripting within a Silverlight application. One thing I plan on looking into next (and I may or may not blog about it) is using the <a href="http://msdn.microsoft.com/en-us/library/cc190359%28VS.95%29.aspx">XamlReader</a> class to dynamically load the XAML and its embedded DLR script at runtime. The combination of both would allow you to build some very simple plugin-like functionality into your applications.


Hope this helps someone.


**Continued Here: **<a href="/post/2010/10/17/Silverlight-Embed-IronRuby-within-XAML-Part-2.aspx">**Silverlight: Embed IronRuby within XAML Part 2**</a>
