---
layout: post
blogengineid: 6271e9a0-4100-4919-af08-bd31ededb45b
title: "Virtual Earth: Dynamically Load InfoBox Using ASP.NET AJAX"
date: 2008-01-24 12:13:00 -0600
comments: true
published: true
categories: ["blog", "archives"]
tags: ["Bing Maps"]
redirect_from: 
  - /post/2008/01/24/Virtual-Earth-Dynamically-Load-InfoBox-Using-ASPNET-AJAX
  - /post/2008/01/24/virtual-earth-dynamically-load-infobox-using-aspnet-ajax
  - /post.aspx?id=6271e9a0-4100-4919-af08-bd31ededb45b
---
<!-- more -->

Loading alot of pushpins on the map can slow down your page in two ways: 1) Page load times can be slowed down, and 2) loading pushpins via ajax can be slow. To improve the performance (as in download and database query times) of loading pushpins on the map, you can load the Pushpin Shapes Title and Description on the fly. This allows you to only load the Pushpins Title and Description as it's needed, thus reducing the amount of data you need to send down to the client when initially loading your pushpins.
<h3>Dynamically Load InfoBox Title and Description using ASP.NET AJAX</h3>

**Step 1:** When adding Pushpins to the map, use the following format when setting thier Titles: "LOAD:{0}". Replace the "{0}" with a unique ID representing that Pushpin.

<span style="color: #0000ff; font-size: x-small;">

var<span style="font-size: x-small;"> s = </span><span style="color: #0000ff; font-size: x-small;">new</span><span style="font-size: x-small;"> VEShape(VEShapeType.Pushpin, map.GetCenter());
 s.Title = </span><span style="color: #a31515; font-size: x-small;">"LOAD:15"</span><span style="font-size: x-small;">;
 map.AddShape(s);</span>
</span>

**Step 2: **Create the GetInfoBoxData Page Method in the page that we'll call using Ajax. Also create a simple InfoBoxData class in the page; we'll use this class to more easily pass both the Title and Description down to the client.

<span style="font-size: x-small;">

[<span style="color: #2b91af; font-size: x-small;">WebMethod</span><span style="font-size: x-small;">]
 </span><span style="color: #0000ff; font-size: x-small;">public</span><span style="font-size: x-small;"> </span><span style="color: #0000ff; font-size: x-small;">static</span><span style="font-size: x-small;"> </span><span style="color: #2b91af; font-size: x-small;">InfoBoxData</span><span style="font-size: x-small;"> GetInfoBoxData(</span><span style="color: #0000ff; font-size: x-small;">int</span><span style="font-size: x-small;"> id)
 {
 </span><span style="color: #008000; font-size: x-small;"><span style="color: #0000ff;">    </span>// Pass back the InfoBoxData
 </span><span style="color: #2b91af; font-size: x-small;"><span style="color: #0000ff;">    </span>InfoBoxData</span><span style="font-size: x-small;"> data = </span><span style="color: #0000ff; font-size: x-small;">new</span><span style="font-size: x-small;"> </span><span style="color: #2b91af; font-size: x-small;">InfoBoxData</span><span style="font-size: x-small;">();
 <span style="color: #0000ff;">    </span>data.Title = </span><span style="color: #a31515; font-size: x-small;">"Item "</span><span style="font-size: x-small;"> + id.ToString();
 </span><span style="color: #008000; font-size: x-small;"><span style="color: #0000ff;">    </span>// Get the HTML to be displayed within the Description field
 </span><span style="font-size: x-small;"><span style="color: #0000ff;">    </span>data.Description = </span><span style="color: #2b91af; font-size: x-small;">ViewManager</span><span style="font-size: x-small;">.RenderView(</span><span style="color: #a31515; font-size: x-small;">"~/App_Views/InfoBoxDescription.ascx"</span><span style="font-size: x-small;">, id);
 </span><span style="color: #0000ff; font-size: x-small;">    return</span><span style="font-size: x-small;"> data;
 </span><span style="font-size: x-small;">}</span>
</span>

**Step 3: **Add the ViewManager class to the site's App_Code folder. This class will be used within the GetInfoBoxData Page Method to render the Description from a UserControl Template. This class was written by Scott Guthrie in his post titled "<a href="http://weblogs.asp.net/scottgu/archive/2006/10/22/Tip_2F00_Trick_3A00_-Cool-UI-Templating-Technique-to-use-with-ASP.NET-AJAX-for-non_2D00_UpdatePanel-scenarios.aspx">Tip/Trick: Cool UI Templating Technique to use with ASP.NET AJAX for non-UpdatePanel scenarios</a>", and it works perfect in this scenario.

<span style="color: #0000ff; font-size: x-small;">

public<span style="font-size: x-small;"> </span><span style="color: #0000ff; font-size: x-small;">class</span><span style="font-size: x-small;"> </span><span style="color: #2b91af; font-size: x-small;">ViewManager
 </span><span style="font-size: x-small;">{
 </span><span style="color: #0000ff; font-size: x-small;">    public</span><span style="font-size: x-small;"> </span><span style="color: #0000ff; font-size: x-small;">static</span><span style="font-size: x-small;"> </span><span style="color: #0000ff; font-size: x-small;">string</span><span style="font-size: x-small;"> RenderView(</span><span style="color: #0000ff; font-size: x-small;">string</span><span style="font-size: x-small;"> path)
 <span style="color: #0000ff;">    </span>{
 </span><span style="color: #0000ff; font-size: x-small;">        return</span><span style="font-size: x-small;"> RenderView(path, </span><span style="color: #0000ff; font-size: x-small;">null</span><span style="font-size: x-small;">);
 <span style="color: #0000ff;">    </span>}
 </span><span style="color: #0000ff; font-size: x-small;">    public</span><span style="font-size: x-small;"> </span><span style="color: #0000ff; font-size: x-small;">static</span><span style="font-size: x-small;"> </span><span style="color: #0000ff; font-size: x-small;">string</span><span style="font-size: x-small;"> RenderView(</span><span style="color: #0000ff; font-size: x-small;">string</span><span style="font-size: x-small;"> path, </span><span style="color: #0000ff; font-size: x-small;">object</span><span style="font-size: x-small;"> data)
 <span style="color: #0000ff;">    </span>{
 </span><span style="color: #2b91af; font-size: x-small;"><span style="color: #0000ff;">        </span>Page</span><span style="font-size: x-small;"> pageHolder = </span><span style="color: #0000ff; font-size: x-small;">new</span><span style="font-size: x-small;"> </span><span style="color: #2b91af; font-size: x-small;">Page</span><span style="font-size: x-small;">();
 </span><span style="color: #2b91af; font-size: x-small;"><span style="color: #0000ff;">        </span>UserControl</span><span style="font-size: x-small;"> viewControl = (</span><span style="color: #2b91af; font-size: x-small;">UserControl</span><span style="font-size: x-small;">)pageHolder.LoadControl(path);
 </span><span style="color: #0000ff; font-size: x-small;">        if</span><span style="font-size: x-small;"> (data != </span><span style="color: #0000ff; font-size: x-small;">null</span><span style="font-size: x-small;">)
 <span style="color: #0000ff;">        </span>{
 </span><span style="color: #2b91af; font-size: x-small;"><span style="color: #0000ff;">            </span>Type</span><span style="font-size: x-small;"> viewControlType = viewControl.GetType();
 </span><span style="color: #2b91af; font-size: x-small;"><span style="color: #0000ff;">            </span>FieldInfo</span><span style="font-size: x-small;"> field = viewControlType.GetField(</span><span style="color: #a31515; font-size: x-small;">"Data"</span><span style="font-size: x-small;">);
 </span><span style="color: #0000ff; font-size: x-small;">            if</span><span style="font-size: x-small;"> (field != </span><span style="color: #0000ff; font-size: x-small;">null</span><span style="font-size: x-small;">)
 <span style="color: #0000ff;">            </span>{
 <span style="color: #0000ff;">                </span>field.SetValue(viewControl, data);
 <span style="color: #0000ff;">            </span>}
 </span><span style="color: #0000ff; font-size: x-small;">            else
 </span><span style="font-size: x-small;"><span style="color: #0000ff;">            </span>{
 </span><span style="color: #0000ff; font-size: x-small;">                throw</span><span style="font-size: x-small;"> </span><span style="color: #0000ff; font-size: x-small;">new</span><span style="font-size: x-small;"> </span><span style="color: #2b91af; font-size: x-small;">Exception</span><span style="font-size: x-small;">(</span><span style="color: #a31515; font-size: x-small;">"View file: "</span><span style="font-size: x-small;"> + path + </span><span style="color: #a31515; font-size: x-small;">" does not have a public Data property"</span><span style="font-size: x-small;">);
 <span style="color: #0000ff;">            </span>}
 <span style="color: #0000ff;">        </span>}
 <span style="color: #0000ff;">        </span>pageHolder.Controls.Add(viewControl);
 </span><span style="color: #2b91af; font-size: x-small;"><span style="color: #0000ff;">        </span>StringWriter</span><span style="font-size: x-small;"> output = </span><span style="color: #0000ff; font-size: x-small;">new</span><span style="font-size: x-small;"> </span><span style="color: #2b91af; font-size: x-small;">StringWriter</span><span style="font-size: x-small;">();
 </span><span style="color: #2b91af; font-size: x-small;"><span style="color: #0000ff;">        </span>HttpContext</span><span style="font-size: x-small;">.Current.Server.Execute(pageHolder, output, </span><span style="color: #0000ff; font-size: x-small;">false</span><span style="font-size: x-small;">);
 </span><span style="color: #0000ff; font-size: x-small;">        return</span><span style="font-size: x-small;"> output.ToString();
 <span style="color: #0000ff;">    </span>}
 }</span>
</span>

**Step 4: **Create our InfoBoxDescription UserControl that the GetInfoBoxData Page Method will use as a template for rendering the Description.

<span style="font-size: x-small;">

<%<span style="color: #0000ff; font-size: x-small;">@</span><span style="font-size: x-small;"> </span><span style="color: #a31515; font-size: x-small;">Control</span><span style="font-size: x-small;"> </span><span style="color: #ff0000; font-size: x-small;">Language</span><span style="color: #0000ff; font-size: x-small;">="C#"</span><span style="font-size: x-small;"> </span><span style="color: #ff0000; font-size: x-small;">AutoEventWireup</span><span style="color: #0000ff; font-size: x-small;">="true"</span><span style="font-size: x-small;"> </span><span style="color: #ff0000; font-size: x-small;">CodeFile</span><span style="color: #0000ff; font-size: x-small;">="InfoBoxDescription.ascx.cs"</span><span style="font-size: x-small;"> </span><span style="color: #ff0000; font-size: x-small;">Inherits</span><span style="color: #0000ff; font-size: x-small;">="App_Views_InfoBoxDescription"</span><span style="font-size: x-small;"> %>
 This is the description for </span><span style="color: #0000ff; font-size: x-small;"><</span><span style="color: #a31515; font-size: x-small;">strong</span><span style="color: #0000ff; font-size: x-small;">></span><span style="font-size: x-small;">Item <%</span><span style="color: #0000ff; font-size: x-small;">=this</span><span style="font-size: x-small;">.Data.ToString()%></span><span style="color: #0000ff; font-size: x-small;"></</span><span style="color: #a31515; font-size: x-small;">strong</span><span style="color: #0000ff; font-size: x-small;">></span><span style="font-size: x-small;">.</span><span style="color: #0000ff; font-size: x-small;"><</span><span style="color: #a31515; font-size: x-small;">br</span><span style="font-size: x-small;"> </span><span style="color: #0000ff; font-size: x-small;">/>
 </span><span style="font-size: x-small;">This description was generated dynamically using a UserControl.</span>
</span><span style="color: #0000ff; font-size: x-small;">

public<span style="font-size: x-small;"> </span><span style="color: #0000ff; font-size: x-small;">partial</span><span style="font-size: x-small;"> </span><span style="color: #0000ff; font-size: x-small;">class</span><span style="font-size: x-small;"> </span><span style="color: #2b91af; font-size: x-small;">App_Views_InfoBoxDescription</span><span style="font-size: x-small;"> : System.Web.UI.</span><span style="color: #2b91af; font-size: x-small;">UserControl
 </span><span style="font-size: x-small;">{
 </span><span style="color: #0000ff; font-size: x-small;">    public</span><span style="font-size: x-small;"> </span><span style="color: #0000ff; font-size: x-small;">int</span><span style="font-size: x-small;"> Data;
 </span><span style="color: #0000ff; font-size: x-small;">    protected</span><span style="font-size: x-small;"> </span><span style="color: #0000ff; font-size: x-small;">void</span><span style="font-size: x-small;"> Page_Load(</span><span style="color: #0000ff; font-size: x-small;">object</span><span style="font-size: x-small;"> sender, </span><span style="color: #2b91af; font-size: x-small;">EventArgs</span><span style="font-size: x-small;"> e)
 <span style="color: #0000ff;">    </span>{
 <span style="color: #0000ff;">    </span>}
 }</span>
</span>

**Step 5:**  Attach a JavaScript method to the VE Maps OnMouseMove event, just after the code that instantiates the map.

<span style="font-size: x-small;">

map.AttachEvent(<span style="color: #a31515; font-size: x-small;">"onmousemove"</span><span style="font-size: x-small;">, MapMouseMove);</span>
</span>

**Step 6: **Write code in the OnMouseMove event handler to fire off the GetInfoBoxData Page Method to load the Shapes Title and Description.

<span style="color: #0000ff; font-size: x-small;">

function<span style="font-size: x-small;"> MapMouseMove(e)
 {
 </span><span style="color: #0000ff; font-size: x-small;">    if</span><span style="font-size: x-small;"> (e.elementID != </span><span style="color: #0000ff; font-size: x-small;">null</span><span style="font-size: x-small;">)
 <span style="color: #0000ff;">    </span>{
 </span><span style="color: #0000ff; font-size: x-small;">        var</span><span style="font-size: x-small;"> shape = map.GetShapeByID(e.elementID);
 
 </span><span style="color: #008000; font-size: x-small;"><span style="color: #0000ff;">        </span>// Check if the Shapes been loaded already
 </span><span style="color: #0000ff; font-size: x-small;">        if</span><span style="font-size: x-small;"> (shape.GetTitle().indexOf(</span><span style="color: #a31515; font-size: x-small;">"LOAD:"</span><span style="font-size: x-small;">) != -1)
 <span style="color: #0000ff;">        </span>{
 </span><span style="color: #008000; font-size: x-small;"><span style="color: #0000ff;">            </span>// Get our ID for the Shape from within the Shapes Title
 </span><span style="color: #0000ff; font-size: x-small;">            var</span><span style="font-size: x-small;"> id = parseInt(shape.GetTitle().substring(5));
 
 </span><span style="color: #008000; font-size: x-small;"><span style="color: #0000ff;">            </span>// Set the Shape to display a loading message
 </span><span style="font-size: x-small;"><span style="color: #0000ff;">            </span>shape.SetTitle(</span><span style="color: #a31515; font-size: x-small;">"Loading..."</span><span style="font-size: x-small;">);
 </span><span style="color: #008000; font-size: x-small;">
 <span style="color: #0000ff;">            </span>// Fire off the loading of the InfoBox Data
 </span><span style="font-size: x-small;"><span style="color: #0000ff;">            </span>PageMethods.GetInfoBoxData(id, </span><span style="color: #008000; font-size: x-small;">/* <-- Pass the WebMethod its parameters */
 </span><span style="font-size: x-small;"><span style="color: #0000ff;">                </span>InfoBoxDataLoaded, </span><span style="color: #008000; font-size: x-small;">/* <-- The callback method that gets called when the Page Method call Succeeds */
 </span><span style="font-size: x-small;"><span style="color: #0000ff;">                </span>InfoBoxDataLoadError, </span><span style="color: #008000; font-size: x-small;">/* <-- The callback method that gets called if the Page Method Fails */
 </span><span style="font-size: x-small;"><span style="color: #0000ff;">                </span>shape </span><span style="color: #008000; font-size: x-small;">/* <-- Pass the Shape as our Context value to the callback method */
 </span><span style="font-size: x-small;"><span style="color: #0000ff;">            </span>);
 <span style="color: #0000ff;">        </span>}
     }
 }</span>
</span>

**Step 7: **Add our success callback method, that the call to GetInfoBoxData will call once the data has been recieved in the client.

<span style="color: #0000ff; font-size: x-small;">

function<span style="font-size: x-small;"> InfoBoxDataLoaded(result, context, methodName)
 {
 </span><span style="color: #0000ff; font-size: x-small;">    var</span><span style="font-size: x-small;"> shape = context;
 </span><span style="color: #008000; font-size: x-small;">    // Set the Shapes new Title and Description
 </span><span style="font-size: x-small;"><span style="color: #008000;">    </span>shape.SetTitle(result.Title);
 <span style="color: #008000;">    </span>shape.SetDescription(result.Description);
 </span><span style="color: #008000; font-size: x-small;">    // Re-Show the InfoBox so the new Title and Description are automatically displayed
 </span><span style="font-size: x-small;"><span style="color: #008000;">    </span>map.ShowInfoBox(shape);
 }</span>
</span>

**Step 8: **Add our failure callback method, that the call to GetInfoBoxData will call if it fails.

<span style="color: #0000ff; font-size: x-small;">

function<span style="font-size: x-small;"> InfoBoxDataLoadError(error)
 </span><span style="font-size: x-small;">{
     alert(</span><span style="color: #a31515; font-size: x-small;">"Error Occurred Loading InfoBox Data\n"</span><span style="font-size: x-small;"> + error.get_message());
 }</span>
</span>
<h3>Conclusion</h3>

You'll no longer need to pass the full Title and Description for every Pushpin Shape you plot using this technique. You also be able to save bandwidth, and improve load times in your Virtual Earth implementations.

<a href="/Download/Blog/1448/AjaxDynamicInfoBox.zip">Download Full Code For This Article Here</a>
