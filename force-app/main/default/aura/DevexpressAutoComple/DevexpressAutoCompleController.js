({
    scriptsLoaded : function(component, event, helper) {
        var autocompleteData = [
            { country: "Afghanistan", capital: "Kabul" },
            { country: "Albania", capital: "Tirana" },
            { country: "India", capital: "New Delhi" },

            // ...
        ];
            
            $(function() {
            $("#autocompleteContainer").dxAutocomplete({
            dataSource: autocompleteData,
            placeholder: 'Type country name...',
            valueExpr: 'capital',
            searchExpr: 'country',
            });
            });
            }
            })