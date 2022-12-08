({
    clickedFunction : function(component, event, helper) {
        let open = component.get("v.open");
        if (!open) {
            component.set("v.open", true);
            const winword = component.get("v.wordToDisplay");
            let compEvent = component.getEvent("onclick");
            compEvent.setParams({ value: winword });
            compEvent.fire();
        }
    },
    scriptsLoaded: function (component) {
        const compo = component.getElement(".mainClass");
        fitText(compo);
    }
})