---
layout: post
blogengineid: 31200e6d-4b61-48b8-a9cb-91e3dd8e97f3
title: ".NET Framework: Communicate through NAT Router via UPnP (Universal Plug and Play)"
date: 2009-02-05 19:27:00 -0600
comments: true
published: true
categories: ["blog", "archives"]
tags: ["Win32API"]
redirect_from: 
  - /post/2009/02/05/NET-Framework-Communicate-through-NAT-Router-via-UPnP
  - /post/2009/02/05/net-framework-communicate-through-nat-router-via-upnp
  - /post.aspx?id=31200e6d-4b61-48b8-a9cb-91e3dd8e97f3
---
<!-- more -->

I've been working on an application recently that needs to be able to communicate through a router/firewall using TCP. I've read/heard a bit of information about NAT Routers and UPnP; the technologies used in almost every router sold commercially. So, I knew that you could use the Universal Plug and Play (UPnP) features of the NAT Router to automatically open up the firewall via Port Forwarding to allow other computers on the Internet to connect directly to the one your application is running on. One thing I didn't know what that Windows (since Windows XP) has the NATUPnP 1.0 Type Library (NATUPNP.DLL) COM Component that you can utilize within your applications to do this for you.

I haven't found very many articles online (via Google search) on using the NATUPnP 1.0 Type Library; there's pretty much only small code snippets available. So, I've decided to explain a little further, in this article, the What and Why of communicating through a NAT Router utilizing UPnP.

## What is NAT (Network Address Translation)?

Network Address Translation is the method employed by a Network Router (and Wireless Routers) that allows you to have multiple computers connected to the internet using your home/work broadband internet connection. Your Router gets assigned an Internet IP Address by your Internet Service Provider, and then the Router assigns a Private IP Address to each computer on your network. The Router then "routes" Incoming and Outgoing network traffic from the Internet to the appropriate computer on your Private Network. This technique is also known as "IP masquerading", since it hides your entire Private Network from the Internet making it appear as if it were only a single computer connected to the Internet.

One of the biggest side effects of NAT is that it essentially turns your Router into a Firewall. This is because when any unsolicited incoming traffic gets sent you the Router, it has no idea which computer on the Private Network might be the intended recipient. So, consequentially, it just ignores or blocks the unsolicited incoming traffic. This is also the feature that allows you to safely enable File and Printer Sharing between the computers on the Private Network without the risk of any computer/server on the Internet being able to copy your files.

Also worth noting that NAT can be implemented by other devices than a Network Router, such as: a computer running Windows with Internet Connection Sharing and Windows Firewall, or a computer running software that provides NAT.

You can read more about NAT at the following links:

<a href="http://en.wikipedia.org/wiki/Network_address_translation">http://en.wikipedia.org/wiki/Network_address_translation</a>

<a href="http://en.wikipedia.org/wiki/NAT_traversal">http://en.wikipedia.org/wiki/NAT_traversal</a>

## What is Port Forwarding / Static NAT?

Port Forwarding, also called "Static NAT", allows computers on the Internet to connect directly to a specific computer on your Private Network. This works by configuring your NAT Router to forward any incoming traffic on a specific Port to a specific computer on your network. For example you can run a Web Server by setting the NAT Router to forward all incoming traffic on Port 80 to your Web Server on your Private Network.

You can read more about Port Forwarding at the following link:

<a href="http://en.wikipedia.org/wiki/Port_forwarding">http://en.wikipedia.org/wiki/Port_forwarding</a>

## What is Universal Plug and Play (UPnP)?

Universal Plug and Play (UPnP) is a simple communications mechanism that allows computers and network appliances to auto-configure Port Forwarding on a NAT Router. This greatly simplifies the setup of P2P networks such that the user doesn't need to configure the NAT Router, instead the computer can connect directly to the Router and setup the appropriate Port Forwarding to allow it to accept direct connections from external computers on the Internet.

This is essentially the technology that allows Peer-to-Peer Software (like Bit Torrent) to communicate through a NAT Router (Firewall) and connect directly to other computers across the Internet. There are also many devices and software that rely on this to function, such as Windows Live Messenger and XBox 360.

You can read more about UPnP at the following link:

<a href="http://en.wikipedia.org/wiki/Universal_Plug_and_Play">http://en.wikipedia.org/wiki/Universal_Plug_and_Play</a>

## Other Resources on Network Address Translation (NAT)

Including the above links there are many articles online that discuss in further detail what NAT and UPnP is. One resource that I really recommend is Episode #42 of the Security Now Podcast with Steve Gibson. If you prefer not to listen to the podcast, there is also a full transcript available for you to read. I really encourage you to read or listen to this.

<a href="http://www.grc.com/securitynow.htm#42">Security Now! #42 - NAT Traversal</a>

## Using the NATUPnP 1.0 Type Library to Setup Port Forwarding

The NATUPnP 1.0 Type Library (NATUPNP.DLL) COM Component, which is part of Windows (since Windows XP), makes it possible to easily manage Network Address Translation (NAT) through Universal Plug and Play (UPnP). This library provides the ability to configure port mappings on a remote Gateway Device (IGD) that uses NAT. It is worth mentioning that the remote Gateway Device could be another computer running Windows with Internet Connection Sharing and Windows Firewall, or a dedicated hardware device.

The API Reference for the NATUPnP 1.0 Type Library can be found here: <a href="http://msdn.microsoft.com/en-us/library/aa366276(VS.85).aspx">http://msdn.microsoft.com/en-us/library/aa366276(VS.85).aspx</a>

In order to use the NATUPnP Library you need to first add a reference to it to your project within Visual Studio. To do so open the Add Reference dialog, click the COM tab and select the "NATUPnP 1.0 Type Library". The resulting reference that's added will be named "NATUPNPLib" and will be the namespace that contains all the functionality contained within the library (all Interfaces and Classes).

<img src="/files/NATUPNPCOMLibrary_001.png" alt="" />

The NATUPnP 1.0 Type Library makes it so easy to setup Port Forwarding it literally only requires a couple lines of code.

## Get a listing of all existing Static Port Mappings

To get a list of all the Static Port Mappings that are already setup in your NAT enabled Internet Gateway Device (such as Router) you simply create an instance of the UPnPNATClass object and access its StaticPortMappingCollection property.

```csharp
NATUPNPLib.UPnPNATClass upnpnat = new NATUPNPLib.UPnPNATClass();
NATUPNPLib.IStaticPortMappingCollection mappings = upnpnat.StaticPortMappingCollection;
```

Once you get the collection of existing port mapping, you can iterate through them just as you would any normal Collection of objects:

```csharp
foreach(NATUPNPLib.IStaticPortMapping portMapping in mappings)
{
    // do something with the port mapping, such as displaying it in a listbox
}
```

## Add New Static Port Mapping

To add a new Static Port Mapping you simply call the Add method of the IStaticPortMappingCollection object that is returned by the UPnPNATClass.StaticPortMappingCollection property.

```csharp
// Here's an example of opening up TCP Port 80 to forward to a specific Computer on the Private Network
mappings.Add(80, "TCP", 80, "192.168.1.100", true, "Local Web Server");

// Here's an example of forwarding the UDP traffic of Internet Port 80 to Port 8080 on a Computer on the Private Network
mappings.Add(80, "UDP", 8080, "192.168.1.100", true, "Local Web Server");
```

## Remove Existing Static Port Mapping

To remove an existing Static Port Mapping you simply call the Remove method of the IStaticPortMappingCollection object that is returned by the UPnPNATClass.StaticPortMappingCollection property.

```csharp
// Remove TCP forwarding for Port 80
mappings.Remove(80, "TCP");

// Remove UDP forwarding for Port 8080
mappings.Remove(8080, "UDP");
```

## Example Port Forwarding Management Application

While working with the NATUPnP 1.0 Type Library I created a simple application that allows you to maintain the Static Port Mappings that are setup on your Private Networks NAT Router.

Download Sample: <a href="/files/NATUPnPPortForwardManager.zip" rel="enclosure">NATUPnPPortForwardManager.zip (20.68 kb)</a>

<img src="/files/NATUPNPCOMLibrary_002.png" alt="" />

## Conclusion

Setup up Port Forwarding on your local router via UPnP makes it extremely convenient for users of your networking application. Instead of requiring them to manually setup Port Forwarding, we can automatically set it up for them. Many popular P2P applications have utilized this functionality for years, and I'm positive you've used at least one of these applications already at some point.
