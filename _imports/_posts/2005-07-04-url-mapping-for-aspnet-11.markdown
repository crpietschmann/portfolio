---
layout: post
blogengineid: 1948704a-e7ab-420c-aec7-1c9f85de5665
title: "URL Mapping for ASP.NET 1.1"
date: 2005-07-04 19:51:00 -0500
comments: true
published: true
categories: ["blog", "archives"]
tags: ["asp.net"]
redirect_from: 
  - /post/2005/07/04/URL-Mapping-for-ASPNET-11
  - /post/2005/07/04/url-mapping-for-aspnet-11
  - /post.aspx?id=1948704a-e7ab-420c-aec7-1c9f85de5665
---
<!-- more -->

With the help of an http module, a custom config handler and a few lines of code we can add the same ASP.NET 2.0 style URL Mapping to our ASP.NET 1.1 apps.

1) First lets start by creating a new Class Library project named 'URLMapping_HTTPModule'

2) Then create three files as listed below:

<span style="text-decoration: underline;">BaseModuleRewriter.vb</span>

Imports System.Web

Public Class BaseModuleRewriter
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

<span style="text-decoration: underline;">URLMappingModule.vb</span>

Imports System.Web
 Imports System.Configuration

Public Class URLMappingModule
     Inherits BaseModuleRewriter

    Overrides Sub Rewrite(ByVal requestedPath As String, ByVal app As HttpApplication)
         ''Implement functionality here that mimics the 'URL Mapping' features of ASP.NET 2.0
         Dim config As UrlMappingsConfigHandler = CType(ConfigurationSettings.GetConfig("system.web/urlMappings"), UrlMappingsConfigHandler)

        Dim pathOld As String, queryStringArg As String, pathNew As String = ""
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
                         requestedPage = "~" &amp; requestedPage
                     Else
                         requestedPage = "~/" &amp; requestedPage
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
                         pathNew += "&amp;" &amp; Right(pathOld, pathOld.Length - pathOld.IndexOf("?") - 1)
                     End If
                 Else
                     ''The matched page doesn't have a querystring defined
                     If pathOld.IndexOf("?") > -1 Then
                         pathNew += Right(pathOld, pathOld.Length - pathOld.IndexOf("?"))
                     End If
                 End If

                ''Rewrite to the new url
                 app.Context.Current.RewritePath(pathNew)
             End If

        End If
     End Sub

End Class

<span style="text-decoration: underline;">UrlMappingsConfigHandler.vb</span>

Imports System.Configuration
 Imports System.Xml

Public Class UrlMappingsConfigHandler
 Implements IConfigurationSectionHandler
 Dim _Section As XmlNode

Public Function Create(ByVal parent As Object, ByVal configContext As Object, ByVal section As System.Xml.XmlNode) As Object Implements System.Configuration.IConfigurationSectionHandler.Create
     _Section = section
     Return Me
 End Function

Friend Function Enabled() As Boolean
     ''' Get whether url mapping is enabled in the app.config
     If _Section.Attributes("enabled").Value.ToLower = "true" Then
         Return True
     Else
         Return False
     End If
 End Function

Friend Function MappedUrl(ByVal url As String) As String
     ''' Get the matching "mapped Url" from the web.config file if there is one.
     Dim x As XmlNode
     Dim _mappedURL As String = ""
     For Each x In _Section.ChildNodes
         If url.ToLower = x.Attributes("url").Value.ToLower Then
             _mappedURL = x.Attributes("mappedUrl").Value
         End If
     Next
     Return _mappedURL
 End Function

3) Now in the ASP.NET 1.1 app that you would like to use this in, just add the following lines to your web.config file:

[code:html]
 <?xml version="1.0" encoding="utf-8" ?>
 <configuration>
  <!-- Declare the custom 'urlMappings' section and handler -->
  <configSections>
         <sectionGroup name="system.web">
             <section name="urlMappings" type="URLMapping_HTTPModule.UrlMappingsConfigHandler,URLMapping_HTTPModule"/>
         </sectionGroup>
     </configSections>
     
  <system.web>
   <!-- Tell ASP.NET to use the URL Mapping HTTP Module -->
   <httpModules>
    <add type="URLMapping_HTTPModule.URLMappingModule, URLMapping_HTTPModule" name="URLMappingModule" />
   </httpModules>
   
   <!-- This is the custom 'urlMappings' section -->
   <urlMappings enabled="true">
    <add
     url="~/Chris.aspx"
     mappedUrl="~/Default.aspx?p=chris" />
    <add
     url="~/Kate.aspx"
     mappedUrl="~/Default.aspx?p=kate" />
    <add
     url="~/folder/test.aspx"
     mappedUrl="~/Default.aspx?p=foldertest" />
   </urlMappings>
  </system.web>
 </configuration>
 ```
