({
    clickCreateItem : function(component, event, helper) {
        var theItems = component.get("v.items");
        var newItem = JSON.parse(JSON.stringify(item));
        console.log("Expenses before 'create': " + JSON.stringify(theItems));
        theExpenses.push(newItem);
        component.set("v.items", theItems);
        
        
    }
})