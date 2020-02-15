({
	fetchAccounts: function(component,event,helper) {
        debugger;
		var action = component.get("c.getAccounts");
        action.setCallback(this, function(response) {
            var state = response.getState();
            if (state === "SUCCESS") {
				component.set("v.accountList", response.getReturnValue());
				var allAccounts = component.get("v.accountList");
				var addtranscolumns = [{
					caption: "Name",
					dataField: "Name",
					dataType: 'string',
					alignment: "left",
					cssClass: "myClass",
					allowSorting: false,
					allowEditing: false,
					width: "30%",
				},{
					caption: "Rating",
					dataField: "Rating",
					dataType: 'string',
					alignment: "left",
					cssClass: "myClass",
					allowSorting: false,
					allowEditing: false,
					width: "30%",
				},{
					caption: "Industry",
					dataField: "Industry",
					dataType: 'string',
					alignment: "left",
					cssClass: "myClass",
					allowSorting: false,
					allowEditing: false,
					width: "30%",
				},];
		var dataGrid = $("#gridContainer").dxDataGrid({
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
            editing: {
                mode: "batch",
                allowUpdating: true,
                allowAdding: true
            },
            scrolling: {
                        
                showScrollbar: "always",
                        
                    },
            groupPanel: {
                visible: true
            },
            columnChooser: {
                enabled: true
            },
            columnFixing: { 
                enabled: true
            },
            filterRow: {
                visible: true,
                applyFilter: "auto"
            },
            searchPanel: {
                visible: true,
                width: 240,
                placeholder: "Search...",
                searchVisibleColumnsOnly: true
            },
            headerFilter: {
                visible: true
            },
            loadPanel: {
                enabled : true,
                showIndicator: true
            },
            pager: {
                showPageSizeSelector: true,
                allowedPageSizes: [5, 10, 20, 30],
                showInfo: true,
                showNavigationButtons: true
            },
            paging: {
                pageSize: 10
            },
          
            columns:addtranscolumns ,
            customizeColumns: function (columns) {
            },
        }).dxDataGrid("instance");
            }
        });
         $A.enqueueAction(action);	
	}
})