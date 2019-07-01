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
  - /post/2008/03/14/PasswordTextBox-for-Silverlight-2-Beta-1
  - /post/2008/03/14/passwordtextbox-for-silverlight-2-beta-1
  - /post.aspx?id=6dcdf7a5-de21-4639-8002-8955ea7e7674
---
<!-- more -->


The standard TextBox control that is built into Silverlight 2 Beta 2 is a bit lacking and is missing alot of features that we have become accustomed to in a TextBox. One of those features is being able to mask the characters being displayed when its used to accept passwords. Here&#39;s a small PasswordTextBox control I built that does just that; it masks the characters from being displayed so you can accept passwords like you&#39;re used to. 



**Update 6/7/2008** - I just tested this with Silverlight 2 Beta 2 and it works just the same as it does with Beta 1. 



**Updated 3/17/2008 - **I updated this code to support the Delete and Backspace keys, and to maintain caret/cursor position within the box. I also added the PasswordChar property that defines what the masking character is used to hide the password entered. 



[code:c#] 



/// Copyright 2008 Chris Pietschmann ()<br />
/// This work is licensed under a Creative Commons Attribution 3.0 United States License<br />
/// http://creativecommons.org/licenses/by/3.0/us/<br />
///<br />
/// This is a Password TextBox built for use with Silverlight 2 Beta 1<br />
/// The reason this was built, is because the standard TextBox in<br />
/// Silverlight 2 Beta 1 does not have Password support.<br />
/// Original Link: /post/2008/03/PasswordTextBox-for-Silverlight-2-Beta-1.aspx<br />
/// 



using System.Windows.Controls; 



namespace SilverlightPasswordTextBox<br />
{<br />
    public partial class PasswordTextBox : TextBox<br />
    {<br />
        public PasswordTextBox()<br />
        {<br />
            this.TextChanged += new TextChangedEventHandler(PasswordTextBox_TextChanged);<br />
            this.KeyDown += new System.Windows.Input.KeyEventHandler(PasswordTextBox_KeyDown);<br />
        } 



        #region Event Handlers 



        public void PasswordTextBox_TextChanged(object sender, TextChangedEventArgs e)<br />
        {<br />
            if (base.Text.Length &gt;= _Text.Length)<br />
                _Text += base.Text.Substring(_Text.Length);<br />
            DisplayMaskedCharacters();<br />
        } 



        public void PasswordTextBox_KeyDown(object sender, System.Windows.Input.KeyEventArgs e)<br />
        {<br />
            int cursorPosition = this.SelectionStart;<br />
            int selectionLength = this.SelectionLength; 



            // Handle Delete and Backspace Keys Appropriately<br />
            if (e.Key == System.Windows.Input.Key.Back<br />
                || e.Key == System.Windows.Input.Key.Delete)<br />
            {<br />
                if (cursorPosition &lt; _Text.Length)<br />
                    _Text = _Text.Remove(cursorPosition, (selectionLength &gt; 0 ? selectionLength : 1));<br />
            }<br />
            <br />
            base.Text = _Text;<br />
            this.Select((cursorPosition &gt; _Text.Length ? _Text.Length : cursorPosition), 0);<br />
            DisplayMaskedCharacters();<br />
        } 



        #endregion 



        #region Private Methods 



        private void DisplayMaskedCharacters()<br />
        {<br />
            int cursorPosition = this.SelectionStart;<br />
            <br />
            // This changes the Text property of the base TextBox class to display all Asterisks in the control<br />
            base.Text = new string(_PasswordChar, _Text.Length); 



            this.Select((cursorPosition &gt; _Text.Length ? _Text.Length : cursorPosition), 0);<br />
        } 



        #endregion 



        #region Properties 



        private string _Text = string.Empty;<br />
        /// &lt;summary&gt;<br />
        /// The text associated with the control.<br />
        /// &lt;/summary&gt;<br />
        public new string Text<br />
        {<br />
            get { return _Text; }<br />
            set<br />
            {<br />
                _Text = value;<br />
                DisplayMaskedCharacters();<br />
            }<br />
        } 



        private char _PasswordChar = &#39;*&#39;;<br />
        /// &lt;summary&gt;<br />
        /// Indicates the character to display for password input.<br />
        /// &lt;/summary&gt;<br />
        public char PasswordChar<br />
        {<br />
            get { return _PasswordChar; }<br />
            set { _PasswordChar = value; }<br />
        } 



        #endregion<br />
    }<br />
} 



``` 



**Update 4/2/2008: Here&#39;s the above code translated to VB.NET** 



&#39;&#39; Copyright 2008 Chris Pietschmann ()<br />
&#39;&#39; This work is licensed under a Creative Commons Attribution 3.0 United States License<br />
&#39;&#39; http://creativecommons.org/licenses/by/3.0/us/<br />
&#39;&#39;<br />
&#39;&#39; This is a Password TextBox built for use with Silverlight 2 Beta 1<br />
&#39;&#39; The reason this was built, is because the standard TextBox in<br />
&#39;&#39; Silverlight 2 Beta 1 does not have Password support.<br />
&#39;&#39; Original Link: /post/2008/03/PasswordTextBox-for-Silverlight-2-Beta-1.aspx<br />
Public Class PasswordTextBox<br />
    Inherits TextBox 



    Public Sub PasswordTextBox_TextChanged(ByVal sender As Object, ByVal e As TextChangedEventArgs) Handles Me.TextChanged<br />
        If MyBase.Text.Length &gt;= _Text.Length Then<br />
            _Text += MyBase.Text.Substring(_Text.Length)<br />
        End If<br />
        DisplayMaskedCharacters()<br />
    End Sub 



    Public Sub PasswordTextBox_KeyDown(ByVal sender As Object, ByVal e As KeyEventArgs) Handles Me.KeyDown<br />
        Dim cursorPosition As Integer = Me.SelectionStart<br />
        Dim selectionLength As Integer = Me.SelectionLength 



        &#39;&#39; Handle Delete and Backspace Keys Appropriately<br />
        If e.Key = Key.Back Or e.Key = Key.Delete Then<br />
            If cursorPosition &lt; _Text.Length Then<br />
                Dim lengthToRemove As Integer = 1<br />
                If selectionLength &gt; 0 Then lengthToRemove = selectionLength<br />
                _Text = _Text.Remove(cursorPosition, lengthToRemove)<br />
            End If<br />
        End If 



        MyBase.Text = _Text<br />
        If cursorPosition &gt; _Text.Length Then<br />
            Me.Select(_Text.Length, 0)<br />
        Else<br />
            Me.Select(cursorPosition, 0)<br />
        End If<br />
        DisplayMaskedCharacters()<br />
    End Sub 



    Private Sub DisplayMaskedCharacters()<br />
        Dim cursorPosition As Integer = Me.SelectionStart 



        &#39;&#39; This changes the Text property of the base TextBox class to display all Asterisks in the control<br />
        MyBase.Text = New String(_PasswordChar, _Text.Length) 



        If cursorPosition &gt; _Text.Length Then<br />
            Me.Select(_Text.Length, 0)<br />
        Else<br />
            Me.Select(cursorPosition, 0)<br />
        End If<br />
    End Sub 



    Private _Text As String = String.Empty<br />
    Overloads Property Text() As String<br />
        Get<br />
            Return _Text<br />
        End Get<br />
        Set(ByVal value As String)<br />
            _Text = value<br />
            DisplayMaskedCharacters()<br />
        End Set<br />
    End Property 



    Private _PasswordChar As Char = &quot;*&quot;<br />
    Public Property PasswordChar() As Char<br />
        Get<br />
            Return _PasswordChar<br />
        End Get<br />
        Set(ByVal value As Char)<br />
            _PasswordChar = value<br />
        End Set<br />
    End Property 



End Class 



 

