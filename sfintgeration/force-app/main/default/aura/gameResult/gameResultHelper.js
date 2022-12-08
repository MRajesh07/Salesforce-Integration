({
    getResult : function(component) {
        const action = component.get("c.getResult");
        action.setCallback(this, function (response) {
            const state = response.getState();
            if (state === "SUCCESS") {
                const res = response.getReturnValue();
                if (res) {
                    component.set("v.data",res)
                }
            }
        });
        $A.enqueueAction(action);
    }
})