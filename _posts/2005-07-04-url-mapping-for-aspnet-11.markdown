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

Public Class BaseModuleRewriter<br />     Implements System.Web.IHttpModule

    Sub Init(ByVal app As HttpApplication) Implements IHttpModule.Init<br />         AddHandler app.AuthorizeRequest, AddressOf Me.BaseModuleRewriter_AuthorizeRequest<br />     End Sub

    Sub Dispose() Implements System.Web.IHttpModule.Dispose<br />     End Sub

    Sub BaseModuleRewriter_AuthorizeRequest(ByVal sender As Object, ByVal e As EventArgs)<br />         Dim app As HttpApplication = CType(sender, HttpApplication)<br />         Rewrite(app.Request.Path, app)<br />     End Sub

    Overridable Sub Rewrite(ByVal requestedPath As String, ByVal app As HttpApplication)<br />     End Sub

End Class

<span style="text-decoration: underline;">URLMappingModule.vb</span>

Imports System.Web<br /> Imports System.Configuration

Public Class URLMappingModule<br />     Inherits BaseModuleRewriter

    Overrides Sub Rewrite(ByVal requestedPath As String, ByVal app As HttpApplication)<br />         ''Implement functionality here that mimics the 'URL Mapping' features of ASP.NET 2.0<br />         Dim config As UrlMappingsConfigHandler = CType(ConfigurationSettings.GetConfig("system.web/urlMappings"), UrlMappingsConfigHandler)

        Dim pathOld As String, queryStringArg As String, pathNew As String = ""<br />         If config.Enabled Then<br />             pathOld = app.Request.RawUrl

            ''Get the request page without the querystring parameters<br />             Dim requestedPage As String = app.Request.RawUrl.ToLower<br />             If requestedPage.IndexOf("?") > -1 Then<br />                 requestedPage = requestedPage.Substring(0, requestedPage.IndexOf("?"))<br />             End If

            ''Format the requested page (url) to have a ~ instead of the virtual path of the app<br />             Dim appVirtualPath As String = app.Request.ApplicationPath<br />             If requestedPage.Length >= appVirtualPath.Length Then<br />                 If requestedPage.Substring(0, appVirtualPath.Length).ToLower = appVirtualPath.ToLower Then<br />                     requestedPage = requestedPage.Substring(appVirtualPath.Length)<br />                     If requestedPage.Substring(0, 1) = "/" Then<br />                         requestedPage = "~" &amp; requestedPage<br />                     Else<br />                         requestedPage = "~/" &amp; requestedPage<br />                     End If<br />                 End If<br />             End If

            ''Get the new path to rewrite the url to if it meets one<br />             ''of the defined virtual urls.<br />             pathNew = config.MappedUrl(requestedPage)

            ''If the requested url matches one of the virtual one<br />             ''the lets go and rewrite it.<br />             If pathNew.Length > 0 Then<br />                 If pathNew.IndexOf("?") > -1 Then<br />                     ''The matched page has a querystring defined<br />                     If pathOld.IndexOf("?") > -1 Then<br />                         pathNew += "&amp;" &amp; Right(pathOld, pathOld.Length - pathOld.IndexOf("?") - 1)<br />                     End If<br />                 Else<br />                     ''The matched page doesn't have a querystring defined<br />                     If pathOld.IndexOf("?") > -1 Then<br />                         pathNew += Right(pathOld, pathOld.Length - pathOld.IndexOf("?"))<br />                     End If<br />                 End If

                ''Rewrite to the new url<br />                 app.Context.Current.RewritePath(pathNew)<br />             End If

        End If<br />     End Sub

End Class

<span style="text-decoration: underline;">UrlMappingsConfigHandler.vb</span>

Imports System.Configuration<br /> Imports System.Xml

Public Class UrlMappingsConfigHandler<br /> Implements IConfigurationSectionHandler<br /> Dim _Section As XmlNode

Public Function Create(ByVal parent As Object, ByVal configContext As Object, ByVal section As System.Xml.XmlNode) As Object Implements System.Configuration.IConfigurationSectionHandler.Create<br />     _Section = section<br />     Return Me<br /> End Function

Friend Function Enabled() As Boolean<br />     ''' Get whether url mapping is enabled in the app.config<br />     If _Section.Attributes("enabled").Value.ToLower = "true" Then<br />         Return True<br />     Else<br />         Return False<br />     End If<br /> End Function

Friend Function MappedUrl(ByVal url As String) As String<br />     ''' Get the matching "mapped Url" from the web.config file if there is one.<br />     Dim x As XmlNode<br />     Dim _mappedURL As String = ""<br />     For Each x In _Section.ChildNodes<br />         If url.ToLower = x.Attributes("url").Value.ToLower Then<br />             _mappedURL = x.Attributes("mappedUrl").Value<br />         End If<br />     Next<br />     Return _mappedURL<br /> End Function

3) Now in the ASP.NET 1.1 app that you would like to use this in, just add the following lines to your web.config file:

[code:html]<br /> <?xml version="1.0" encoding="utf-8" ?><br /> <configuration><br />  <!-- Declare the custom 'urlMappings' section and handler --><br />  <configSections><br />         <sectionGroup name="system.web"><br />             <section name="urlMappings" type="URLMapping_HTTPModule.UrlMappingsConfigHandler,URLMapping_HTTPModule"/><br />         </sectionGroup><br />     </configSections><br />     <br />  <system.web><br />   <!-- Tell ASP.NET to use the URL Mapping HTTP Module --><br />   <httpModules><br />    <add type="URLMapping_HTTPModule.URLMappingModule, URLMapping_HTTPModule" name="URLMappingModule" /><br />   </httpModules><br />   <br />   <!-- This is the custom 'urlMappings' section --><br />   <urlMappings enabled="true"><br />    <add<br />     url="~/Chris.aspx"<br />     mappedUrl="~/Default.aspx?p=chris" /><br />    <add<br />     url="~/Kate.aspx"<br />     mappedUrl="~/Default.aspx?p=kate" /><br />    <add<br />     url="~/folder/test.aspx"<br />     mappedUrl="~/Default.aspx?p=foldertest" /><br />   </urlMappings><br />  </system.web><br /> </configuration><br /> ```
