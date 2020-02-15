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
        var dataGrid = $("#gridContainer2").dxDataGrid({
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
            loadPanel: {
                enabled: true
            },
            scrolling: {
                columnRenderingMode: "virtual"
                //mode: "infinite"
            },
            headerFilter: {
                visible: true,
                allowSearch: true
            }, 
            wordWrapEnabled: true,
            columns: columns,
        }).dxDataGrid("instance");
    }
})