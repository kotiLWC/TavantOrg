({
    init: function (cmp, event, helper) {
    cmp.set('v.mycolumns', [
                {opportunityName},
                {confidence}
               
            ]);
        cmp.set('v.mydata', [{
                id: 'a',
                opportunityName: 'Cloudhub',
                confidence: 0.2
            },
            {
                id: 'b',
                opportunityName: 'Quip',
                confidence: 0.78
            }]);
    },
    getSelectedName: function (cmp, event) {
        var selectedRows = event.getParam('selectedRows');
        // Display that fieldName of the selected rows
        for (var i = 0; i < selectedRows.length; i++){
            alert("You selected: " + selectedRows[i].opportunityName);
        }
    }
})