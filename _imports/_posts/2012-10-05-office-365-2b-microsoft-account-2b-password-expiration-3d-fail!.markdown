---
layout: post
title: "Office 365 + Microsoft Account + Password Expiration = FAIL!"
date: 2012-10-05 06:05:00 -0500
comments: true
published: true
categories: ["blog", "archives"]
tags: ["General"]
redirect_from: 
  - /post/2012/10/05/Office-365-2b-Microsoft-Account-2b-Password-Expiration-3d-FAIL!
 -  /post/2012/10/05/office-365-2b-microsoft-account-2b-password-expiration-3d-fail!
---
<!-- more -->
<p>One of my business email accounts is hosted in Exchange Server via Microsoft Online Services. Earlier this year they upgraded us to the new Office 365. Everything went well for a few months after the upgrade, until my password happened to expire on my earlier this week. Below is a solution I was able to figure out to regain access to my account (without calling Microsoft for support/help.)</p>
<h3>Background</h3>
<p>This specific email address is also a Microsoft Account (aka Windows Live ID) and has been ever since I created it a few years ago.</p>
<p>When you login to Office 365 it only asks you for your Microsoft Account to login. My Office 365 Account, although it is exactly the same as my Microsoft Account, is not a Microsoft Account. The root issue I was able to conjure up was that even though the logins were identical, the passwords were different on the two account (Microsoft Account and Office 365 Account.) So, after having someone else with admin rights in our Office 365 account reset my password a couple times trying to get this working, I decided to change my Microsoft Account password to match the newly reset Office 365 Account password. Then I was "magically" able to login again; after which I changed both passwords to something else, but made sure they both match so I can still login afterwords.</p>
<h3>This may sound a little confusing, so here's an example:</h3>
<p>I have a Microsoft Account of <a href="mailto:JohnSmith@Domain.com">JohnSmith@Domain.com</a> with a password of "Pizza1!" and I have a Office 365 Account of <a href="mailto:JohnSmith@Domain.com">JohnSmith@Domain.com</a> with a password of "Pizza1!". Everything works find because the passwords are identical. Now, all of a sudden, one day the Office 365 Account password expires, and needs to be reset. (afterall they don't send you an email notifying you that your password is about to expire) Now the account is esssentially locked out. So you have an admin reset the Office 365 Account password to "Taco1!". The account is still locked out, since the passwords for both accounts do not match. If you change your Microsoft Account password to match the newly reset Office 365 Account password, then you will be able to login and change the password to something else. However, make sure you change your Microsoft Account password to match so you don't instantly get locked out again.</p>
<h3>Office 365 + Microsoft Account + Password Expiration = FAIL!</h3>
<p>In my opinion this is a MAJOR bug in the password and authentication system of Office 365, when the email address in question is also a Microsoft Account. I don't know if it's related to the fact that my email address was already a Microsoft Account before if became an Office 365 Account, but either way this should have never happened.</p>
<p>The only conclusion I can come to is that once you login with your Microsoft Account, it sends the hashed password to Office 365 which checks if it matches the password hash there. If they don't both match then you get locked out with a message that is very obscure telling you that you either can't use Office 365 or the site is down. This doesn't seem to be very secure since both passwords must match. Also, I don't know why in the case of Office 365 it doesn't just set things up so the Microsoft Account completely overrides the Office 365 Account so you only have a single login in the authentication process.</p>
<p>No matter what, this is a huge failure on Microsoft Office 365, and I thought I'd share my experiences just in case someone else finds themselves in the same situation.</p>
<p>&nbsp;</p>
