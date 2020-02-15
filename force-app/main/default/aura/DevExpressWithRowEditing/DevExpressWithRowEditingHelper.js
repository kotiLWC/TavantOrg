({
    accountTableHelper : function(component, lstAccounts) {
        //alert('Test');
        debugger;
        //alert(lstAccounts);
        var allAccounts = lstAccounts;
        var columns = [{
            caption: "Name",
            dataField: "Name",
            dataType: 'string',
            
        },{
            caption: "Rating",
            dataField: "Rating",
            dataType: 'string',
        },{
            caption: "Phone",
            dataField: "Phone",
            dataType: 'string',
            validationRules: [{ type: "required" }, {
                    type: "pattern",
                    message: 'Your phone must have "(555) 555-5555" format!',
                    pattern: /^\(\d{3}\)\ \d{3}-\d{4}$/i 
                }]
        },{
            caption: "Industry",
            dataField: "Industry",
            dataType: 'string',
        }];
        var columnCount = 500,
        rowCount = 50;
        function logEvent(eventName) {
        var logList = $("#events ul"),
            newItem = $("<li>", { text: eventName });

        logList.prepend(newItem);
    }
        var dataGrid = $("#gridContainer3").dxDataGrid({
            dataSource: allAccounts,
            allowColumnReordering: true,
            allowColumnResizing: true,
            columnAutoWidth: true,
            showColumnLines: true,
            showRowLines: true,
            rowAlternationEnabled: true,
            showBorders: true,
            wordWrapEnabled: false,
            noDataText: "No Records Found",
            height:"auto",
            paging: {
            enabled: true
        },
             editing: {
            mode: "row",
            allowUpdating: true,
            allowDeleting: true,
            allowAdding: true
        }, 
            columns: columns,
        }).dxDataGrid("instance");
    }
})