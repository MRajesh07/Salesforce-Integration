({
    addResultRecord : function(component, gamereuslt) {
        const action = component.get("c.getGameResult");
        const gameMode=component.get("v.selectedValue")
        action.setParams({
            result:gamereuslt,
            mode:gameMode.toUpperCase() 
        });
        action.setCallback(this, function (response) {
            const state = response.getState();
            if (state !== "SUCCESS") {
                console.error("Error in saving the record");
            }
        });
        $A.enqueueAction(action);
    }
})