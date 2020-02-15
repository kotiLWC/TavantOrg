({
    scriptsLoaded: function(component, event, helper) {
        var action = component.get("c.getOrders");
        action.setCallback(this, function(response) {
            var state = response.getState();
            if (state === "SUCCESS") {
                component.set("v.lstOrders", response.getReturnValue());
                var orders = component.get("v.lstOrders");
                var addtranscolumns = [{
                    caption: "Invoice Number",
                    dataField: "Name",
                    dataType: 'string',
                    alignment: "left",
                    cssClass: "myClass",
                    allowSorting: false,
                    allowEditing: false,
                }, {
                    caption: "Order Date",
                    dataField: "Order_Date__c",
                    dataType: 'date',
                    alignment: "left",
                    cssClass: "myClass",
                    allowSorting: false,
                    allowEditing: false,
                }, {
                    caption: "Sale Amount",
                    dataField: "Sale_Amount__c",
                    dataType: 'string',
                    alignment: "left",
                    cssClass: "myClass",
                    allowSorting: false,
                    allowEditing: false,
                }, {
                    caption: "Employee",
                    dataField: "Employee__c",
                    dataType: 'string',
                    alignment: "left",
                    cssClass: "myClass",
                    allowSorting: false,
                    allowEditing: false,
                }, {
                    caption: "City	",
                    dataField: "City__c",
                    dataType: 'string',
                    alignment: "left",
                    cssClass: "myClass",
                    allowSorting: false,
                    allowEditing: false,
                }, {
                    caption: "State",
                    dataField: "State__c",
                    dataType: 'string',
                    alignment: "left",
                    cssClass: "myClass",
                    allowSorting: false,
                    allowEditing: false,
                }, ];
                var dataGrid = $("#gridContainer2").dxDataGrid({
                    dataSource: orders,
                    columnAutoWidth: true,
                    noDataText: "No Records Found",
                    filterRow: {
                        visible: true,
                        applyFilter: "auto"
                    },
                    searchPanel: {
                        visible: true,
                        width: 240,
                        placeholder: "Search..."
                    },
                    columns: addtranscolumns,
                    customizeColumns: function(columns) {},
                    filterPanel: {
                        visible: true
                    },
                    headerFilter: {
                        visible: true
                    },
                }).dxDataGrid("instance");
            }
        });

        $A.enqueueAction(action);

    }
})