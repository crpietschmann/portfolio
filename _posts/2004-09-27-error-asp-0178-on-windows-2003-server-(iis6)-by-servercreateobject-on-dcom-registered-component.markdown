---
layout: post
title: "Error ASP 0178 on Windows 2003 Server (IIS6) by Server.CreateObject on DCOM registered Component"
date: 2004-09-27 11:29:00 -0500
comments: true
published: true
categories: ["blog", "archives"]
tags: ["General"]
redirect_from: 
  - /post/2004/09/27/Error-ASP-0178-on-Windows-2003-Server-(IIS6)-by-ServerCreateObject-on-DCOM-registered-Component
 -  /post/2004/09/27/error-asp-0178-on-windows-2003-server-(iis6)-by-servercreateobject-on-dcom-registered-component
---
<!-- more -->
<P>This error is a permissions problem. This is a very frustrating problem for someone who doesn't know Windows Server 2003 very well. 
<P>Heres is a workaround:<BR>1. go to Administrative Tools> Component Services <BR>2. expand COM Services <BR>3. expand My Computer. <BR>4. expand COM+ Applications. <BR>5. Right click on your Application, select Properties <BR>6. Go to the Security tab<BR>7. In the Authorization frame, uncheck &#8220;Enforce access checks for this application&#8220;<BR></P>
<P>This isn't the best, since it grants every account on the machine access to create the objects in this application, but it's a quick/easy work around.</P>
