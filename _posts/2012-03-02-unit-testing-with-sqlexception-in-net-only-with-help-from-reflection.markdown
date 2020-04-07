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

While working on my <a href="https://github.com/crpietschmann/dotnetext">dotNetExt</a> project, I wrote a simple helper that allowed me to easily instantiate a SqlException object with a specified error number. This allows me to write units tests that throw any SqlException I want, when I want.

Here’s a direct link to the source code for the SqlExceptionHelper.Generate method:  
<a title="SqlExceptionHelper source code" href="https://github.com/crpietschmann/dotnetext/blob/4ed40d20dbab210256d93fd20660e3fa2c264ad6/TestProject/SqlExceptionHelper.cs">/TestProject/SqlExceptionHelper.cs</a>

Here’s the full code so you can see it here. Remember, the latest source of the <a href="https://github.com/crpietschmann/dotnetext">dotNetExt</a> project will always have the latest source used within the project, and the code pasted below may become stale over time.  

```csharp
//Copyright (c) Chris Pietschmann 2012 (http://pietschsoft.com)
//All rights reserved.
//Licensed under the GNU Library General Public License (LGPL)
//License can be found here: http://www.codeplex.com/dotNetExt/license

using System.Collections;
using System.Data.SqlClient;
using System.Runtime.Serialization;

namespace TestProject
{
    public enum SqlExceptionNumber : int
    {
        TimeoutExpired = -2,                    // Timeout Expired. The timeout period elapsed prior to completion of the operation or the server is not responding
        EncryptionNotSupported = 20,            // The instance of SQL Server you attempted to connect to does not support encryption
        LoginError = 64,                        // A connection was successfully established with the server, but then an error occurred during the login process
        ConnectionInitialization = 233,         // The client was unable to establish a connection because of an error during connection initialization process before login
        TransportLevelReceiving = 10053,        // A transport-level error has occurred when receiving results from the server
        TransportLevelSending = 10054,          // A transport-level error has occurred when sending the request to the server.
        EstablishingConnection = 10060,         // A network-related or instance-specific error occurred while establishing a connection to SQL Server. The server was not found or was not accessible
        ProcessingRequest = 40143,              // The service has encountered an error processing your request. Please try again.
        ServiceBudy = 40501,                    // The service is currently busy. Retry the request after 10 seconds.
        DatabaseOrServerNotAvailable = 40613    // Database '%.*ls' on server '%.*ls' is not currently available. Please retry the connection later.
    }

    public class SqlExceptionHelper
    {
        public static SqlException Generate(SqlExceptionNumber errorNumber)
        {
            return SqlExceptionHelper.Generate((int)errorNumber);
        }

        public static SqlException Generate(int errorNumber)
        {
            var ex = (SqlException)FormatterServices.GetUninitializedObject(typeof(SqlException));

            var errors = GenerateSqlErrorCollection(errorNumber);
            SetPrivateFieldValue(ex, "_errors", errors);

            return ex;
        }

        private static SqlErrorCollection GenerateSqlErrorCollection(int errorNumber)
        {
            var t = typeof(SqlErrorCollection);

            var col = (SqlErrorCollection)FormatterServices.GetUninitializedObject(t);

            SetPrivateFieldValue(col, "errors", new ArrayList());

            var sqlError = GenerateSqlError(errorNumber);
            var method = t.GetMethod(
                "Add",
                System.Reflection.BindingFlags.NonPublic | System.Reflection.BindingFlags.Instance
                );
            method.Invoke(col, new object[] { sqlError });

            return col;
        }

        private static SqlError GenerateSqlError(int errorNumber)
        {
            var sqlError = (SqlError)FormatterServices.GetUninitializedObject(typeof(SqlError));

            SetPrivateFieldValue(sqlError, "number", errorNumber);
            SetPrivateFieldValue(sqlError, "message", string.Empty);
            SetPrivateFieldValue(sqlError, "procedure", string.Empty);
            SetPrivateFieldValue(sqlError, "server", string.Empty);
            SetPrivateFieldValue(sqlError, "source", string.Empty);

            return sqlError;
        }

        private static void SetPrivateFieldValue(object obj, string field, object val)
        {
            var member = obj.GetType().GetField(
                field,
                System.Reflection.BindingFlags.NonPublic | System.Reflection.BindingFlags.Instance
                );
            member.SetValue(obj, val);
        }
    }
}
```
