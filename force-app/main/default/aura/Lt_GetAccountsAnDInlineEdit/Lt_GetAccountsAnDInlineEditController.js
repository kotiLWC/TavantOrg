({
    doInit: function(component, event, helper) {
        component.set('v.columns', [
            {label: 'FirstName', fieldName: 'Name', editable:'true', type: 'text'},
            {label: 'LastName', fieldName: 'LastName__c', editable:'true', type: 'text'},
            {label: 'Email', fieldName: 'Email__c',editable:'true', type: 'email'},
            {label: 'Phone', fieldName: 'Phone__c', editable:'true', type: 'Phone'},
            {
                label: 'Date Of Birth', fieldName: 'DOB__c', type: 'date', editable: true,
                typeAttributes: {
                    year: 'numeric',
                    month: 'short',
                    day: 'numeric',
                    hour: '2-digit',
                    minute: '2-digit'
                }
            },
            
        ]);    
            // Fetch the account list from the Apex controller
            helper.getAccountList(component);
            },
            
            onSave : function (component, event, helper)
            {
            helper.saveDataTable(component, event, helper);
            },
            onNext : function(component, event, helper) {        
            var pageNumber = component.get("v.currentPageNumber");
            component.set("v.currentPageNumber", pageNumber+1);
            helper.buildData(component, helper);
            },
            
            onPrev : function(component, event, helper) {        
            var pageNumber = component.get("v.currentPageNumber");
            component.set("v.currentPageNumber", pageNumber-1);
            helper.buildData(component, helper);
            },
            
            processMe : function(component, event, helper) {
            component.set("v.currentPageNumber", parseInt(event.target.name));
            helper.buildData(component, helper);
            },
            
            onFirst : function(component, event, helper) {        
            component.set("v.currentPageNumber", 1);
            helper.buildData(component, helper);
            },
            
            onLast : function(component, event, helper) {        
            component.set("v.currentPageNumber", component.get("v.totalPages"));
            helper.buildData(component, helper);
            },
        Search: function(component, event, helper) {
            debugger;
        var searchField = component.find('searchField');
        var isValueMissing = searchField.get('v.validity').valueMissing;
        // if value is missing show error message and focus on field
        if(isValueMissing) {
            searchField.showHelpMessageIfInvalid();
            searchField.focus();
        }else{
          // else call helper function 
            helper.SearchHelper(component, event);
        }
    },
})