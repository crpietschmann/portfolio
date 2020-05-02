---
layout: post
blogengineid: cb2fb342-bf26-4aad-9d46-29a1450ef83e
title: "ASP.NET Client Callbacks inside a User Control"
date: 2005-12-10 14:10:00 -0600
comments: true
published: true
categories: ["blog", "archives"]
tags: ["asp.net"]
redirect_from: 
  - /post/2005/12/10/ASPNET-20-Client-Callbacks-inside-a-User-Control.aspx
  - /post/2005/12/10/ASPNET-20-Client-Callbacks-inside-a-User-Control
  - /post/2005/12/10/aspnet-20-client-callbacks-inside-a-user-control
  - /post.aspx?id=cb2fb342-bf26-4aad-9d46-29a1450ef83e
---
<!-- more -->

Implementing Client Callbacks (AJAX) in ASP.NET 2.0 is actually really simple to do as long as you know a little JavaScript. Heres is a small example of using a Client Callback from within a User Control. I've tested this example with IE6 and Firefox 1.5

```VB
<%@ Control Language="VB" ClassName="ClientCallbackControl"%>
 <%@ Implements Interface="System.Web.UI.ICallbackEventHandler"%>
 <script runat="server">
     ''This is the variable that holds the client callback
     ''results that will be returned to the client.
     Dim MyCallbackResult As String
 
     ''This is the server-side function that is called when the
     ''client callback results are returned to the browser.
     Public Function GetCallbackResult() As String Implements System.Web.UI.ICallbackEventHandler.GetCallbackResult
         Return MyCallbackResult
     End Function
 
     ''This is the server-side function that is called when the
     ''client callback is fired off.
     Public Sub RaiseCallbackEvent(ByVal eventArgument As String) Implements System.Web.UI.ICallbackEventHandler.RaiseCallbackEvent
         MyCallbackResult = Now.ToString
     End Sub
 
     Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
         ''Get Client Side ID of this instance of the User Control
         ''This will be used to Prefix all the JavaScript functions
         ''this control uses so that you can have multiple instances
         ''of this control on the same page.
         Dim strJSCallbackPrefix As String = Me.ClientID
 
         ''Get the JavaScript that will callback to the server
         Dim cm As ClientScriptManager = Page.ClientScript
         Dim cbReference As String
         cbReference = cm.GetCallbackEventReference(Me, _
             "arg", _
             strJSCallbackPrefix & "ReceiveServerData", _
             "context")
 
         ''Declare the function that will be called to fire off a
         ''client callback to the server.
         Dim callbackScript As String = _
             "function " & strJSCallbackPrefix & "CallServer(arg, context){" & cbReference & "; }"
         cm.RegisterClientScriptBlock(Me.GetType(), strJSCallbackPrefix & "CallServer", callbackScript, True)
 
         ''Declare the function that will recieve the client callback
         ''results from the server.
         Dim strReceiveServerData As String = _
             "function " & strJSCallbackPrefix & "ReceiveServerData(arg, context){context.innerHTML = arg;}"
         cm.RegisterClientScriptBlock(Me.GetType, strJSCallbackPrefix & "ReceiveServerData", strReceiveServerData, True)
 
 
         ''Set the JavaScript that is run when the button is clicked
         ''This sends the context of lblMessage1 so that the
         ''ReceiveServerData function can change its value to what is
         ''returned from the server.
        Button1.OnClientClick = _
             strJSCallbackPrefix & "CallServer(1, document.getElementById('" & lblMessage1.ClientID & "')); " & _
             "return false;"
 
 
         ''Load lblMessage1 with it's value on initial load of the page.
         RaiseCallbackEvent(1)
         lblMessage1.Text = GetCallbackResult()
     End Sub
 </script>
 <asp:Button ID="Button1" runat="server" Text="Get DateTime Stamp" />
 <asp:Label runat="server" ID="lblMessage1"></asp:Label>
```