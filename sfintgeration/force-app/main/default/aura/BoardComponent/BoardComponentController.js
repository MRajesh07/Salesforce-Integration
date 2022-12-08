({
    doInit: function (component, event, helper) {
        console.log("intilization completed");
        var gameMode = component.get("v.mode");
        let column = 0;
        if (gameMode && gameMode === "Hard") {
             column = 6;
        } else if (gameMode === "Medium") {
             column = 4;
        } else {
             column = 3;
        }
        let blockSize = 12 / column;
        component.set("v.noOfColoumns", blockSize);
        const arrayOfWords = helper.gettingArrayOfWords(column*column);
        const randomWord = helper.getRandomWord(arrayOfWords);
        component.set("v.winWord", randomWord);
        component.set("v.words", arrayOfWords);
        helper.resetBoard(component);
       
    },
    // test:function (component, event, helper) {
    //     console.log("test method called");
        
    // },
    rendering: function (component, event, helper) {
        console.log("rendering completed");
        
    },
    onclickhandler: function (component, event, helper) {
        console.log("custom event");
        let counter = component.get("v.clickedCount") + 1;
        // let winword = component.get("v.winWord");
        let eventWord = event.getParam("value");
        if (eventWord === component.get("v.winWord")) {
            component.set("v.result", "YOU WIN");
            const result=component.get("v.result")
            helper.disableBoardComponent(component);
            
            helper.reshuffleButton(result);
            console.log("you won");
        } else if (counter === 3) {
            helper.disableBoardComponent(component);
            component.set("v.result", "YOU LOSE");
            const result=component.get("v.result")
            helper.reshuffleButton(result);
            console.log("you lose");
        }
        component.set("v.clickedCount",counter)
    },
    reshuffleTheBoard: function (component, event, helper) { 
        component.set("v.words", helper.randomizeArray(component.get("v.words")));
        helper.resetBoard(component)
    }
    
})