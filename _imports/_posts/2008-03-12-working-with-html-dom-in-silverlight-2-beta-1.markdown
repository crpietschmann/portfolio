---
layout: post
blogengineid: 013ba8c3-01e0-4690-bba0-13fcc61cf030
title: "Working with HTML DOM in Silverlight 2 Beta 1 using the Bridge Pattern"
date: 2008-03-12 00:00:00 -0500
comments: true
published: true
categories: ["blog", "archives"]
tags: ["Silverlight"]
redirect_from: 
  - /post/2008/03/12/Working-with-HTML-DOM-in-Silverlight-2-Beta-1
  - /post/2008/03/12/working-with-html-dom-in-silverlight-2-beta-1
  - /post.aspx?id=013ba8c3-01e0-4690-bba0-13fcc61cf030
---
<!-- more -->


Working with the HTML DOM in Silverlight 2 Beta 1 is rather simple and easy to do. However, to my surprise it&#39;s a similar experience to working the the HTML DOM from within JavaScript; you have to know the name of the properties to get/set and you don&#39;t have the luxury of compile time checking or intellisense. 



Here an example of creating a new DIV element and setting some of it&#39;s properties: 



[code:c#] 



HtmlElement myDiv = HtmlPage.Document.CreateElement(&quot;div&quot;);<br />
<br />
// Set the innerHTML property<br />
myDiv.SetProperty(&quot;innerHTML&quot;, &quot;&lt;strong&gt;Some HTML Content&lt;/strong&gt;&quot;);<br />
<br />
// Set some style properties<br />
myDiv.SetStyleAttribute(&quot;border&quot;, &quot;solid 1px black&quot;);<br />
myDiv.SetStyleAttribute(&quot;position&quot;, &quot;absolute&quot;);<br />
myDiv.SetStyleAttribute(&quot;top&quot;, &quot;10px&quot;);<br />
myDiv.SetStyleAttribute(&quot;left&quot;, &quot;10px&quot;);<br />
<br />
// Add the myDiv element to the page<br />
HtmlPage.Document.Body.AppendChild(myDiv);<br />
<br />
// Get the innerHTML property<br />
string html = myDiv.GetProperty(&quot;innerHTML&quot;);<br />
<br />
// Get the Position Style attribute<br />
string pos = myDiv.GetStyleAttribute(&quot;position&quot;); 



``` 



As you can see from the above example, the HtmlElement object doesn&#39;t have any real properties or style attributes, you must work with the helper methods to get/set them. I was a little surprised to see this at first, and I don&#39;t know if they plan on adding any properties to the object in the final release or if they are doing this to just make the Silverlight download smaller. 



**Can We Extend the HtmlElement to Add Property Accessors?** 



Yes, but not through inheritence. For some reason they decided to make the System.Windows.Browser.HtmlElement class Sealed! So, instead we&#39;ll have to use the Bridge Pattern to create a wrapper object that will have all the desired property accessors. 



Here&#39;s an example of using a class that implements the Bridge Pattern to do the exact same as above: 



[code:c#] 



HtmlElementHelper myDiv = new HtmlElementHelper(HtmlPage.Document.CreateElement(&quot;div&quot;));<br />
myDiv.innerHTML = &quot;&lt;strong&gt;Some HTML Content&lt;/strong&gt;&quot;;<br />
myDiv.Style.Position = &quot;absolute&quot;;<br />
myDiv.Style.Border = &quot;solid 1px black&quot;;<br />
myDiv.Style.Top = &quot;10px&quot;;<br />
myDiv.Style.Left = &quot;10px&quot;;<br />
HtmlPage.Document.Body.AppendChild(myDiv.Element); 



``` 



Not only is the code using the Bridge Pattern easier to read, but now we have the benefit of compile time checking of our DIV elements properties. No need to worry if you misspelled any of the property names anymore. 



**Full Source Code for the HtmlElementHelper Bridge class:** 



[code:c#] 



 public class HtmlElementHelper<br />
    {<br />
        private HtmlElement _elem = null;<br />
        private HtmlElementStyleHelper _styleHelper = null;<br />
        <br />
        public HtmlElementHelper(HtmlElement elem)<br />
        {<br />
            this._elem = elem;<br />
        } 



        public HtmlElement Element<br />
        {<br />
            get { return _elem; }<br />
        } 



        public object GetProperty(string propertyName)<br />
        {<br />
            return _elem.GetProperty(propertyName);<br />
        } 



        public void SetProperty(string propertyName, object value)<br />
        {<br />
            _elem.SetProperty(propertyName, value);<br />
        }<br />
        <br />
        public HtmlElementStyleHelper Style<br />
        {<br />
            get<br />
            {<br />
                if (_styleHelper == null)<br />
                {<br />
                    _styleHelper = new HtmlElementStyleHelper(this._elem);<br />
                }<br />
                return _styleHelper;<br />
            }<br />
        } 



        public string innerHTML<br />
        {<br />
            get { return GetProperty(&quot;innerHTML&quot;) as string; }<br />
            set { this.SetProperty(&quot;innerHTML&quot;, value); }<br />
        } 



        public string innerText<br />
        {<br />
            get { return GetProperty(&quot;innerText&quot;) as string; }<br />
            set { this.SetProperty(&quot;innerText&quot;, value); }<br />
        } 



        public string className<br />
        {<br />
            get { return GetProperty(&quot;className&quot;) as string; }<br />
            set { SetProperty(&quot;className&quot;, value); }<br />
        } 



        public string Id<br />
        {<br />
            get { return _elem.Id; }<br />
            set { _elem.Id = value; }<br />
        }<br />
    } 



    public class HtmlElementStyleHelper<br />
    {<br />
        private HtmlElement _elem = null; 



        public HtmlElementStyleHelper(HtmlElement elem)<br />
        {<br />
            this._elem = elem;<br />
        } 



        public string GetAttribute(string name)<br />
        {<br />
            return _elem.GetStyleAttribute(name);<br />
        } 



        public void SetAttribute(string name, string value)<br />
        {<br />
            _elem.SetStyleAttribute(name, value);<br />
        } 



        public string Position<br />
        {<br />
            get { return GetAttribute(&quot;position&quot;); }<br />
            set { SetAttribute(&quot;position&quot;, value); }<br />
        } 



        public string Border<br />
        {<br />
            get { return GetAttribute(&quot;border&quot;); }<br />
            set { SetAttribute(&quot;border&quot;, value); }<br />
        } 



        public string Top<br />
        {<br />
            get { return GetAttribute(&quot;top&quot;); }<br />
            set { SetAttribute(&quot;top&quot;, value); }<br />
        } 



        public string Left<br />
        {<br />
            get { return GetAttribute(&quot;left&quot;); }<br />
            set { SetAttribute(&quot;left&quot;, value); }<br />
        } 



        public string Width<br />
        {<br />
            get { return GetAttribute(&quot;width&quot;); }<br />
            set { SetAttribute(&quot;width&quot;, value); }<br />
        } 



        public string Height<br />
        {<br />
            get { return GetAttribute(&quot;height&quot;); }<br />
            set { SetAttribute(&quot;height&quot;, value); }<br />
        }<br />
    } 



``` 



**Conclusion** 



I have actually never had such a usefull need to use the Bridge Pattern before, and this time it really saves the day. I hope Microsoft adds better support for the different HTML DOM Elements properties and style properties to the Silverlight 2 final release, or at least open up the HtmlElement object for inheritence. If neither, at least we can use the Bridge Pattern to fullfill our needs. 

