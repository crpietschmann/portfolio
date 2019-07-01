  ---
  layout: post
  title: "ASP.NET MVC: Implement Theme Folders using a Custom ViewEngine"
  date: 2009-03-26 18:09:00 -0500
  comments: true
  published: true
  categories: ["blog", "archives"]
  tags: ["ASP.NET MVC"]
  alias: ["/post/2009/03/26/ASPNET-MVC-Implement-Theme-Folders-using-a-Custom-ViewEngine", "/post/2009/03/26/aspnet-mvc-implement-theme-folders-using-a-custom-viewengine"]
  ---
<!-- more -->
{% include imported_disclaimer.html %}
<p>One of the things that ASP.NET MVC 1.0 is missing is the ability to easily implement Themes. The older, more mature standard ASP.NET framework includes theme support via the App_Themes folder; however limited it can be, it&rsquo;s still more than ASP.NET MVC currently has. Well, at least until I wrote this little custom ViewEngine and ControllerBase class to help out and allow us to very easily implement Themes within our ASP.NET MVC applications.</p>
<p>A little history: A few months back I wrote up a post on &ldquo;<a href="/post.aspx?id=ee0e253d-c746-4099-9795-81aaf14ad608">How To Setup Custom Theme Support In ASP.NET MVC Preview 4 using a Custom ViewEngine</a>&rdquo;, then a couple weeks later I posted an updated version that added <a href="/post.aspx?id=5a6945d0-933a-4971-aac1-13dcd73711d9">Custom Themes to ASP.NET MVC Preview 5</a>. So I&rsquo;ve decided to update the code from Preview 5 and make it all work with ASP.NET MVC v1.0 Final Release.</p>
<p>Also, I took a tip from <a href="http://frugalcoder.us/">Michael Ryan</a> and modified my previous theme implementation from Preview 5 to include both Views and Content folders within the Theme folder.</p>
<h3>Download the Code</h3>
<p>I know some of you may want to download the code and look at it before reading on, so here's the download link:</p>
<p>Source Code: <a href="/file.axd?file=AspNetMvc1CustomThemeImplementation.zip" rel="enclosure">AspNetMvc1CustomThemeImplementation.zip (262.99 kb)</a></p>
<h3>Create &ldquo;~/Themes&rdquo; Folder and a &ldquo;Default&rdquo; View Theme</h3>
<p><a href="/image.axd?picture=ASPNETMVC_1_CustomThemeFolderLayout.png"><img style="display: inline; border-width: 0px;" title="ASPNETMVC_1_CustomThemeFolderLayout" src="/image.axd?picture=ASPNETMVC_1_CustomThemeFolderLayout_thumb.png" alt="ASPNETMVC_1_CustomThemeFolderLayout" width="275" height="508" align="right" border="0" /></a>First, we&rsquo;ll make some changes to the Views contained within the default ASP.NET MVC Template.</p>
<p>Here&rsquo;s a brief summary of what changes are needed:</p>
<ol>
<li>Create a sub-folder named &ldquo;Themes&rdquo; within the website root folder</li>
<li>Create a sub-folder names &ldquo;Default&rdquo; within the &ldquo;Themes&rdquo; folder</li>
<li>Cut and Paste the &ldquo;Views&rdquo; folder into the new &ldquo;~/Themes/Default&rdquo; folder</li>
<li>Cut and Past the &ldquo;Content&rdquo; folder into the new &ldquo;~/Themes/Default&rdquo; folder</li>
<li>Modify the Pages (.aspx) to point correctly to the Master Page (.master) for the Theme their in, now that we moved the files.</li>
<li>Modify the Master Pages (.master) to point to the CSS file within the &ldquo;Content&rdquo; folder correctly, now that we moved the files.</li>
<li>To create additional Themes, just copy the &ldquo;Default&rdquo; folder and name it what you want for the desired Theme, and repeat Steps 5 and 6 above.</li>
</ol>
<p>To the right is a screenshot displaying the layout of the Themes folder as described above.</p>
<h3>Apply the Custom ViewEngine</h3>
<p>Now that we have our Themes folder created, we can go ahead and implement our Custom ViewEngine. The Custom ViewEngine in this example was created by inheriting the WebFormViewEngine and just overriding/changing the necessary functionality.</p>
<p>First we need to tell our application to use the new &ldquo;WebFormThemeViewEngine&rdquo; ViewEngine class. To do this we&rsquo;ll need to clear any existing ViewEngines and add a new instance of the &lsquo;WebFormThemeViewEngine&rdquo;. This needs to be done within the Application_Start method in the Global.asax. Below is what the Application_Start method will look like after we make the necessary changes:</p>
<pre class="brush: c-sharp; first-line: 1; tab-size: 4; toolbar: false; ">protected void Application_Start()
{
    RegisterRoutes(RouteTable.Routes);

    // Replace the Default WebFormViewEngine with our custom WebFormThemeViewEngine
    System.Web.Mvc.ViewEngines.Engines.Clear();
    System.Web.Mvc.ViewEngines.Engines.Add(new WebFormThemeViewEngine());
}</pre>
<p>Also, for reference here&rsquo;s the complete code for the &ldquo;WebFormThemeViewEngine&rdquo; class that&rsquo;s used in this example. I wont be discussing the steps necessary when creating your own custom ViewEngines; that would be a little more involved than I would like to get within the scope of this article. A link to download the entire code for the project I created when writing this article is located at the top of the article</p>
<pre class="brush: c-sharp; first-line: 1; tab-size: 4; toolbar: false; ">public class WebFormThemeViewEngine : WebFormViewEngine
{
    public WebFormThemeViewEngine()
    {
        base.MasterLocationFormats = new string[] {
            "~/Themes/{2}/Views/{1}/{0}.master", 
            "~/Themes/{2}/Views/Shared/{0}.master"
        };
        base.ViewLocationFormats = new string[] { 
            "~/Themes/{2}/Views/{1}/{0}.aspx", 
            "~/Themes/{2}/Views/{1}/{0}.ascx", 
            "~/Themes/{2}/Views/Shared/{0}.aspx", 
            "~/Themes/{2}/Views/Shared/{0}.ascx" 
        };
        base.PartialViewLocationFormats = new string[] {
            "~/Themes/{2}/Views/{1}/{0}.aspx",
            "~/Themes/{2}/Views/{1}/{0}.ascx",
            "~/Themes/{2}/Views/Shared/{0}.aspx",
            "~/Themes/{2}/Views/Shared/{0}.ascx"
        };
    }

    protected override bool FileExists(ControllerContext controllerContext, string virtualPath)
    {
        try
        {
            return System.IO.File.Exists(controllerContext.HttpContext.Server.MapPath(virtualPath));
        }
        catch (HttpException exception)
        {
            if (exception.GetHttpCode() != 0x194)
            {
                throw;
            }
            return false;
        }
        catch
        {
            return false;
        }
    }

    public override ViewEngineResult FindView(ControllerContext controllerContext, string viewName, string masterName, bool useCache)
    {
        string[] strArray;
        string[] strArray2;

        if (controllerContext == null)
        {
            throw new ArgumentNullException("controllerContext");
        }
        if (string.IsNullOrEmpty(viewName))
        {
            throw new ArgumentException("viewName must be specified.", "viewName");
        }

        string themeName = this.GetThemeToUse(controllerContext);

        string requiredString = controllerContext.RouteData.GetRequiredString("controller");

        string viewPath = this.GetPath(controllerContext, this.ViewLocationFormats, "ViewLocationFormats",
                viewName, themeName, requiredString, "View", useCache, out strArray);

        string masterPath = this.GetPath(controllerContext, this.MasterLocationFormats, "MasterLocationFormats",
                masterName, themeName, requiredString, "Master", useCache, out strArray2);

        if (!string.IsNullOrEmpty(viewPath) &amp;&amp; (!string.IsNullOrEmpty(masterPath) || string.IsNullOrEmpty(masterName)))
        {
            return new ViewEngineResult(this.CreateView(controllerContext, viewPath, masterPath), this);
        }
        return new ViewEngineResult(strArray.Union&lt;string&gt;(strArray2));
    }

    public override ViewEngineResult FindPartialView(ControllerContext controllerContext, string partialViewName, bool useCache)
    {
        string[] strArray;
        if (controllerContext == null)
        {
            throw new ArgumentNullException("controllerContext");
        }
        if (string.IsNullOrEmpty(partialViewName))
        {
            throw new ArgumentException("partialViewName must be specified.", "partialViewName");
        }

        string themeName = this.GetThemeToUse(controllerContext);

        string requiredString = controllerContext.RouteData.GetRequiredString("controller");
        string partialViewPath = this.GetPath(controllerContext, this.PartialViewLocationFormats,
                "PartialViewLocationFormats", partialViewName, themeName, requiredString, "Partial", useCache, out strArray);
        if (string.IsNullOrEmpty(partialViewPath))
        {
            return new ViewEngineResult(strArray);
        }
        return new ViewEngineResult(this.CreatePartialView(controllerContext, partialViewPath), this);

    }

    private string GetThemeToUse(ControllerContext controllerContext)
    {
        string themeName = controllerContext.HttpContext.Items["themeName"] as string;
        if (themeName == null) themeName = "Default";
        return themeName;
    }

    private static readonly string[] _emptyLocations;

    private string GetPath(ControllerContext controllerContext, string[] locations, string locationsPropertyName,
        string name, string themeName, string controllerName, string cacheKeyPrefix, bool useCache, out string[] searchedLocations)
    {
        searchedLocations = _emptyLocations;
        if (string.IsNullOrEmpty(name))
        {
            return string.Empty;
        }
        if ((locations == null) || (locations.Length == 0))
        {
            throw new InvalidOperationException("locations must not be null or emtpy.");
        }

        bool flag = IsSpecificPath(name);
        string key = this.CreateCacheKey(cacheKeyPrefix, name, flag ? string.Empty : controllerName, themeName);
        if (useCache)
        {
            string viewLocation = this.ViewLocationCache.GetViewLocation(controllerContext.HttpContext, key);
            if (viewLocation != null)
            {
                return viewLocation;
            }
        }
        if (!flag)
        {
            return this.GetPathFromGeneralName(controllerContext, locations, name, controllerName, themeName, key, ref searchedLocations);
        }
        return this.GetPathFromSpecificName(controllerContext, name, key, ref searchedLocations);
    }

    private static bool IsSpecificPath(string name)
    {
        char ch = name[0];
        if (ch != '~')
        {
            return (ch == '/');
        }
        return true;
    }

    private string CreateCacheKey(string prefix, string name, string controllerName, string themeName)
    {
        return string.Format(CultureInfo.InvariantCulture,
            ":ViewCacheEntry:{0}:{1}:{2}:{3}:{4}",
            new object[] { base.GetType().AssemblyQualifiedName, prefix, name, controllerName, themeName });
    }

    private string GetPathFromGeneralName(ControllerContext controllerContext, string[] locations, string name,
        string controllerName, string themeName, string cacheKey, ref string[] searchedLocations)
    {
        string virtualPath = string.Empty;
        searchedLocations = new string[locations.Length];
        for (int i = 0; i &lt; locations.Length; i++)
        {
            string str2 = string.Format(CultureInfo.InvariantCulture, locations[i], new object[] { name, controllerName, themeName });

            if (this.FileExists(controllerContext, str2))
            {
                searchedLocations = _emptyLocations;
                virtualPath = str2;
                this.ViewLocationCache.InsertViewLocation(controllerContext.HttpContext, cacheKey, virtualPath);
                return virtualPath;
            }
            searchedLocations[i] = str2;
        }
        return virtualPath;
    }

    private string GetPathFromSpecificName(ControllerContext controllerContext, string name, string cacheKey, ref string[] searchedLocations)
    {
        string virtualPath = name;
        if (!this.FileExists(controllerContext, name))
        {
            virtualPath = string.Empty;
            searchedLocations = new string[] { name };
        }
        this.ViewLocationCache.InsertViewLocation(controllerContext.HttpContext, cacheKey, virtualPath);
        return virtualPath;
    }
}</pre>
<p>&nbsp;</p>
<h3>Create a ThemeControllerBase Class to Initially Set the Theme to Use</h3>
<p>One additional step that&rsquo;s necessary when using the above WebFormThemeViewEngine is to create a custom Controller Base Class, and inherit from it with all your Controllers. This ThemeControllerBase class needs to set the Theme to use within the &ldquo;HttpContext.Items[&ldquo;themeName&rdquo;]&rdquo;. If you miss or skip this step you will get an exception and will not be able to run the website.</p>
<p>The ThemeControllerBase class used in this example includes code that allows you to specify the Theme to use by passing it in using the QueryString like this: <em>&ldquo;http://localhost/Default.aspx?theme=Red&rdquo;</em></p>
<p>Here&rsquo;s the code for the ThemeControllerBase class:</p>
<pre class="brush: c-sharp; first-line: 1; tab-size: 4; toolbar: false; ">public abstract class ThemeControllerBase : Controller
{
    protected override void Execute(System.Web.Routing.RequestContext requestContext)
    {
        // Add code here to set the Theme based on your database or some other storage
        requestContext.HttpContext.Items["themeName"] = "Red";


        
        // Allow the Theme to be overriden via the querystring
        // If a Theme Name is Passed in the querystring then use it and override the previously set Theme Name
        // http://localhost/Default.aspx?theme=Red
        var previewTheme = requestContext.HttpContext.Request.QueryString["theme"];
        if (!string.IsNullOrEmpty(previewTheme))
        {
            requestContext.HttpContext.Items["themeName"] = previewTheme;
        }

        base.Execute(requestContext);
    }
}</pre>
<p>Then you need to have all your Controller&rsquo;s inherit from the ThemeControllerBase like the following:</p>
<pre class="brush: c-sharp; first-line: 1; tab-size: 4; toolbar: false; ">public class HomeController : ThemeControllerBase { }</pre>
<h3>Conclusion</h3>
<p>I&rsquo;m sure some kind of Themes support is on the list for Microsoft to eventually implement into ASP.NET MVC some time down the road, but I have yet to see anything mentioned. Also, since the Official v1.0 release has already been released, I don&rsquo;t really expect anything to change until presumably after .NET 4.0 ships; this is assuming the ASP.NET MVC 1.0 bits are what make it into .NET 4.0 and not a newer version of ASP.NET MVC. So, for now if you want to implement Themes into your ASP.NET MVC Website, you&rsquo;ll just have to use the code I post here, or some other custom implementation.</p>
