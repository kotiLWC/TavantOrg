({
    doInit: function (component, event, helper) {
        debugger;
            component.set('v.columns', [
            {label: 'Opportunity name', fieldName: 'Name', type: 'text', editable: true, typeAttributes: { required: true }},
            {
                label: 'Close date', fieldName: 'CloseDate', type: 'date', editable: true,
                typeAttributes: {
                    year: 'numeric',
                    month: 'short',
                    day: 'numeric',
                    hour: '2-digit',
                    minute: '2-digit'
                }
            },
            {label: 'Amount', fieldName: 'Amount', type: 'currency', typeAttributes: { currencyCode: 'USD'}, editable: true, typeAttributes: { required: true } }
        ]);
    helper.getOppts(component, helper);     
    },
  onSave : function (component, event, helper) {
        helper.saveDataTable(component, event, helper);
    }
})