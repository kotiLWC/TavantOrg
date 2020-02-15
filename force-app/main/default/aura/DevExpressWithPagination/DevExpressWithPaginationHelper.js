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
        var dataGrid = $("#gridContainer1").dxDataGrid({
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
            columnFixing: {
                enabled: true
            },
            paging: {
                enabled: true,
                pageSize: 10
            },
            pager: {
                showPageSizeSelector: true,
                allowedPageSizes: [10, 15, 20, 30],
                showInfo: true,
                showNavigationButtons: true                 
            },
            columns: columns,
        }).dxDataGrid("instance");
    }
})