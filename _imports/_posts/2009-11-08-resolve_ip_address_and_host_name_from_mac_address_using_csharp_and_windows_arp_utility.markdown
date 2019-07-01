---
layout: post
blogengineid: 80df9f20-cb92-4257-8be0-da5678581715
title: "Resolve IP Address And Host Name From MAC Address using C# and Windows ARP Utility"
date: 2009-11-08 08:04:00 -0600
comments: true
published: true
categories: ["blog", "archives"]
tags: ["C#"]
redirect_from: 
  - /post/2009/11/08/Resolve_IP_Address_And_Host_Name_From_MAC_Address_using_CSharp_and_Windows_ARP_Utility
  - /post/2009/11/08/resolve_ip_address_and_host_name_from_mac_address_using_csharp_and_windows_arp_utility
  - /post.aspx?id=80df9f20-cb92-4257-8be0-da5678581715
---
<!-- more -->

While working on the <a href="http://virtualrouter.codeplex.com" target="_blank">Virtual Router project</a>, I&rsquo;ve come across a need to be able to retrieve the IP Address and Host Name of a given machine on the local network when only the machines MAC Address is known. This took a bit of research to figure out, and eventually I stumbled across the &ldquo;arp.exe&rdquo; utility within Windows.

&ldquo;arp.exe&rdquo; uses the <a href="http://en.wikipedia.org/wiki/Address_Resolution_Protocol" target="_blank">Address Resolution Protocol</a> to provide functionality to add, delete or display the IP address for MAC (Media Access Control) address translation.

To see the IP / MAC Address translations, just open up the Command Prompt in Windows, and type &ldquo;<em>arp &ndash;a</em>&rdquo; and press enter.

Now, you may be asking, how do we use this utility from within a .NET application? Well, it&rsquo;s rather simple. All you need to do is use the <a href="http://msdn.microsoft.com/en-us/library/system.diagnostics.process.aspx" target="_blank">System.Diagnostics.Process</a> class to execute the &ldquo;arp &ndash;a&rdquo; call and retrieve the results. Then just parse through the results and get out the IP Address for the desired MAC Address.

I&rsquo;m not going to give full detail on how to call &ldquo;arp&rdquo; from .NET. Below is an example on using the &ldquo;IPInfo&rdquo; class I created to perform the previously mentioned method of retrieving the IP Address for a specified MAC Address. I also added in the ability to get the machines Host Name using the the &ldquo;<a href="http://msdn.microsoft.com/en-us/library/ms143998.aspx" target="_blank">Dns.GetHostEntry</a>&rdquo; method.
<pre class="brush: c-sharp; first-line: 1; tab-size: 4; toolbar: false; ">var ipinfo = IPInfo.GetIPInfo(txtMAC.Text);

if (ipinfo == null)
{
    // Machine Not Found!
}
else
{
    var ip = ipinfo.IPAddress;
    var hostname = ipinfo.HostName;
}</pre>

<br />Below is the full code of my &ldquo;IPInfo&rdquo; class:
<pre class="brush: c-sharp; first-line: 1; tab-size: 4; toolbar: false; ">using System;
using System.Collections.Generic;
using System.Diagnostics;
using System.Linq;
using System.Net;

/// &lt;summary&gt;
/// This class allows you to retrieve the IP Address and Host Name for a specific machine on the local network when you only know it's MAC Address.
/// &lt;/summary&gt;
public class IPInfo
{
    public IPInfo(string macAddress, string ipAddress)
    {
        this.MacAddress = macAddress;
        this.IPAddress = ipAddress;
    }

    public string MacAddress { get; private set; }
    public string IPAddress { get; private set; }

    private string _HostName = string.Empty;
    public string HostName
    {
        get
        {
            if (string.IsNullOrEmpty(this._HostName))
            {
                try
                {
                    // Retrieve the "Host Name" for this IP Address. This is the "Name" of the machine.
                    this._HostName = Dns.GetHostEntry(this.IPAddress).HostName;
                }
                catch
                {
                    this._HostName = string.Empty;
                }
            }
            return this._HostName;
        }
    }


    #region "Static Methods"

    /// &lt;summary&gt;
    /// Retrieves the IPInfo for the machine on the local network with the specified MAC Address.
    /// &lt;/summary&gt;
    /// &lt;param name="macAddress"&gt;The MAC Address of the IPInfo to retrieve.&lt;/param&gt;
    /// &lt;returns&gt;&lt;/returns&gt;
    public static IPInfo GetIPInfo(string macAddress)
    {
        var ipinfo = (from ip in IPInfo.GetIPInfo()
                  where ip.MacAddress.ToLowerInvariant() == macAddress.ToLowerInvariant()
                  select ip).FirstOrDefault();

        return ipinfo;
    }

    /// &lt;summary&gt;
    /// Retrieves the IPInfo for All machines on the local network.
    /// &lt;/summary&gt;
    /// &lt;returns&gt;&lt;/returns&gt;
    public static List&lt;IPInfo&gt; GetIPInfo()
    {
        try
        {
            var list = new List&lt;IPInfo&gt;();

            foreach (var arp in GetARPResult().Split(new char[] { '\n', '\r' }))
            {
                // Parse out all the MAC / IP Address combinations
                if (!string.IsNullOrEmpty(arp))
                {
                    var pieces = (from piece in arp.Split(new char[] { ' ', '\t' })
                                  where !string.IsNullOrEmpty(piece)
                                  select piece).ToArray();
                    if (pieces.Length == 3)
                    {
                        list.Add(new IPInfo(pieces[1], pieces[0]));
                    }
                }
            }

            // Return list of IPInfo objects containing MAC / IP Address combinations
            return list;
        }
        catch(Exception ex)
        {
            throw new Exception("IPInfo: Error Parsing 'arp -a' results", ex);
        }
    }

    /// &lt;summary&gt;
    /// This runs the "arp" utility in Windows to retrieve all the MAC / IP Address entries.
    /// &lt;/summary&gt;
    /// &lt;returns&gt;&lt;/returns&gt;
    private static string GetARPResult()
    {
        Process p = null;
        string output = string.Empty;

        try
        {
            p = Process.Start(new ProcessStartInfo("arp", "-a")
            {
                CreateNoWindow = true,
                UseShellExecute = false,
                RedirectStandardOutput = true
            });

            output = p.StandardOutput.ReadToEnd();

            p.Close();
        }
        catch(Exception ex)
        {
            throw new Exception("IPInfo: Error Retrieving 'arp -a' Results", ex);
        }
        finally
        {
            if (p != null)
            {
                p.Close();
            }
        }
        
        return output;
    }

    #endregion
}</pre>
