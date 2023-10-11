---
layout: post
blogengineid: 00000000-0000-0000-0000-000000000000
title: "How to Hide a Column in AG-Grid and Prevent it from Displaying in the Tool Panel"
date: 2023-10-11 19:05:00 -0500
comments: true
published: true
ai-generated: true
categories: ["JavaScript"]
tags: ["JavaScript", "js", "AG-Grid"]
---

AG-Grid is a powerful and versatile JavaScript library for creating data grids and tables in web applications. It offers a wide range of features and customization options, including the ability to hide columns. However, simply setting the `hide` property to true in your column definition is not enough to achieve the desired effect. In this article, we will explore how to hide a column in AG-Grid while ensuring that it is not displayed in the Tool Panel.

## Problem - AG-Grid Column isn't hiding

You have a grid in AG-Grid, and you want to hide a specific column. To do this, you may initially try setting the `hide` property to true in your column definition like this:

```javascript
var columnDefs = [
  {
    headerName: "ID",
    field: "entity_id",
    width: 100,
    hide: true
  }
];
```

While this will hide the column in the grid, it won't prevent it from being displayed in the Tool Panel, which can be a problem if you want to hide the column entirely from the user's view.

## Solution - Hide AG-Grid Column

To hide a column in AG-Grid and prevent it from appearing in the Tool Panel, you need to use the `suppressToolPanel` property in your column definition. This property, when set to true, will ensure that the column is not displayed in the Tool Panel.

Here's how you can modify your column definition to achieve this:

```javascript
var columnDefs = [
  { 
    headerName: "ID", 
    field: "entity_id", 
    width: 100, 
    hide: true, 
    suppressToolPanel: true
  }
];
```

With `suppressToolPanel` set to true, the `entity_id` column will be hidden in both the grid and the Tool Panel.

## Practical Example

Let's demonstrate this solution with a complete working example. In this example, we will create an AG-Grid with a hidden column that is also suppressed in the Tool Panel.

```javascript
<!DOCTYPE html>
<html>
<head>
  <script src="https://cdn.jsdelivr.net/npm/ag-grid-community/dist/ag-grid-community.min.js"></script>
</head>
<body>
  <div id="myGrid" class="ag-theme-alpine" style="width: 600px; height: 200px;"></div>
  <script>
    var gridOptions = {
      columnDefs: [
        { 
          headerName: "ID", 
          field: "entity_id", 
          width: 100, 
          hide: true, 
          suppressToolPanel: true
        },
        { headerName: "Full Name", field: "fullName" },
        { headerName: "Color", field: "color" }
      ],
      rowData: [
        { entity_id: 1, fullName: "Bright Diamond", color: "Clear" },
        { entity_id: 2, fullName: "Ruby Red", color: "Red" },
        { entity_id: 3, fullName: "Sapphire Glaze", color: "Blue" }
      ],
      defaultColDef: {
        sortable: true,
        resizable: true,
        filter: true
      },
    };

    var gridDiv = document.querySelector('#myGrid');
    new agGrid.Grid(gridDiv, gridOptions);
  </script>
</body>
</html>
```

In this example, the `entity_id` column is hidden in both the grid and the Tool Panel, as specified by the hide and suppressToolPanel properties.

## Conclusion

AG-Grid provides a straightforward way to hide columns and prevent them from appearing in the Tool Panel. By using the `suppressToolPanel` property in your column definition, you can achieve the desired behavior and offer a cleaner and more streamlined user experience in your web application.
