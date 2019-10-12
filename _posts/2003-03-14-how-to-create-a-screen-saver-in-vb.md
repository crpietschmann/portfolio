---
layout: post
title: "How to Create a Screen Saver in Visual Basic 6"
date: 2003-03-14 19:54:00 -0500
comments: true
published: true
categories: ["blog", "archives"]
tags: ["General"]
redirect_from: 
  - /programming/Articles/How_To_Create_A_Screen_Saver_In_VM.htm
---

Yes, you can create a screen saver with Visual Basic.  And, this article will show you the rough guidelines you need to follow in order to do so.

To start add the following to your application: Two forms, and one module.  You will need one form to be the actual screen saver, and one form to be the configuration screen.  Last of all, you will need a module to put the Main sub in that will be set to start when the application starts.

Name the files as follows:

- `frmScreenSaver`
- `frmConfig`
- `modMain`

Set the properties of the frmScreenSaver as follows:
- `Caption                  = ""         (blank caption)`
- `ControlBox            = False`
- `MaxButton            = False`
- `MinButton            = False`
- `WindowState        = 2           (Maxmized)`

In the modMain create Sub Main() and set it as the Startup Object in the Project Properties dialog box.

Place code in the MouseMove, MouseDown, and KeyDown events of the frmScreenSaver to exit the application.

It is possible that Visual Basic may invoke the MouseMove event upon starting the screensaver. So, put the following code in the MouseMove event:

```vb
Static count As Integer
If count > 2 Then
    End
Else
    count = count + 1
End If
```

## Check For Previous Instances

In `Sub Main()` we first want to check and see if there is a previous instance of the screen saver running, and if there is then exit the application. So put in the following code:

```vb
If App.PrevInstance Then
    End
End If
```

## Check Command Line Options

When windows launches the screen saver it uses command line options to specify in which mode, it is launching the screen saver.

The command line option `/c` means that it is being launched in configuration mode.  So, with this command line option you would want to show the frmConfig, which is what you want to use to set any configuration options for the screen saver.

The command line option `/s` means that it is being launched in screen saver mode. So, with this command line option you would actually show the frmScreenSaver, which is the form that displays the actual screen saver.

To check which command line option was passed to the applications, just place the following code, after the code to check for previous instances, in to the Sub Main().

```vb
If InStr(Command, "s", vbTextCompare) <> 0 Then
                frmScreenSaver.Show
ElseIf InStr(1, Command, "c", vbTextCompare) <> 0 Then
                frmConfig.Show
End If
```

## Compiling Your Screen Saver

When compiling your screen saver you must specify the extension SCR instead of the traditional EXE for the application.  And in order for your screen saver to show up in the Screen Saver tab of the Display Properties dialog box, you must place you screen saver in the `/Windows/System` folder.  In Windows XP place the screen saver in the `/Windows/System32` folder.
