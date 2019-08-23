---
layout: post
blogengineid: 6dcdf7a5-de21-4639-8002-8955ea7e7674
title: "PasswordTextBox for Silverlight 2 Beta 2"
date: 2008-03-14 20:25:00 -0500
comments: true
published: true
categories: ["blog", "archives"]
tags: ["Silverlight"]
redirect_from: 
  - /post/2008/03/14/PasswordTextBox-for-Silverlight-2-Beta-1.aspx
  - /post/2008/03/14/PasswordTextBox-for-Silverlight-2-Beta-1
  - /post/2008/03/14/passwordtextbox-for-silverlight-2-beta-1
  - /post.aspx?id=6dcdf7a5-de21-4639-8002-8955ea7e7674
---
<!-- more -->


The standard TextBox control that is built into Silverlight 2 Beta 2 is a bit lacking and is missing alot of features that we have become accustomed to in a TextBox. One of those features is being able to mask the characters being displayed when its used to accept passwords. Here&#39;s a small PasswordTextBox control I built that does just that; it masks the characters from being displayed so you can accept passwords like you&#39;re used to. 



**Update 6/7/2008** - I just tested this with Silverlight 2 Beta 2 and it works just the same as it does with Beta 1. 



**Updated 3/17/2008 - **I updated this code to support the Delete and Backspace keys, and to maintain caret/cursor position within the box. I also added the PasswordChar property that defines what the masking character is used to hide the password entered. 



```csharp 



/// Copyright 2008 Chris Pietschmann ()

/// This work is licensed under a Creative Commons Attribution 3.0 United States License

/// http://creativecommons.org/licenses/by/3.0/us/

///

/// This is a Password TextBox built for use with Silverlight 2 Beta 1

/// The reason this was built, is because the standard TextBox in

/// Silverlight 2 Beta 1 does not have Password support.

/// Original Link: /post/2008/03/PasswordTextBox-for-Silverlight-2-Beta-1.aspx

/// 



using System.Windows.Controls; 



namespace SilverlightPasswordTextBox

{

    public partial class PasswordTextBox : TextBox

    {

        public PasswordTextBox()

        {

            this.TextChanged += new TextChangedEventHandler(PasswordTextBox_TextChanged);

            this.KeyDown += new System.Windows.Input.KeyEventHandler(PasswordTextBox_KeyDown);

        } 



        #region Event Handlers 



        public void PasswordTextBox_TextChanged(object sender, TextChangedEventArgs e)

        {

            if (base.Text.Length >= _Text.Length)

                _Text += base.Text.Substring(_Text.Length);

            DisplayMaskedCharacters();

        } 



        public void PasswordTextBox_KeyDown(object sender, System.Windows.Input.KeyEventArgs e)

        {

            int cursorPosition = this.SelectionStart;

            int selectionLength = this.SelectionLength; 



            // Handle Delete and Backspace Keys Appropriately

            if (e.Key == System.Windows.Input.Key.Back

                || e.Key == System.Windows.Input.Key.Delete)

            {

                if (cursorPosition < _Text.Length)

                    _Text = _Text.Remove(cursorPosition, (selectionLength > 0 ? selectionLength : 1));

            }

            

            base.Text = _Text;

            this.Select((cursorPosition > _Text.Length ? _Text.Length : cursorPosition), 0);

            DisplayMaskedCharacters();

        } 



        #endregion 



        #region Private Methods 



        private void DisplayMaskedCharacters()

        {

            int cursorPosition = this.SelectionStart;

            

            // This changes the Text property of the base TextBox class to display all Asterisks in the control

            base.Text = new string(_PasswordChar, _Text.Length); 



            this.Select((cursorPosition > _Text.Length ? _Text.Length : cursorPosition), 0);

        } 



        #endregion 



        #region Properties 



        private string _Text = string.Empty;

        /// <summary>

        /// The text associated with the control.

        /// </summary>

        public new string Text

        {

            get { return _Text; }

            set

            {

                _Text = value;

                DisplayMaskedCharacters();

            }

        } 



        private char _PasswordChar = &#39;*&#39;;

        /// <summary>

        /// Indicates the character to display for password input.

        /// </summary>

        public char PasswordChar

        {

            get { return _PasswordChar; }

            set { _PasswordChar = value; }

        } 



        #endregion

    }

} 



``` 



**Update 4/2/2008: Here&#39;s the above code translated to VB.NET** 



&#39;&#39; Copyright 2008 Chris Pietschmann ()

&#39;&#39; This work is licensed under a Creative Commons Attribution 3.0 United States License

&#39;&#39; http://creativecommons.org/licenses/by/3.0/us/

&#39;&#39;

&#39;&#39; This is a Password TextBox built for use with Silverlight 2 Beta 1

&#39;&#39; The reason this was built, is because the standard TextBox in

&#39;&#39; Silverlight 2 Beta 1 does not have Password support.

&#39;&#39; Original Link: /post/2008/03/PasswordTextBox-for-Silverlight-2-Beta-1.aspx

Public Class PasswordTextBox

    Inherits TextBox 



    Public Sub PasswordTextBox_TextChanged(ByVal sender As Object, ByVal e As TextChangedEventArgs) Handles Me.TextChanged

        If MyBase.Text.Length >= _Text.Length Then

            _Text += MyBase.Text.Substring(_Text.Length)

        End If

        DisplayMaskedCharacters()

    End Sub 



    Public Sub PasswordTextBox_KeyDown(ByVal sender As Object, ByVal e As KeyEventArgs) Handles Me.KeyDown

        Dim cursorPosition As Integer = Me.SelectionStart

        Dim selectionLength As Integer = Me.SelectionLength 



        &#39;&#39; Handle Delete and Backspace Keys Appropriately

        If e.Key = Key.Back Or e.Key = Key.Delete Then

            If cursorPosition < _Text.Length Then

                Dim lengthToRemove As Integer = 1

                If selectionLength > 0 Then lengthToRemove = selectionLength

                _Text = _Text.Remove(cursorPosition, lengthToRemove)

            End If

        End If 



        MyBase.Text = _Text

        If cursorPosition > _Text.Length Then

            Me.Select(_Text.Length, 0)

        Else

            Me.Select(cursorPosition, 0)

        End If

        DisplayMaskedCharacters()

    End Sub 



    Private Sub DisplayMaskedCharacters()

        Dim cursorPosition As Integer = Me.SelectionStart 



        &#39;&#39; This changes the Text property of the base TextBox class to display all Asterisks in the control

        MyBase.Text = New String(_PasswordChar, _Text.Length) 



        If cursorPosition > _Text.Length Then

            Me.Select(_Text.Length, 0)

        Else

            Me.Select(cursorPosition, 0)

        End If

    End Sub 



    Private _Text As String = String.Empty

    Overloads Property Text() As String

        Get

            Return _Text

        End Get

        Set(ByVal value As String)

            _Text = value

            DisplayMaskedCharacters()

        End Set

    End Property 



    Private _PasswordChar As Char = &quot;*&quot;

    Public Property PasswordChar() As Char

        Get

            Return _PasswordChar

        End Get

        Set(ByVal value As Char)

            _PasswordChar = value

        End Set

    End Property 



End Class 



 

