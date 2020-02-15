({
	fetchProducts : function(component, event, helper) {
		//alert('test');
		var action = component.get("c.getProducts");
        action.setCallback(this, function(response) {
			var state = response.getState();
            if (state === "SUCCESS") {
				component.set("v.productList", response.getReturnValue());
				$(function(){
					var pivotGridChart = $("#pivotgrid-chart").dxChart({
						commonSeriesSettings: {
							type: "bar"
						},
						tooltip: {
							enabled: true,
							customizeTooltip: function (args) {
								var valueText = (args.seriesName.indexOf("Total") != -1) ? 
										Globalize.formatCurrency(args.originalValue,
											"USD", { maximumFractionDigits: 0 }) :
										args.originalValue;
					
								return {
									html: args.seriesName + "<div class='currency'>"
										+ valueText + "</div>"
								};
							}
						},
						size: {
							height: 320
						},
						adaptiveLayout: {
							width: 450
						}
					}).dxChart("instance");
					var pivotGrid = $("#pivotgrid").dxPivotGrid({
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
					}).dxPivotGrid("instance");
					pivotGrid.bindChart(pivotGridChart, {
						dataFieldsDisplayMode: "splitPanes",
						alternateDataFields: false
					});
				});
			}
		});
		$A.enqueueAction(action);	
	}
})