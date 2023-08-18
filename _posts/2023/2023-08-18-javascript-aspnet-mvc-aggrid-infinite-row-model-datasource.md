---
layout: post
blogengineid: 00000000-0000-0000-0000-000000000000
title: "JavaScript: AG-Grid + ASP.NET MVC Infinite Row Model DataSource"
date: 2023-08-18 12:00:00 -0500
comments: true
published: true
categories: ["JavaScript", "ASP.NET MVC"]
tags: ["JavaScript", "js", "EntityFramework", "EF", "AG-Grid"]
---

AG-Grid supports infinite scrolling through the use of it's support for implementing Infinite Row Model. This allows for the grid to lazy-load rows of data from the server depending on the scroll position of the data grid. Essentially, it loads the first page of results, then as the user scrolls, it loads more data as they continue to scroll down through the list. It allows you to implement a more desktop app style data table interface in your web applications.

Unfortunately, the documentation is a little light in the way of how to implement this using an ASP.NET MVC web application backend for the data, and plain JavaScript code in the page. To me this is the simplest tech stack for an ASP.NET web application, and utilizing AG-Grid will grant you amazing data table power for your applications.

> NOTE: This article shows how to implement AG-Grid Infinite Row Model using ASP.NET MVC, JavaScript, and Entity Framework. FYI, this article does not cover using React, Angular or Vue.

The following steps are necessary to wire up AG-Grid Infinite Row Model with an ASP.NET MVC application using JavaScript:

## ASP.NET MVC Server-side

### Step 1: Reference `AgGrid.InfiniteRowModel.EntityFrameworkCore` Nuget Package

This open source library includes the necessary code to easily integrate the server-side aspects of supporting the AG-Grid sorting and filtering when it makes server-side requests for more data as the user scrolls down the grid. It's also setup to already support this using Entity Framework as the data access layer of the app.

```cli
dotnet add package AgGrid.InfiniteRowModel.EntityFrameworkCore --version 1.6.0
```

On your ASP.NET MVC project, add a Nuget Package reference to the `AgGrid.InfiniteRowModel.EntityFrameworkCore` package.

Here's some useful links for this project:

- [Nuget Package: AgGrid.InfiniteRowModel.EntityFrameworkCore](https://www.nuget.org/packages/AgGrid.InfiniteRowModel.EntityFrameworkCore)
- [`AgGrid.InfiniteRowModel` Project Source Code](https://github.com/AdrianWilczynski/AgGrid.InfiniteRowModel)

_P.S. Thank you to [Adrian Wilczyński](https://github.com/AdrianWilczynski) for creating this project._

### Step 2: Create the data API controller that returns JSON

Add these additional `using` statements to include the necessary namespaces in your ASP.NET MVC Controller class:

```csharp
using AgGrid.InfiniteRowModel;
using AgGrid.InfiniteRowModel.EntityFrameworkCore;
```

Use the following code for the ASP.NET MCV Controller Action method that will be called to load data in the AG-Grid:

```csharp
[Route("api")]
[ApiController]
public class ApiDataController : Controller
{
    [HttpGet("data")]
    public async Task<InfiniteRowModelResult<DataModel>> Countries(
        string query
    )
    {
        // get an IQueryable<DataModel> from your Entity Framework
        // 'DataModel' would be your EF data model
        var query = dbContext.Set<DataModel>();
        return await query.AsNoTracking()
            .GetInfiniteRowModelBlockAsync(query);
    }
}
```

Keep in mind the above code is simplified to show just the parts necessary for the AG-Grid Infinite Row Model / infinite scrolling feature support. The `dbContext` and `DataModel` in the example would match to your own Entity Framework context and models.

The `GetInfiniteRowModelBlockAsync(query)` extension method takes in the `query` value passed to the action method via AG-Grid. This is a JSON serialized string that contains the necessary sorting, filtering, and paging information from the AG-Grid for the data it's requesting.

The `InfiniteRowModelResult` will format the HTTP result as necessary for the data to be loaded by the AG-Grid.

Also, you can see the MVC Controller example is setting up the Route necessary so it's accessible form the `/api/data` relative URL on the ASP.NET MVC web application.

## JavaScript Client-side

### Step 1: Configure AG-Grid `gridOptions.rowModelType: 'infinite'`

When defining the `gridOptions` for the AG-Grid, you will need to set the `rowModelType` to be set to `infinite` for the infinite scrolling feature to be enabled.

```javascript
var gridOptions = {
    // define columnDefs and other options
    columnDefs: [ ... ],

    // configure infinite row model
    rowModelType: 'infinite'
}
``````

### Step 2: Create AG-Grid data source

The AG-Grid data source must be created that will be used by the grid.\

The following is the most simplistic code for an "infinite" data source that can be created that can be used by AG-Grid for loading data from the previously defined ASP.NET MVC API controller method:

```javascript
var dataSource = {
    getRows: async (request) => {
        // define data url to API call
        var url = '/api/data';

        // add 'query' value to querystring of the API call
        url += '&' + (new URLSearchParams({ query: JSON.stringify(request) })).toString()

        try {
            await fetch(url)
                .then((response) => response.json())
                .then(function (data) {
                    request.successCallback(data.rowsThisBlock, data.lastRow);
                });
        }
        catch
        {
            console.error('agGrid datasource error');
            request.failCallback()
        }
    }
}
```

Notice, the data source appends the `query` querystring value set to a JSON serialization of the `request` object that AG-Grid passes to the `getRows` method of the data source. This is how the query details of sorting, filtering, etc are passed to the server so it can be translated into the appropriate Entity Framework query to load the requested data.

### Step 3: Call `setDatasource` on AG-Grid Initialization

When the AG-Grid is initialized on the page, the `setDatasource` method of the `gridOptions.api` can be called to tell AG-Grid to use the "infinite" data source that was previously defined.

Here's the basic code that will initialize the AG-Grid on the page and configure it to use the "infinite" data source:

```javascript
document.addEventListener('DOMContentLoaded', function () {
    const gridDiv = document.querySelector('#myGrid');
    new agGrid.Grid(gridDiv, gridOptions);

    gridOptions.api.setDatasource(dataSource);
});
```

## Conclusion

The article shows the simplest and most basic code for setting up and configuring an ASP.NET MVC application, with Entity Framework, utilize the AG-Grid's Infinite Row Model (aka "Infinite Scrolling") feature. Keep in mind, you'll need to refer to the AG-Grid documentation for further information on configuring and using AG-Grid in your application.

Hopefully, this helps direct you in the right direction to getting this feature setup in your own applications.