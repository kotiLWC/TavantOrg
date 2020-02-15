({
    loadOptions: function (component, event, helper) {
        var options = [
            { value: "Cold", label: "Cold" },
            { value: "Hot", label: "Hot" },
            { value: "Warm", label: "Warm" }
        ];
        component.set("v.statusOptions", options);
    },
    handleOptionSelected: function (cmp, event) {
        // Get the string of the "value" attribute on the selected option
        var selectedOptionValue = event.getParam("value");
        alert("Option selected with value: '" + selectedOptionValue + "'");
    }
})