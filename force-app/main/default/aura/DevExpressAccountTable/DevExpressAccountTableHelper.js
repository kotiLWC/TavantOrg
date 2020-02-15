({
	accountTableHelper : function(component, lstAccounts) {
		debugger;//alert("Helper Class Alert");
		var allAccounts = lstAccounts;
		var addtranscolumns = [{
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
		var dataGrid = $("#gridContainer").dxDataGrid({
			dataSource: allAccounts,
			columns: addtranscolumns,
            allowColumnReordering: true,
            allowColumnResizing: true,
            columnAutoWidth: true,
            showColumnLines: true,
            showRowLines: true,
            rowAlternationEnabled: true,
            showBorders: true,
            wordWrapEnabled: true,
            noDataText: "No Records Found",
            height:"85%",
		}).dxDataGrid("instance");
		
	}
})