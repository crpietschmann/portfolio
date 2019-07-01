  ---
  layout: post
  title: "Building JavaScript / HTML based Applications using Adobe Air for FREE"
  date: 2009-06-10 20:44:00 -0500
  comments: true
  published: true
  categories: ["blog", "archives"]
  tags: ["JavaScript"]
  alias: ["/post/2009/06/10/Building-JavaScript-HTML-Applications-using-Adobe-AIR-for-FREE", "/post/2009/06/10/building-javascript-html-applications-using-adobe-air-for-free"]
  ---
<!-- more -->
{% include imported_disclaimer.html %}
<p>As a web developer I use JavaScript, HTML and CSS a lot. I do however build desktop applications too, but can&rsquo;t use those same tools/languages to build them. So, for quite some time now I&rsquo;ve wanted to be able to build Desktop Applications using the same JavaScript, HTML and CSS that I use to build Web Applications. Now with the help of Adobe AIR it can finally be done with ease, and even have multi-platform support.</p>
<p>In this post I&rsquo;m going to discuss the basics of creating a JavaScript/HTML based Desktop Application using Adobe AIR, and point you to some of the online resources that have helped me to get started.</p>
<p>Also, just in case you didn&rsquo;t know, you can create/build JavaScript / HTML based Adobe AIR applications for FREE. The runtime and sdk are both free.</p>
<h3>Getting Started with Adobe AIR</h3>
<p>First you&rsquo;ll need to get the following two things installed:</p>
<ul>
<li>Adobe AIR &ndash; <a href="http://get.adobe.com/air">http://get.adobe.com/air</a> </li>
<li>Adobe AIR SDK &ndash; <a title="http://www.adobe.com/products/air/tools/sdk/" href="http://www.adobe.com/products/air/tools/sdk/">http://www.adobe.com/products/air/tools/sdk/</a> </li>
</ul>
<p>Here&rsquo;s a couple excellent resources I found to getting started with Adobe AIR and JavaScript:</p>
<ul>
<li><a href="http://help.adobe.com/en_US/AIR/1.5/devappshtml/WS5b3ccc516d4fbf351e63e3d118666ade46-7ecc.html" target="_blank">Creating your first HTML-based AIR application with the AIR SDK</a> </li>
<li><a href="http://www.petefreitag.com/item/667.cfm" target="_blank">Adobe AIR Tutorial for HTML / JavaScript Developers</a> </li>
<li><a href="http://ajaxian.com/archives/adobe-air-for-javascript-developers-pocketguide" target="_blank">Adobe AIR for JavaScript Developers FREE Pocket Guide</a> &ndash; Direct <a href="http://onair.adobe.com/files/AIRforJSDevPocketGuide.pdf?sdid=CEYFA" target="_blank">Download of PDF</a> </li>
</ul>
<p>You can follow those two guides linked to above to get you started using Adobe AIR to build JavaScript / HTML based Desktop Applications.</p>
<h3>Setting Up the Adobe AIR SDK on Windows</h3>
<p>I had a couple small setup issues with getting the Adobe AIR SDK setup on my Windows development box.</p>
<p>The Adobe AIR SDK download is just a Zip Archive containing the files necessary for the SDK; it contains no setup EXE. To get it setup, you&rsquo;ll need to follow the below steps:</p>
<ul>
<li>Extract the SDK to some folder of your choosing. For Example: <em>C:\AdobeAIRSDK</em> </li>
<li>Add the <em>&ldquo;C:\AdobeAIRSDK\bin&rdquo; </em>folder to the System Path so you can execute it easily from within the Command Line. </li>
</ul>
<p>Also, to use the Adobe Developer Tool (adt) you&rsquo;ll need Java installed, and you&rsquo;ll need to make sure that the path to where Java is installed is also included within the System Path as described above.</p>
<p>To edit the &ldquo;System Path&rdquo; in Windows just follow these steps:</p>
<ul>
<li>Open the System Properties dialog box and click the Advanced tab. You can find this in the System settings within the Control Panel. </li>
<li>Click the Environment Variables button. </li>
<li>Select the PATH entry and then click the Edit button. Add the desired path to the end of the current variable value, separating it from previous values with a semicolon. For Example <em>&ldquo;;C:\AdobeAIRSDK\bin&rdquo;</em> </li>
<li>Click OK to Save. </li>
</ul>
<h3>Tips to Make Building and Testing Easier</h3>
<p>Here are some simple tips to make building and testing your applications easier.</p>
<h5>Create .BAT files to Build and Test</h5>
<p>One thing that you'&rsquo;ll want to do to make it a little easier to Build (using adt) and Test (using adl) your HTML-based Adobe AIR applications is create some simple &ldquo;build.bat&rdquo; and &ldquo;test.bat&rdquo; DOS Batch files so you don&rsquo;t have to type in the command-line parameters every time you want to build or test your application.</p>
<p>build.bat example:</p>
<p><em>adt &ndash;package &ndash;storetype pkcs12 &ndash;keystore certificate MyApp.air application.xml .</em></p>
<p>test.bat example:</p>
<p><em>adl application.xml</em></p>
<p>This way you can just simply double-click on the specific .BAT file within Windows Explorer to either Build or Test your application.</p>
<p>Also, in the above build.bat example, my Certificate file is simply named &ldquo;certificate&rdquo;, and it&rsquo;s a self-signed certificate.</p>
<h5>Place Application Files within a Sub-Folder</h5>
<p>If you rename your &ldquo;.air&rdquo; file that was built using the above mentioned .BAT file to be a &ldquo;.ZIP&rdquo; file and then open it, you&rsquo;ll notice that the .BAT files and your Certificate were included within the Build. This is because the above mentioned call to &ldquo;adt&rdquo; tells it to include all files and folders within the build. To prevent the .BAT files and Certificate from being included, you&rsquo;ll need to place them within a separate folder.</p>
<p>The easiest way to do this is to place all you Application files within a Sub-Folder within the main folder that your .BAT files and Certificate are located. For example you could name it &ldquo;App_Files&rdquo;. Then make the following changes to the .BAT files to point it to the new file/folder locations appropriately:</p>
<p>build.bat example:</p>
<p><em>cd App_Files <br />adt &ndash;package &ndash;storetype pkcs12 &ndash;keystore ../certificate ../MyApp.air application.xml .</em></p>
<p>test.bat example</p>
<p><em>cd App_Files <br />adl application.xml</em></p>
<p>Also, one thing to note about the above modified &ldquo;build.bat&rdquo; file is that it will place the Built &ldquo;.air&rdquo; file/application within the Main folder where the .BAT files and Certificate are located.</p>
<h3>Creating a Self-Signed Certificate</h3>
<p>One thing that you&rsquo;ll notice above is that I&rsquo;m using a Certificate file names &ldquo;<em>certificate</em>&rdquo;. This is a self-signed certificate that I generated using the &ldquo;adt&rdquo; tool. To generate a self-signed certificate, you can execute &ldquo;adt&rdquo; using the following command-line parameters:</p>
<p><em>adt &ndash;certificate &ndash;cn SelfSigned 1024-RSA certificate.pfx samplePassword</em></p>
<h3>Conclusion</h3>
<p>The above is pretty much the extent of my knowledge of building Adobe AIR applications using JavaScript / HTML at the time of this writing. I decided to take a few minutes to figure out the basics, so I thought I&rsquo;d share some of the tidbits I found out.</p>
<p>Since, I&rsquo;ve wanted to build desktop applications using JavaScript, HTML and CSS for some time now I find it relieving that it can be done with Adobe AIR and for Free.</p>
