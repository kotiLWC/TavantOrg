({
	scriptsLoaded : function(component, event, helper) {
		debugger;
		var action = component.get("c.getAccounts");
	action.setCallback(this, function(response) {
		var state = response.getState();
		if (state === "SUCCESS") {
			component.set("v.accountList", response.getReturnValue());
			$("#gridContainer").dxDataGrid({
				dataSource: {
					store: component.get("v.accountList")
				},
				/*paging: {
					pageSize: 10
				},
				pager: {
					showPageSizeSelector: true,
					allowedPageSizes: [5, 10, 20],
					showNavigationButtons: true,
					showInfo: true,
            		infoText: "Page:{0} of {1} ({2} items)" 

				},*/
				headerFilter: {
					visible: true
				},
				searchPanel: {
					visible: true,
					width: 240,
					placeholder: "Search..."
				},
				columnsAutoWidth: true,
				filterRow: { visible: true },
        		filterPanel: { visible: true },
				filterValue: [["Name", "=", "koti"]],
				filterBuilder: {
					customOperations: [{
						name: "weekends",
						caption: "Weekends",
						dataTypes: ["date"],
						icon: "check",
						hasValue: false,
						calculateFilterExpression: function() {
							return [[getOrderDay, "=", 0], "or", [getOrderDay, "=", 6]];
						}
					}]
				},
				filterBuilderPopup: {
					position: { of: window, at: "top", my: "top", offset: { y: 10 } },
				},
				columns: ["Name","Rating","Phone","Industry"],
			}).dxDataGrid("instance");
			
		}
	});
	$A.enqueueAction(action);
	}
})