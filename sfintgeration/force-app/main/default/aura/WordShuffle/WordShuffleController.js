({
    StartNewGame: function (component,helper) {
        let getTheElement =component.find("comboBox");
        let getvalue = getTheElement.get("v.value");
        component.set("v.selectedValue", getvalue);
        debugger
        let modevalue = component.get("v.selectedValue");
        console.log(modevalue);
        if (modevalue) {
            console.log("start method called");
            const comp = component.find("boardcompo");
            comp.startMethod();
        }
    },
    reShuffle: function (component, event,helper) {
        const boardcomp = component.find("boardcompo");
        boardcomp.reshuffleTheBoard();

    },
    onResultHandler: function (component, event,helper) {
        console.log("rajesh shuffle method has been entered");
       
        const result = event.getParam("result");
        if (result && result === "YOU WIN") {
            component.set("v.disableReshuffle", true)
            console.log("button disabled");
            try {
                helper.addResultRecord(component, "YOU WIN");
            }
            catch (e) {
                console.error(e.name + ': ' + e.message);
            }
            // helper.addResultRecord(component,"YOU WIN");
        }else{
            component.set("v.disableReshuffle", false)
            console.log("button not disabled");
            try {
                helper.addResultRecord(component, "YOU LOSE");
            }
            catch (e) {
                console.error(e.name + ': ' + e.message);
            }
        }
        
        
        console.log("helper method called");
    }
})