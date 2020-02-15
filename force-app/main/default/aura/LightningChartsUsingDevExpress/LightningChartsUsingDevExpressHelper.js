({
	fetchProducts : function(component, event, helper) {
		//alert('test');
		var action = component.get("c.getProducts");
        action.setCallback(this, function(response) {
			var state = response.getState();
            if (state === "SUCCESS") {
				component.set("v.productList", response.getReturnValue());
				$(function(){
					$("#sales").dxPivotGrid({
						allowSortingBySummary: true,
						allowSorting: true,
						allowFiltering: true,
						allowExpandAll: true,
						height: 440,
						showBorders: true,
						fieldChooser: {
							enabled: false
						},
						"export": {
							enabled: true,
							fileName: "Sales"
						},
						dataSource: {
							fields: [{
								caption: "Region",
								dataField: "Region__c",
								area: "row" 
							}, {
								caption: "City",
								dataField: "City__c",
								area: "row"
								
							}, {
								dataField: "Date__c",
								dataType: "date",
								area: "column"
							}, {
								caption: "Sales",
								dataField: "Amount__c",
								dataType: "currency",
								summaryType: "sum",
								format: "currency",
								area: "data"
							}],
							store: component.get("v.productList")
						}
					});
				});
			}
		});
		$A.enqueueAction(action);	
	}
})