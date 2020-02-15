({
scriptsLoaded : function(component, event, helper) {
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
				allowFiltering: true,
				allowSearch: true,
				width: "35%",
			},{
				caption: "Rating",
				dataField: "Rating",
				dataType: 'string',
				alignment: "left",
				cssClass: "myClass",
				allowSorting: false,
				allowEditing: false,
				allowFiltering: true,
				allowSearch: true,
				width: "35%",
			},{
				caption: "Industry",
				dataField: "Industry",
				dataType: 'string',
				alignment: "left",
				cssClass: "myClass",
				allowSorting: false,
				allowEditing: false,
				allowFiltering: true,
				allowSearch: true,
				width: "35%",
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
		height:"100%",
		width:"100%",

		filterPanel: { visible: true},
		filterRow: { visible: true},
		searchPanel: { visible: true },
		headerFilter: { visible: true },
		columns:addtranscolumns ,
		customizeColumns: function (columns) {
		},
	}).dxDataGrid("instance");
	
		}
	});
		$A.enqueueAction(action);
}
})