({
    init : function(component, event, helper) {
        const columns = [{ label: 'GameNumber', fieldName: 'Name', type: 'text' },
            { label: 'GameMOde', fieldName: 'Mode__c', type: 'text' },
            { label: 'GameResult', fieldName: 'Result__c', type: 'text' },
            { label: 'PlayedDate', fieldName: 'CreatedDate', type: 'date' },]
        component.set("v.columns", columns);
        helper.getResult(component);
    },
    resultgetter:function(component, event, helper) {
        helper.getResult(component);
    }

})