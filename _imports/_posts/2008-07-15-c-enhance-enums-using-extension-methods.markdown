  ---
  layout: post
  title: "C#: Enhance Enums using Extension Methods"
  date: 2008-07-15 16:38:00 -0500
  comments: true
  published: true
  categories: ["blog", "archives"]
  tags: ["C#"]
  alias: ["/post/2008/07/15/C-Enhance-Enums-using-Extension-Methods", "/post/2008/07/15/c-enhance-enums-using-extension-methods"]
  ---
<!-- more -->
{% include imported_disclaimer.html %}
<p>Extension Methods are one of the coolest features that have been added in .NET 3.5. I've heard arguments that there is no reason to use them, and the only reason Microsoft added them is to enable the ability to buid LINQ. Well, I do not entirely agree with that statement; in fact, I have found a cool way to use Extension Methods to enhance the System.Enum object since it cannot be inherited. Even though Enum can not be inherited, it can be extended using Extension Methods.</p>
<p>Here's some example code for a simple Enum that has a DescriptionAttribute applied to each of it's values:</p>
<pre class="brush: c-sharp; first-line: 1; tab-size: 4; toolbar: false; ">public enum LocalizationMarket
{
    [Description("en-US")]
    English = 1,
    [Description("en-ES")]
    Spanish = 2
}</pre>
<p>And here's the code to an Extension Method that extends the LocalizationMarket Enum with the ToDescriptionString() method that returns the DescriptionAttributes value:</p>
<pre class="brush: c-sharp; first-line: 1; tab-size: 4; toolbar: false; ">public static class LocalizationMarketExtensions
{
    public static string ToDescriptionString(this LocalizationMarket val)
    {
        DescriptionAttribute[] attributes = (DescriptionAttribute[])val.GetType().GetField(val.ToString()).GetCustomAttributes(typeof(DescriptionAttribute), false);
        return attributes.Length &gt; 0 ? attributes[0].Description : string.Empty;
    }
}</pre>
<p>The usage of this new method is really simple:</p>
<pre class="brush: c-sharp; first-line: 1; tab-size: 4; toolbar: false; ">LocalizationMarket myLocal = LocalizationMarket.English;
MessageBox.Show( myLocal.ToDescriptionString() ); // this will show "en-US" in the MessageBox that's shown</pre>
<p>Now one thing you must remember with using Extension Methods is you may not want to extend the System.Enum Type, but instead just extend the Enums you create only.</p>
