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



HtmlElement myDiv = HtmlPage.Document.CreateElement(&quot;div&quot;);



// Set the innerHTML property

myDiv.SetProperty(&quot;innerHTML&quot;, &quot;**Some HTML Content**&quot;);



// Set some style properties

myDiv.SetStyleAttribute(&quot;border&quot;, &quot;solid 1px black&quot;);

myDiv.SetStyleAttribute(&quot;position&quot;, &quot;absolute&quot;);

myDiv.SetStyleAttribute(&quot;top&quot;, &quot;10px&quot;);

myDiv.SetStyleAttribute(&quot;left&quot;, &quot;10px&quot;);



// Add the myDiv element to the page

HtmlPage.Document.Body.AppendChild(myDiv);



// Get the innerHTML property

string html = myDiv.GetProperty(&quot;innerHTML&quot;);



// Get the Position Style attribute

string pos = myDiv.GetStyleAttribute(&quot;position&quot;); 



``` 



As you can see from the above example, the HtmlElement object doesn&#39;t have any real properties or style attributes, you must work with the helper methods to get/set them. I was a little surprised to see this at first, and I don&#39;t know if they plan on adding any properties to the object in the final release or if they are doing this to just make the Silverlight download smaller. 



**Can We Extend the HtmlElement to Add Property Accessors?** 



Yes, but not through inheritence. For some reason they decided to make the System.Windows.Browser.HtmlElement class Sealed! So, instead we&#39;ll have to use the Bridge Pattern to create a wrapper object that will have all the desired property accessors. 



Here&#39;s an example of using a class that implements the Bridge Pattern to do the exact same as above: 



[code:c#] 



HtmlElementHelper myDiv = new HtmlElementHelper(HtmlPage.Document.CreateElement(&quot;div&quot;));

myDiv.innerHTML = &quot;**Some HTML Content**&quot;;

myDiv.Style.Position = &quot;absolute&quot;;

myDiv.Style.Border = &quot;solid 1px black&quot;;

myDiv.Style.Top = &quot;10px&quot;;

myDiv.Style.Left = &quot;10px&quot;;

HtmlPage.Document.Body.AppendChild(myDiv.Element); 



``` 



Not only is the code using the Bridge Pattern easier to read, but now we have the benefit of compile time checking of our DIV elements properties. No need to worry if you misspelled any of the property names anymore. 



**Full Source Code for the HtmlElementHelper Bridge class:** 



[code:c#] 



 public class HtmlElementHelper

    {

        private HtmlElement _elem = null;

        private HtmlElementStyleHelper _styleHelper = null;

        

        public HtmlElementHelper(HtmlElement elem)

        {

            this._elem = elem;

        } 



        public HtmlElement Element

        {

            get { return _elem; }

        } 



        public object GetProperty(string propertyName)

        {

            return _elem.GetProperty(propertyName);

        } 



        public void SetProperty(string propertyName, object value)

        {

            _elem.SetProperty(propertyName, value);

        }

        

        public HtmlElementStyleHelper Style

        {

            get

            {

                if (_styleHelper == null)

                {

                    _styleHelper = new HtmlElementStyleHelper(this._elem);

                }

                return _styleHelper;

            }

        } 



        public string innerHTML

        {

            get { return GetProperty(&quot;innerHTML&quot;) as string; }

            set { this.SetProperty(&quot;innerHTML&quot;, value); }

        } 



        public string innerText

        {

            get { return GetProperty(&quot;innerText&quot;) as string; }

            set { this.SetProperty(&quot;innerText&quot;, value); }

        } 



        public string className

        {

            get { return GetProperty(&quot;className&quot;) as string; }

            set { SetProperty(&quot;className&quot;, value); }

        } 



        public string Id

        {

            get { return _elem.Id; }

            set { _elem.Id = value; }

        }

    } 



    public class HtmlElementStyleHelper

    {

        private HtmlElement _elem = null; 



        public HtmlElementStyleHelper(HtmlElement elem)

        {

            this._elem = elem;

        } 



        public string GetAttribute(string name)

        {

            return _elem.GetStyleAttribute(name);

        } 



        public void SetAttribute(string name, string value)

        {

            _elem.SetStyleAttribute(name, value);

        } 



        public string Position

        {

            get { return GetAttribute(&quot;position&quot;); }

            set { SetAttribute(&quot;position&quot;, value); }

        } 



        public string Border

        {

            get { return GetAttribute(&quot;border&quot;); }

            set { SetAttribute(&quot;border&quot;, value); }

        } 



        public string Top

        {

            get { return GetAttribute(&quot;top&quot;); }

            set { SetAttribute(&quot;top&quot;, value); }

        } 



        public string Left

        {

            get { return GetAttribute(&quot;left&quot;); }

            set { SetAttribute(&quot;left&quot;, value); }

        } 



        public string Width

        {

            get { return GetAttribute(&quot;width&quot;); }

            set { SetAttribute(&quot;width&quot;, value); }

        } 



        public string Height

        {

            get { return GetAttribute(&quot;height&quot;); }

            set { SetAttribute(&quot;height&quot;, value); }

        }

    } 



``` 



**Conclusion** 



I have actually never had such a usefull need to use the Bridge Pattern before, and this time it really saves the day. I hope Microsoft adds better support for the different HTML DOM Elements properties and style properties to the Silverlight 2 final release, or at least open up the HtmlElement object for inheritence. If neither, at least we can use the Bridge Pattern to fullfill our needs. 

