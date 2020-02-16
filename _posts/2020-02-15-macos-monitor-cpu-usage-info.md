---
layout: post
blogengineid: 00000000-0000-0000-0000-000000000000
title: "macOS: Monitor CPU Usage and Frequency Info"
date: 2020-02-15 18:00:00 -0500
comments: true
published: true
categories: ["macOS"]
tags: ["cpu", "intel", "core i9"]
---

I was recently looking for some tools to be able to view the Intel CPU utilization, frequency, and other information on macOS. In particular, my new Macbook Pro 16" is performing great with it's Intel Core i9 CPU with 8 cores (and 16 threads), but I'd like to see how well it's doing for myself. This article includes a listing and summary of the tools I found to do this with.

<a href="#activity">Activity Monitor</a> / <a href="maccpuid">Intel MacCPUID</a> / <a href="#power">Intel Power Gadget</a> / <a href="#cpusetter">CPU Setter</a> / <a href="#turbo">Turbo Boost Switcher</a>

<a id="activity"></a>
## macOS Activity Monitor

The **Activity Monitor** application is built into macOS, and it is pretty much equivalent to the _"Performance}"_ tab of the _"Task Manager"_ on Windows. In short it lets you see all the processes running on your machine, the CPU utilization, memory utilization, and a couple other things. With this app, there's nothing to install and is available on all macOS machines.

![macOS Activity Monitor screenshot](/images/posts/2020-02-15-macos-monitor-cpu-usage-info/macos-activity-monitor.jpg "macOS Activity Monitor screenshot")

You can also click on the **Window** menu and select options to view the CPU Usage, CPU History, and GPU History in separate windows. This will help give you insights into you current overall CPU utlization.

![macOS Activity Monitor CPU & GPU usage screenshot](/images/posts/2020-02-15-macos-monitor-cpu-usage-info/macos-activity-monitor-cpu-gpu-history.jpg "macOS Activity Monitor CPU & GPU usage screenshot")

_The above screenshot shows these 3 windows tiled. You can toggle their view individually and position them where you want._

<a id="maccpuid"></a>
## Intel MacCPUID

MacCPUID is a developer tool used for displaying information collected from the microprocessor via the CPUID instruction. The CPUID instruction returns information in the general purpose registers such as manufacturer identification, a processor's family, model, and stepping numbers, supported features (e.g. SSE, SSE2), cache information, and many others.

You can download it from here: <https://software.intel.com/en-us/download/download-maccpuid>

![](/images/posts/2020-02-15-macos-monitor-cpu-usage-info/intel-maccpuid-macos.jpg)

In the above screenshot, you can see the _CPU Model_ of my Macbook Pro 16" as a _Intel Core i9-9880H CPU @ 2.30Ghz_. It's also showing the _AMD Radeon Pro 5500M_ GPU. Something interesting, is that even though this is an Intel made utility, it can't determine the CPU Architecture for some reason. While not perfoect (I guess...) this utilizy does help show what CPU and GPU is currently in any macOS machine on the Intel hardware.

<a id="power"></a>
## Intel Power Gadget

Intel® Power Gadget is a software-based power usage monitoring tool enabled for Intel® Core™ processors (from 2nd Generation up to 10th Generation Intel® Core™ processors). Intel® Atom™ processors are not supported. It is supported on Windows* and macOS* and includes an application, driver, and libraries to monitor and estimate real-time processor package power information in watts using the energy counters in the processor. With this release, we are providing functionality to evaluate power information on various platforms including notebooks, desktops and servers. Windows 7* and 32-bit versions of the Intel® Power Gadget for Windows* has ceased development from 3.0.7. Starting with version 3.5 and going forward, only the 64-bit version and Windows 8* will be supported.

You can download it from here: <https://software.intel.com/en-us/articles/intel-power-gadget>

![](/images/posts/2020-02-15-macos-monitor-cpu-usage-info/intel-power-gadget-macos.jpg)

You can see this utility shows us the Power usage, Clock Frequency, Temperature, and Core Utilization information for the machine. You can also use the **Test** menu to run tests of hitting the CPU and/or GPU to 100% utilization which is pretty nice to have.

<a id="cpusetter"></a>
## CPU Setter

CPUSetter adjusts the number of active cores in your cpu(s). It can also enable/disable hyperthreading on supported cpus.

To do this requires administrator access to the machine and a small privileged helper program is installed when you first execute CPUSetter.
A convenient link to the system Activity Monitor is provided so you can observe the impact of changes.
Authentication with your administrator credentials is required to make changes to your system.

The Processes window allows you to change the priority (nice value) of your processes, and to also limit the maximum CPU usage of any of your processes. You cannot adjust processes that do not belong to you.

You can download CPU Setter here: <https://www.whatroute.net/cpusetter.html#download>

While the CPU Setter utility is meant to help you control the Intel Hyperthreading feature of the CPU, it also has a really great view of **System Stats**. This utility that let's you view additional information about the system that includes: Disk I/O, Wifi, Power usage, and more.

![](/images/posts/2020-02-15-macos-monitor-cpu-usage-info/cpu-setter.jpg)

<a id="turbo"></a>
## Turbo Boost Switcher

Turbo Boost Switcher is a utility that let's you see the CPU tempeture, utilization percentage, and fan speed of you macOS machine. It's main purpose is to let you disable the _Turbo Boost_ feature of the Intel CPU in the machine. Disabling this basically prevents the CPU from increasing the clock speed above it's base under high load, thus resulting in lower power usage and lower fan speed and noise. This can have an affect of increasing battery life with a little compromise in overall performance that is likely generally acceptable. It's a nice utility to know about.

You can download Turbo Boost Switcher here: <http://tbswitcher.rugarciap.com/>

![](/images/posts/2020-02-15-macos-monitor-cpu-usage-info/turbo-boost-switcher.jpg)

_P.S. At the time of writing this I couldn't get Turbo Boos Switcher to work on my machine... Dont' know if it's a compatibility issue with the app and the Macbook Pro 16" or something else. Could also be an app permissions issue. However, it's still a neat idea and a utility I recommend you check out._

## Wrap Up

To close things off, let's take a fun look at the Intel Core i9 CPU in this Apple Macbook Pro 16" maxed out to 100% CPU and 100% Integrated GPU. You can see all 16 thread are at 100% utilization, and the Intel Graphics 630 GPU is at 100% utilization as well.

![](/images/posts/2020-02-15-macos-monitor-cpu-usage-info/macbook-pro-16-2019-i9-max-load-cpu-gpu.jpg)

There are other reviews available online on the overall performance of the Macbook Pro 16". This wasn't the purpose of this article, so I'm not discussing the specs and data shown in the screenshots.

This article is short and to the point. I wanted to show what tools you can use, and a brief look at what they offer. Mostly this is a list for my own reference so I can refer back to it in a year when I forget what tools I used. You can benefit from this being posted here, so it's discoverable my anyone else, and hopefully somebody else finds this information useful too.

Thanks!