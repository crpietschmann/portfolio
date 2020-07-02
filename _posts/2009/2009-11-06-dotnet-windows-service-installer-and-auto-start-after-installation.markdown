---
layout: post
blogengineid: c86d128f-970b-4b3a-bfeb-4d51ab34f051
title: ".NET Windows Service Installer and Auto Start After Installation"
date: 2009-11-06 10:10:00 -0600
comments: true
published: true
categories: [".NET", "Windows Service"]
tags: ["C#"]
redirect_from: 
  - /post/2009/11/06/dotNet-Windows-Service-Installer-And-Auto-Start-After-Installation.aspx
  - /post/2009/11/06/dotNet-Windows-Service-Installer-And-Auto-Start-After-Installation
  - /post/2009/11/06/dotnet-windows-service-installer-and-auto-start-after-installation
  - /post.aspx?id=c86d128f-970b-4b3a-bfeb-4d51ab34f051
---
<!-- more -->

It&rsquo;s not very often that I need to build a Windows Service for a specific task, and it&rsquo;s even more rare that I need to create an Installer (.msi) to install/uninstall the service. Well, the project I&rsquo;m currently working on (<a href="http://virtualrouter.codeplex.com">http://virtualrouter.codeplex.com</a>) requires me to 1) Install a Windows Service using a Setup Project, and 2) Start the Windows Service immediately after installation.
<h3>Create Setup Project for Windows Service</h3>

Just create a Setup Project within your Solution in Visual Studio, then follow the below steps:

1. Right-Click the Setup Project you just created 
2. Click &ldquo;Add&rdquo;, then &ldquo;Project Output&hellip;&rdquo; 
3. In the dialog that appears select your Windows Service Project as Primary Output, then click OK.

That&rsquo;s really all that&rsquo;s required. When the resulting Installer is executed it will Install / Uninstall the Windows Service.

You can find a longer description of how to do this here:

<a title="http://support.microsoft.com/kb/317421" href="http://support.microsoft.com/kb/317421">http://support.microsoft.com/kb/317421</a>
<h3>Auto Start Windows Service After Installation</h3>

Whether you use a Setup Project of the &ldquo;installutil&rdquo; tool to install your Windows Service, it can be very convenient if the service were to automatically start once installed. To do this all it takes is adding a couple lines of code to the ServiceInstaller that you have defined within your Windows Service Project to handle the &ldquo;Committed&rdquo; event, then use the ServiceController class to Start the service.

Here&rsquo;s an example ServiceInstaller with the &ldquo;Auto Start&rdquo; code in place:

```csharp
[RunInstaller(true)]
public class ServiceInstaller : Installer
{
    string strServiceName = "MyServiceName";

    public ServiceInstaller()
    {
        var processInstaller = new ServiceProcessInstaller();
        var serviceInstaller = new ServiceInstaller();

        processInstaller.Account = ServiceAccount.LocalSystem;
        processInstaller.Username = null;
        processInstaller.Password = null;

        serviceInstaller.DisplayName = strServiceName;
        serviceInstaller.StartType = ServiceStartMode.Automatic;

        serviceInstaller.ServiceName = strServiceName;

        this.Installers.Add(processInstaller);
        this.Installers.Add(serviceInstaller);

        this.Committed += new InstallEventHandler(ServiceInstaller_Committed);
    }

    void ServiceInstaller_Committed(object sender, InstallEventArgs e)
    {
        // Auto Start the Service Once Installation is Finished.
        var controller = new ServiceController(strServiceName);
        controller.Start();
    }
}
```

## Conclusion

These are two tips that for some reason had eluded me for a long time. Usually I just created a .bat file to call &ldquo;installutil&rdquo; and &ldquo;net start&rdquo; to install and start my services manually. In most cases that worked perfect since it was very rare that the service was installed on a new computer or updated to a newer version. However, while building an &ldquo;End User Friendly&rdquo; Installer that anyone can run, you need to automate the installation and start up of the Windows Service.

This is just the thing that I&rsquo;m running into with the new <a href="http://virtualrouter.codeplex.com">http://virtualrouter.codeplex.com</a> project that I&rsquo;m working on. The &ldquo;Virtual Router&rdquo; project utilizes Windows 7&rsquo;s Virtual Wifi and Wireless Hosted Network API&rsquo;s to turn any computer into a Wireless Access Point / Router. Look for the first release of this project soon!
