({
	scriptsLoaded : function(component, event, helper) 
    {
    var Orders =[];
	$(function() {
    $("#form").dxForm({
        formData: Orders,
        items: [{
            dataField: "Name"
        },{
            dataField: "Employee"
        },{
            dataField: "SaleAmount"
        },{
            dataField: "City"
        },{
            dataField: "State"
        },{
            dataField: "OrderDate",
            editorType: "dxDateBox",
            editorOptions: {
                width: "100%"
            }
        }]
    });
});
        console.log(Orders);
	}
})