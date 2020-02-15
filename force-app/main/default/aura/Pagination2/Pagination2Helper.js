({
    sortBy: function(component, field) {
        var sortAsc = component.get("v.sortAsc"),
            sortField = component.get("v.sortField"),
            records = component.get("v.allAccounts");
        sortAsc = sortField != field || !sortAsc;
        records.sort(function(a,b){
            var t1 = a[field] == b[field],
                t2 = (!a[field] && b[field]) || (a[field] < b[field]);
            return t1? 0: (sortAsc?-1:1)*(t2?1:-1);
        });
        component.set("v.sortAsc", sortAsc);
        component.set("v.sortField", field);
        component.set("v.allAccounts", records);
        this.renderPage(component);
    },
	renderPage: function(component) {
		var records = component.get("v.allAccounts"),
            pageNumber = component.get("v.pageNumber"),
            pageRecords = records.slice((pageNumber-1)*10, pageNumber*10);
        component.set("v.currentList", pageRecords);
	},
    showSpinner: function (component, event, helper) {
        var spinner = component.find("mySpinner");
        $A.util.removeClass(spinner, "slds-hide");
    },
    hideSpinner: function (component, event, helper) {
        var spinner = component.find("mySpinner");
        $A.util.addClass(spinner, "slds-hide");
    },
    deleteAccount : function(component, event) {
        console.log('in delete account helper method.');
        var action = component.get("c.delteAccountById");
        action.setParams({accid:event.target.id});
        action.setCallback(this, function(response) {
        	component.set("v.currentList",response.getReturnValue());
        });
        $A.enqueueAction(action);
	},
    viewAccount : function(component, event) {
        //console.log('in delete account helper method.');
        var action = component.get("c.viewAccounts");
        action.setParams({accid:event.target.id});
        action.setCallback(this, function(response) {
        component.set("v.currentList",response.getReturnValue());
        });
        $A.enqueueAction(action);
	},
})