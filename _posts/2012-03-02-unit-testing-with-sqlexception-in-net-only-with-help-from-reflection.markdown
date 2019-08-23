---
layout: post
blogengineid: 74cd5433-76cf-4f17-bee6-1d46f7225070
title: "Unit Testing with SqlException in .NET: Only with help from Reflection"
date: 2012-03-02 07:32:58 -0600
comments: true
published: true
categories: ["blog", "archives"]
tags: ["C#", "TDD"]
redirect_from: 
  - /post/2012/03/02/Unit-Testing-with-SqlException-in-NET-Only-with-help-from-Reflection.aspx
  - /post/2012/03/02/Unit-Testing-with-SqlException-in-NET-Only-with-help-from-Reflection
  - /post/2012/03/02/unit-testing-with-sqlexception-in-net-only-with-help-from-reflection
  - /post.aspx?id=74cd5433-76cf-4f17-bee6-1d46f7225070
---
<!-- more -->

If you are writing you code to be able to easily unit test each method, and you would like to unit test situations where a SqlException exception is thrown, then you’ll definitely run into the issue of the SqlException objects constructor being marked “internal.” Members marked “internal” can be a nightmare for unit testing, and they are found all over the place in the .NET Framework. Basically you can’t call “internal” methods, constructors, fields, etc from you own code because it doesn’t reside within the same assembly as the internal code. Or can you? Actually, Yes, you can, but only with a little help from reflection. While it is not recommended (because of permissions, performance, and such) to do this within your applications, it should be perfectly fine within your Unit Test code base.  
While working on my <a href="http://dotnetext.codeplex.com/">dotNetExt</a> project, I wrote a simple helper that allowed me to easily instantiate a SqlException object with a specified error number. This allows me to write units tests that throw any SqlException I want, when I want.  
Here’s a direct link to the source code for the SqlExceptionHelper.Generate method:  
<a title="http://dotnetext.codeplex.com/SourceControl/changeset/view/65504#1129234" href="http://dotnetext.codeplex.com/SourceControl/changeset/view/65504#1129234">http://dotnetext.codeplex.com/SourceControl/changeset/view/65504#1129234</a>  
Here’s the full code so you can see it here. Remember, the latest source of the <a href="http://dotnetext.codeplex.com">dotNetExt</a> project will always have the latest source used within the project, and the code pasted below may become stale over time.  <pre class="csharpcode"><span class="rem">//Copyright (c) Chris Pietschmann 2012 ()</span>
<span class="rem">//All rights reserved.</span>
<span class="rem">//Licensed under the GNU Library General Public License (LGPL)</span>
<span class="rem">//License can be found here: http://www.codeplex.com/dotNetExt/license</span>

<span class="kwrd">using</span> System.Collections;
<span class="kwrd">using</span> System.Data.SqlClient;
<span class="kwrd">using</span> System.Runtime.Serialization;

<span class="kwrd">namespace</span> TestProject
{
    <span class="kwrd">public</span> <span class="kwrd">enum</span> SqlExceptionNumber : <span class="kwrd">int</span>
    {
        TimeoutExpired = -2,                    <span class="rem">// Timeout Expired. The timeout period elapsed prior to completion of the operation or the server is not responding</span>
        EncryptionNotSupported = 20,            <span class="rem">// The instance of SQL Server you attempted to connect to does not support encryption</span>
        LoginError = 64,                        <span class="rem">// A connection was successfully established with the server, but then an error occurred during the login process</span>
        ConnectionInitialization = 233,         <span class="rem">// The client was unable to establish a connection because of an error during connection initialization process before login</span>
        TransportLevelReceiving = 10053,        <span class="rem">// A transport-level error has occurred when receiving results from the server</span>
        TransportLevelSending = 10054,          <span class="rem">// A transport-level error has occurred when sending the request to the server.</span>
        EstablishingConnection = 10060,         <span class="rem">// A network-related or instance-specific error occurred while establishing a connection to SQL Server. The server was not found or was not accessible</span>
        ProcessingRequest = 40143,              <span class="rem">// The service has encountered an error processing your request. Please try again.</span>
        ServiceBudy = 40501,                    <span class="rem">// The service is currently busy. Retry the request after 10 seconds.</span>
        DatabaseOrServerNotAvailable = 40613    <span class="rem">// Database '%.*ls' on server '%.*ls' is not currently available. Please retry the connection later.</span>
    }

    <span class="kwrd">public</span> <span class="kwrd">class</span> SqlExceptionHelper
    {
        <span class="kwrd">public</span> <span class="kwrd">static</span> SqlException Generate(SqlExceptionNumber errorNumber)
        {
            <span class="kwrd">return</span> SqlExceptionHelper.Generate((<span class="kwrd">int</span>)errorNumber);
        }

        <span class="kwrd">public</span> <span class="kwrd">static</span> SqlException Generate(<span class="kwrd">int</span> errorNumber)
        {
            var ex = (SqlException)FormatterServices.GetUninitializedObject(<span class="kwrd">typeof</span>(SqlException));

            var errors = GenerateSqlErrorCollection(errorNumber);
            SetPrivateFieldValue(ex, <span class="str">&quot;_errors&quot;</span>, errors);

            <span class="kwrd">return</span> ex;
        }

        <span class="kwrd">private</span> <span class="kwrd">static</span> SqlErrorCollection GenerateSqlErrorCollection(<span class="kwrd">int</span> errorNumber)
        {
            var t = <span class="kwrd">typeof</span>(SqlErrorCollection);

            var col = (SqlErrorCollection)FormatterServices.GetUninitializedObject(t);
            
            SetPrivateFieldValue(col, <span class="str">&quot;errors&quot;</span>, <span class="kwrd">new</span> ArrayList());

            var sqlError = GenerateSqlError(errorNumber);
            var method = t.GetMethod(
                <span class="str">&quot;Add&quot;</span>,
                System.Reflection.BindingFlags.NonPublic | System.Reflection.BindingFlags.Instance
                );        
            method.Invoke(col, <span class="kwrd">new</span> <span class="kwrd">object</span>[] { sqlError });

            <span class="kwrd">return</span> col;
        }

        <span class="kwrd">private</span> <span class="kwrd">static</span> SqlError GenerateSqlError(<span class="kwrd">int</span> errorNumber)
        {
            var sqlError = (SqlError)FormatterServices.GetUninitializedObject(<span class="kwrd">typeof</span>(SqlError));

            SetPrivateFieldValue(sqlError, <span class="str">&quot;number&quot;</span>, errorNumber);
            SetPrivateFieldValue(sqlError, <span class="str">&quot;message&quot;</span>, <span class="kwrd">string</span>.Empty);
            SetPrivateFieldValue(sqlError, <span class="str">&quot;procedure&quot;</span>, <span class="kwrd">string</span>.Empty);
            SetPrivateFieldValue(sqlError, <span class="str">&quot;server&quot;</span>, <span class="kwrd">string</span>.Empty);
            SetPrivateFieldValue(sqlError, <span class="str">&quot;source&quot;</span>, <span class="kwrd">string</span>.Empty);

            <span class="kwrd">return</span> sqlError;
        }

        <span class="kwrd">private</span> <span class="kwrd">static</span> <span class="kwrd">void</span> SetPrivateFieldValue(<span class="kwrd">object</span> obj, <span class="kwrd">string</span> field, <span class="kwrd">object</span> val)
        {
            var member = obj.GetType().GetField(
                field,
                System.Reflection.BindingFlags.NonPublic | System.Reflection.BindingFlags.Instance
                );
            member.SetValue(obj, val);
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
