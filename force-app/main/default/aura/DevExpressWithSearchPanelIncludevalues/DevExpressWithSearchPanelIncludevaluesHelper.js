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
        
       var filter = [
            ["Rating", "<>", "Hot"],
            ["Name", "<>", ""]
    ];        
       var filterbuilder = $("#filterBuilder").dxFilterBuilder({
        fields: columns,
        value: filter
    });

   var apply = $("#apply").dxButton({
        text: "Apply Filter",
        type: "default",
        onClick: function() {
            var filter = $("#filterBuilder").dxFilterBuilder("instance").option("value");
            $("#gridContainer4").dxDataGrid("instance").option("filterValue", filter);
        },
    });
        var dataGrid = $("#gridContainer4").dxDataGrid({
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
            columnsAutoWidth: true,
            filterRow: {
                visible: true,
                applyFilter: "auto"
            },/*searchPanel: {
                visible: true,
                width: 240,
                placeholder: "Search..."
            },*/headerFilter: {
                visible: true
            },paging: {
                enabled: true
            },
            sorting: {
                mode: "multiple"
            },
            columns: columns,
            
        }).dxDataGrid("instance");
        var Rating = ["All", "Hot", "Cold", "Warm"]; 
        var selectRating = $("#selectStatus").dxSelectBox({
        dataSource: Rating,
        value: Rating[0],
        onValueChanged: function(data) {
            if (data.value == "All")
                dataGrid.clearFilter();
            else
                dataGrid.filter(["Rating", "=", data.value]);
        }
    });
        var applyFilterTypes = [{
            key: "auto",
            name: "Immediately"
        }, {
            key: "onClick",
            name: "On Button Click"
        }];
    }
})