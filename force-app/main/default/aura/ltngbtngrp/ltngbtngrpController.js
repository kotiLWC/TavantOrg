({
    handleClick: function (cmp, event, helper) {       
        var selectedButtonLabel = event.getSource().get("v.label");
        alert("Button label: " + selectedButtonLabel);
    }
})