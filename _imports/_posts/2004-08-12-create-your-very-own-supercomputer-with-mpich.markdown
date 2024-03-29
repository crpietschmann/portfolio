---
layout: post
blogengineid: dc6880a7-86a7-4fd5-9487-0c987b9a8d68
title: "Create your very own Supercomputer with MPICH"
date: 2004-08-12 18:14:00 -0500
comments: true
published: true
categories: ["blog", "archives"]
tags: ["General"]
redirect_from: 
  - /post/2004/08/12/Create-your-very-own-Supercomputer-with-MPICH
  - /post/2004/08/12/create-your-very-own-supercomputer-with-mpich
  - /post.aspx?id=dc6880a7-86a7-4fd5-9487-0c987b9a8d68
---
<!-- more -->
<P class=story1>Early supercomputers used parallel processing and distributed computing and to link processors together in a single machine. Using freely available tools, it is possible to do the same today using inexpensive PCs - a cluster. Glen Gardner liked the idea, so he built himself a massively parallel Mini-ITX cluster using 12 x 800Mhz nodes.
<P class=story1>The machine runs <A style="COLOR: #eeeeee" href="http://www.mini-itx.com/link.asp?site=www.freebsd.org" target=_blank><FONT color=#000000>FreeBSD</FONT></A> 4.8, and <A style="COLOR: #eeeeee" href="http://www.mini-itx.com/link.asp?site=www-unix.mcs.anl.gov/mpi" target=_blank><FONT color=#000000>MPICH</FONT></A> 1.2.5.2. After working with his machine and running some basic tests, Glen's cluster looks to be equivalent to at least 4 (maybe 6) 2.4Ghz Pentium IV boxes in parallel on a similar network - achieving a performance of around 3.6 GFLP. With the exception of the metalwork, power wiring, and power/reset switching, everything is off the shelf. Rather impressive we'd say - though he *is* root on a 1.1 TFLP 528 CPU monster, the<FONT color=#000000> </FONT><A style="COLOR: #eeeeee" href="http://www.mini-itx.com/link.asp?site=www.top500.org/list/2003/11/" target=_blank><FONT color=#000000>106th</FONT></A> fastest computer in the world... 

<A href="http://www.mini-itx.com/projects/cluster/">http://www.mini-itx.com/projects/cluster/</A>

MPICH Site: <A href="http://www-unix.mcs.anl.gov/mpi/">http://www-unix.mcs.anl.gov/mpi/</A>

You can even do this with Windows machines. If I had the resources and time, I would create my own supercomputer. You could build some cheap ($300) Athlon XP 2000+ computers. Five of them would cost around $1500, and it would be the equivelant to a 8-10 Ghz system. This would be pretty sweet. I think you might be able to get the best performance if you were to use a couple of Dual processor systems with Gigabit ethernet connecting them.
