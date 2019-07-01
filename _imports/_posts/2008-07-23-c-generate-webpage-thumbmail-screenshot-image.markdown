  ---
  layout: post
  title: "C#: Generate WebPage Thumbmail Screenshot Image"
  date: 2008-07-23 21:43:00 -0500
  comments: true
  published: true
  categories: ["blog", "archives"]
  tags: ["asp.net", "C#"]
  alias: ["/post/2008/07/23/C-Generate-WebPage-Thumbmail-Screenshot-Image", "/post/2008/07/23/c-generate-webpage-thumbmail-screenshot-image"]
  ---
<!-- more -->
<p>There are a few services out there that serve up screenshots of any webpage for you to display on your website. One popular one is <a href="http://kwiboo.com/">Kwiboo</a>; this is the one that <a href="http://dotnetkicks.com">DotNetKicks </a>uses. For some time now I've wondered what the easiest way to do this in .NET was, and today I stumbled upon the undocumented WebBrowser.DrawToBitmap method that makes this extremely easy to do.</p>
<p>By the way, I stumbled upon the WebBrowser.DrawToBitmap while taking a look at the source code for the <a href="http://smallsharptools.com/Projects/WebPreview/">WebPreview tool over at SmallSharpTools.com</a>.</p>
<p>Here's a sample method that returns a Bitmap representation of a webpage:</p>
<pre class="brush: c-sharp; first-line: 1; tab-size: 4; toolbar: false; ">public Bitmap GenerateScreenshot(string url)
{
    // This method gets a screenshot of the webpage
    // rendered at its full size (height and width)
    return GenerateScreenshot(url, -1, -1);
}

public Bitmap GenerateScreenshot(string url, int width, int height)
{
    // Load the webpage into a WebBrowser control
    WebBrowser wb = new WebBrowser();
    wb.ScrollBarsEnabled = false;
    wb.ScriptErrorsSuppressed = true;
    wb.Navigate(url);
    while (wb.ReadyState != WebBrowserReadyState.Complete) { Application.DoEvents(); }


    // Set the size of the WebBrowser control
    wb.Width = width;
    wb.Height = height;

    if (width == -1)
    {
        // Take Screenshot of the web pages full width
        wb.Width = wb.Document.Body.ScrollRectangle.Width;
    }

    if (height == -1)
    {
        // Take Screenshot of the web pages full height
        wb.Height = wb.Document.Body.ScrollRectangle.Height;
    }

    // Get a Bitmap representation of the webpage as it's rendered in the WebBrowser control
    Bitmap bitmap = new Bitmap(wb.Width, wb.Height);
    wb.DrawToBitmap(bitmap, new Rectangle(0, 0, wb.Width, wb.Height));
    wb.Dispose();

    return bitmap;
}</pre>
<p>Here are some example usages of the above method:</p>
<pre class="brush: c-sharp; first-line: 1; tab-size: 4; toolbar: false; ">// Generate thumbnail of a webpage at 1024x768 resolution
Bitmap thumbnail = GenerateScreenshot("http://pietschsoft.com", 1024, 768);

// Generate thumbnail of a webpage at the webpage's full size (height and width)
thumbnail = GenerateScreenshot("http://pietschsoft.com");

// Display Thumbnail in PictureBox control
pictureBox1.Image = thumbnail;

/*
// Save Thumbnail to a File
thumbnail.Save("thumbnail.png", System.Drawing.Imaging.ImageFormat.Png);
*/</pre>
