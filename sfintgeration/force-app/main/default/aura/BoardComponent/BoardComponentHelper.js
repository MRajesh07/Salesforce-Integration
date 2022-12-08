({
    gettingArrayOfWords: function (count) {
        if(count>100) return
        let wordArray = ["expansion",
        "grandfather",
        "nappy",
        "oranges",
        "beds",
        "quack",
        "achiever",
        "yell",
        "hospital",
        "winter",
        "understood",
        "squalid",
        "merciful",
        "reaction",
        "wipe",
        "fearless",
        "tiresome",
        "introduce",
        "planes",
        "drum",
        "muddle",
        "capable",
        "canvas",
        "route",
        "enchanted",
        "quirky",
        "switch",
        "apparatus",
        "loss",
        "agreement",
        "substance",
        "back",
        "oafish",
        "expand",
        "aromatic",
        "quarrelsome",
        "free",
        "useful",
        "raspy",
        "drown",
        "ring",
        "lush",
        "numberless",
        "embarrass",
        "shrill",
        "rice",
        "ice",
        "crow",
        "pumped",
        "sparkle",
        "instruct",
        "girl",
        "glass",
        "frog",
        "murky",
        "impolite",
        "crabby",
        "pin",
        "grade",
        "upbeat",
        "linen",
        "flaky",
        "side",
        "unknown",
        "cactus",
        "round",
        "busy",
        "grab",
        "crush",
        "faithful",
        "mother",
        "clean",
        "unhealthy",
        "event",
        "absent",
        "thoughtless",
        "icy",
        "prefer",
        "charge",
        "confuse",
        "clam",
        "dress",
        "snake",
        "evasive",
        "unit",
        "flow",
        "annoying",
        "gusty",
        "possessive",
        "rhetorical",
        "rule",
        "frantic",
        "farm",
        "poor",
        "possess",
        "men",
        "pleasant",
        "zoom",
        "sidewalk",
            "reply"];
        wordArray = this.randomizeArray(wordArray);
        const wordsObjArray = wordArray.map((element) => {
            return { word: element, open: false };
        });
        //slice the array and returned request items
        return wordsObjArray.slice(0, count);
        
    },
    randomizeArray: function (arr) {
        const randomArr = arr;
        // Randomize the array
        for (let i = randomArr.length - 1; i > 0; i--) {
            const j = Math.floor(Math.random() * i);
            const temp = randomArr[i];
            randomArr[i] = randomArr[j];
            randomArr[j] = temp;
        }
        return randomArr;
    },
    getRandomWord: function(arr){
         const randomWords = Math.floor(Math.random() * arr.length);
        return arr[randomWords].word;
    },
    enableBoardComponent:function(component){
        component.set("v.disableBoard", false);
    },
    disableBoardComponent:function(component){
        component.set("v.disableBoard", true);
    },
    resetBoard: function (component) {
        // enable the board
        this.enableBoardComponent(component);
        // reset result
        component.set("v.result", " ");
        // reset click count
        component.set("v.clickedCount", 0);
    },
    reshuffleButton: function (resultvalue) {
        const event2 = $A.get("e.c:ResultApplicationEvent");
        event2.setParams({ result: resultvalue })
        event2.fire();
        console.log("event has been fired rajesh");
    }
})