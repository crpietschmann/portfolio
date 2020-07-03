---
layout: post
blogengineid: 21c6af9f-f2b6-47a0-9749-c3731c41d475
title: "ASP.NET 2.0: URL Mapping with RegEx Support"
date: 2005-11-12 13:36:00 -0600
comments: true
published: true
categories: ["ASP.NET"]
tags: ["General"]
redirect_from: 
  - /post/2005/11/12/ASPNET-20-URL-Mapping-with-RegEx-Support.aspx
  - /post/2005/11/12/ASPNET-20-URL-Mapping-with-RegEx-Support
  - /post/2005/11/12/aspnet-20-url-mapping-with-regex-support
  - /post.aspx?id=21c6af9f-f2b6-47a0-9749-c3731c41d475
  - /Blog/archive/2005/11/12/762.aspx
---

The one big limitation of the URL Mapping functionality built in to ASP.NET 2.0 is that it doesn't support regular expressions. I ported my v1.1 URL Mapping implementation over to v2.0 and added support for regular expressions. It really wasn't too difficult; I only had to modify two lines of code to port it over to ASP.NET 2.0. Then I had to modify 4 lines of code to add RegEx support. My implementation works just like the ASP.NET 2.0 URL Mapping functionality with the addition of RegEx.

My code allows to create Url Mappings similar to the following:
~/Chris.aspx to ~/Default.aspx?p=chris
~/Show154.aspx to ~/Default.aspx?p=154

Some Performance tips for using this code:

1. Use as few Url Mapping definitions as possible since it parses them from the first to the last and stops when it finds a match. If a page requested doesn't match any of the definitions it will go through all of them before moving on to complete the page request.
2. Put the most frequently used Url Mappings first in the list so that they the ones that are parsed first.
3. The first Url Mapping in placed in my code (`<add url="~/(.*)default\.aspx" mappedUrl="~/$1default.aspx" />`) is a little trick that allows all requests for the Default.aspx page in the root or any sub-folder of the application to be completed with out having to parse through the entire list of Url Mappings.
Regular expression support just seems logical in the v2.0 URL Mapping functionality, but I don't know why Microsoft didn't add it. I guess they wanted me to have something to do.  :)

Enjoy!

Code for this implementation listed below:

## /App_Code/RegExUrlMappingBaseModule.vb

```VB
Imports Microsoft.VisualBasic

Imports System.Web

Namespace RegExUrlMapping_HTTPModule

Public Class RegExUrlMappingBaseModule

Implements System.Web.IHttpModule

Sub Init(ByVal app As HttpApplication) Implements IHttpModule.Init

AddHandler app.AuthorizeRequest, AddressOf Me.BaseModuleRewriter_AuthorizeRequest

End Sub

Sub Dispose() Implements System.Web.IHttpModule.Dispose

End Sub

Sub BaseModuleRewriter_AuthorizeRequest(ByVal sender As Object, ByVal e As EventArgs)

Dim app As HttpApplication = CType(sender, HttpApplication)

Rewrite(app.Request.Path, app)

End Sub

Overridable Sub Rewrite(ByVal requestedPath As String, ByVal app As HttpApplication)

End Sub

End Class

End Namespace
```

## /App_Code/RegExUrlMappingConfigHandler.vb

```VB
Imports Microsoft.VisualBasic

Imports System.Configuration

Imports System.Xml

Namespace RegExUrlMapping_HTTPModule

Public Class RegExUrlMappingConfigHandler

Implements IConfigurationSectionHandler

Dim _Section As XmlNode

Public Function Create(ByVal parent As Object, ByVal configContext As Object, ByVal section As System.Xml.XmlNode) As Object Implements System.Configuration.IConfigurationSectionHandler.Create

_Section = section

Return Me

End Function

''' Get whether url mapping is enabled in the app.config

Friend Function Enabled() As Boolean

If _Section.Attributes("enabled").Value.ToLower = "true" Then

Return True

Else

Return False

End If

End Function

''' Get the matching "mapped Url" from the web.config file if there is one.

Friend Function MappedUrl(ByVal url As String) As String

Dim x As XmlNode

Dim oReg As Regex

For Each x In _Section.ChildNodes

oReg = New Regex(x.Attributes("url").Value.ToLower)

If oReg.Match(url).Success Then

Return oReg.Replace(url, x.Attributes("mappedUrl").Value.ToLower)

End If

Next

Return ""

End Function

End Class

End Namespace
```

## /App_Code/RegExUrlMappingModule.vb

```VB
Imports Microsoft.VisualBasic

Imports System.Web

Imports System.Configuration

Namespace RegExUrlMapping_HTTPModule

Public Class RegExUrlMappingModule

Inherits RegExUrlMappingBaseModule

Overrides Sub Rewrite(ByVal requestedPath As String, ByVal app As HttpApplication)

''Implement functionality here that mimics the 'URL Mapping' features of ASP.NET 2.0

Dim config As RegExUrlMappingConfigHandler = CType(ConfigurationManager.GetSection("system.web/RegExUrlMapping"), RegExUrlMappingConfigHandler)

Dim pathOld As String, pathNew As String = ""

If config.Enabled Then

pathOld = app.Request.RawUrl

''Get the request page without the querystring parameters

Dim requestedPage As String = app.Request.RawUrl.ToLower

If requestedPage.IndexOf("?") > -1 Then

requestedPage = requestedPage.Substring(0, requestedPage.IndexOf("?"))

End If

''Format the requested page (url) to have a ~ instead of the virtual path of the app

Dim appVirtualPath As String = app.Request.ApplicationPath

If requestedPage.Length >= appVirtualPath.Length Then

If requestedPage.Substring(0, appVirtualPath.Length).ToLower = appVirtualPath.ToLower Then

requestedPage = requestedPage.Substring(appVirtualPath.Length)

If requestedPage.Substring(0, 1) = "/" Then

requestedPage = "~" & requestedPage

Else

requestedPage = "~/" & requestedPage

End If

End If

End If

''Get the new path to rewrite the url to if it meets one

''of the defined virtual urls.

pathNew = config.MappedUrl(requestedPage)

''If the requested url matches one of the virtual one

''the lets go and rewrite it.

If pathNew.Length > 0 Then

If pathNew.IndexOf("?") > -1 Then

''The matched page has a querystring defined

If pathOld.IndexOf("?") > -1 Then

pathNew += "&" & Right(pathOld, pathOld.Length - pathOld.IndexOf("?") - 1)

End If

Else

''The matched page doesn't have a querystring defined

If pathOld.IndexOf("?") > -1 Then

pathNew += Right(pathOld, pathOld.Length - pathOld.IndexOf("?"))

End If

End If

''Rewrite to the new url

HttpContext.Current.RewritePath(pathNew, false)

End If

End If

End Sub

End Class

End Namespace
```

## /Web.Config

```
<configuration>

<!-- Declare the custom 'RegExUrlMapping' section and handler -->

<configSections>

<sectionGroup name="system.web">

<section name="RegExUrlMapping" type="RegExUrlMapping_HTTPModule.RegExUrlMappingConfigHandler"/>

</sectionGroup>

</configSections>

<system.web>
<!-- Tell ASP.NET to use the RegEx URL Mapping HTTP Module -->

<httpModules>

<add type="RegExUrlMapping_HTTPModule.RegExUrlMappingModule" name="RegExUrlMappingModule"/>

</httpModules>

<!-- The RegEx URL Mapping parser goes through these in sequential order. -->

<RegExUrlMapping enabled="true">
<add url="~/(.*)default\.aspx" mappedUrl="~/$1default.aspx" />

<add url="~/Chris.aspx" mappedUrl="~/Default.aspx?p=chris"/>

<add url="~/show(.*)\.aspx" mappedUrl="~/Default.aspx?p=$1&amp;section=3"/>

</RegExUrlMapping>

</system.web>

</configuration>
```

ASP.NET 1.1 Url Mapping code can be found here: <http://pietschsoft.com/Blog/archive/2005/07/04/717.aspx>

> **Update 11/14/2005** - Scott Guthrie (ScottGu) has posted about why they didn't add Regular Expression support to the ASP.NET 2.0 URL Mapping on his blog. He has also posted a link to this blog entry in that blog post. It's pretty cool that my blog has gotten noticed by him. <http://weblogs.asp.net/scottgu/archive/2005/11/14/430493.aspx>

> **Update 9/10/2007** - I fixed a bug in the RegExUrlMapping code that was preventing ASP.NET Themes from correctly loading.
>
> In the RegExUrlMappingModule class change the following line of the Rewrite method: `HttpContext.Current.RewritePath(pathNew)`
>
> To be the following instead: `HttpContext.Current.RewritePath(pathNew, false)`
>
> I already made this change to the code above so anyone copying it from now on will get this fix.

> **Update 3/23/2009** - I just found that this post is mentioned in the "ASP.NET 2.0 MVP Hacks and Tips" book that was published in May 2006 on Page 357. I find that one of my blog posts being mentioned in a book like this to be really interesting. Thanks for the props guys!!