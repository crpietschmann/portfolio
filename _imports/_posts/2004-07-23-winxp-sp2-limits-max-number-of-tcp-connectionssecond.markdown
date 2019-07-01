  ---
  layout: post
  title: "WinXP SP2 limits max. number of TCP connections/second"
  date: 2004-07-23 11:06:00 -0500
  comments: true
  published: true
  categories: ["blog", "archives"]
  tags: ["General"]
  alias: ["/post/2004/07/23/WinXP-SP2-limits-max-number-of-TCP-connectionssecond", "/post/2004/07/23/winxp-sp2-limits-max-number-of-tcp-connectionssecond"]
  ---
<!-- more -->
{% include imported_disclaimer.html %}
<P>Apparently, to reduce the spread of worms like Sasser, Windows XP Service Pack 2 will limit the maximum number of TCP connections your computer can have at one time. I can see what they are thinking, but I&nbsp;wont mind unless some of my applications (like my multi-threaded port scanner)&nbsp;wont work correctly with this new setting. I guess I'll hold off on increasing the max. untill an application&nbsp;generates an error&nbsp;because of it.</P>
<P>Here is a registry edit you can do to increase the max:</P>
<P><FONT face=Arial size=2>TcpNumConnections<BR>Key: Tcpip\Parameters<BR>Value Type: REG_DWORD - Number<BR>Valid Range: 0 - 0xfffffe<BR>Default: 0xfffffe<BR>Description: This parameter limits the maximum number of connections that TCP can have open at the same time.</FONT> </FONT></P>
<P class=indent>TCP/IP and NBT configuration parameters for Windows XP: <A href="http://support.microsoft.com/default.aspx?kbid=314053">http://support.microsoft.com/default.aspx?kbid=314053</A></P>
