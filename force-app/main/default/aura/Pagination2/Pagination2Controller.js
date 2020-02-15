({
    doInit: function(component, event, helper) {
        debugger;
        var txtVal = component.get("v.txtContact");
        var action = component.get("c.getAccounts");
        action.setParams({
            search : txtVal 
        });
        helper.showSpinner(component);
        action.setCallback(this, function(a) {
            helper.hideSpinner(component);
            var state = a.getState();
            if(state == "SUCCESS"){
                var records = a.getReturnValue();
                if(records == '')
                {
                    //alert("Records are not available");
                    component.set("v.ValueThreeisTrue", true);
                    component.set("v.ValueOneisTrue", false);
                    component.set("v.ValueTwoisTrue", false); 
                }
                else
                {
                    component.set("v.allAccounts", records);
                    component.set("v.maxPage", Math.floor((records.length+9)/10));
                    component.set("v.ValueOneisTrue", false);
                    component.set("v.ValueTwoisTrue", true);    
                }
                helper.sortBy(component, "Name");
            }
            
        });
        $A.enqueueAction(action);
    },
    sortByName: function(component, event, helper) {
        helper.sortBy(component, "Name");
    },
    sortByIndustry: function(component, event, helper) {
        helper.sortBy(component, "Industry");
    },
    sortByAnnualRevenue: function(component, event, helper) {
        helper.sortBy(component, "AnnualRevenue");
    },
    renderPage: function(component, event, helper) {
        helper.renderPage(component);
    },
    delete : function(component, event, helper) {        
    if(confirm('Are you sure?'))
    helper.deleteAccount(component, event);        
},
 save : function(component, event, helper) {
    try {
        component.find("edit").get("e.recordSave").fire();
    }catch (e) {
        console.log(e);
    }
    location.reload();// This will refresh the app to get the latest updated data.        
},
    edit : function(component, event, helper) {
        component.set("v.isView",false);
        component.set("v.isEdit",true);
        component.set("v.ValueThreeisTrue", false);
        component.set("v.ValueOneisTrue", false);
        component.set("v.ValueTwoisTrue", false); 
        console.log('Edit record ID..'+event.target.id);
        component.set("v.editAccId",event.target.id);
        component.set("v.viewAccId",event.target.id);
    },
        
        view : function(component, event, helper) {
            debugger;
            var viewRec = event.target.id;
            component.set("v.viewAccId",event.target.id);
            component.set("v.isEdit",false);
            component.set("v.isView",true);
            component.set("v.ValueThreeisTrue", false);
            component.set("v.ValueOneisTrue", false);
            component.set("v.ValueTwoisTrue", false); 
            //if(confirm('Are you sure?'))
            //    helper.viewAccount(component, event); 
            /* var action = component.get("c.viewAccounts");
            var acid = event.target.id;
            action.setParams({accid:acid});
            action.setCallback(this, function(a) {
                var state = a.getState();
                if(state == "SUCCESS"){
                    component.set("v.isEdit",false);
                    component.set("v.isView",true);
                    component.set("v.ValueThreeisTrue", false);
                    component.set("v.ValueOneisTrue", false);
                    component.set("v.ValueTwoisTrue", false); 
                }
            });
            $A.enqueueAction(action);*/
        },
})