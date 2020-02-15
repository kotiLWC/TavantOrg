({
    init: function (component, event, helper) {
        component.set('v.mycolumns', [
            {label: 'Account Name', fieldName: 'Name', type: 'text'},
            {label: 'Rating', fieldName: 'Rating', type: 'text'},
            {label: 'Contact Name', fieldName: 'Name', type: 'text'},
            {label: ' Contact Email', fieldName: 'Email', type: 'email'},            
        ]);
        helper.getData(component, event, 'getAccounts', 'mydata');
    }	
})