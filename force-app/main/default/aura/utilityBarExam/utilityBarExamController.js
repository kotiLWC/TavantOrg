({
    openUtilityBar : function(component, event, helper) {
        var utilityAPI = component.find("utilitybar");
        utilityAPI.openUtility();
    },

    openTab: function(component, event, helper) {
        var workspaceAPI = component.find("workspace");
        workspaceAPI.openTab({
            pageReference: {
                "type": "standard__recordPage",
                "attributes": {
                    "recordId":"500xx000000Ykt2AAC",
                    "actionName":"view"
                },
                "state": {}
            },
            focus: true
        }).then(function(response) {
            workspaceAPI.getTabInfo({
            tabId: response
        }).then(function(tabInfo) {
            console.log("The recordId for this tab is: " + tabInfo.recordId);
        });
        }).catch(function(error) {
            console.log(error);
        });
    },

    focusNavigationItem : function(component, event, helper) {
        var navigationItemAPI = component.find("navigationItem");
        navigationItemAPI.focusNavigationItem().then(function(response) {
            console.log(response);
        })
        .catch(function(error) {
            console.log(error);
        });
    } 
})