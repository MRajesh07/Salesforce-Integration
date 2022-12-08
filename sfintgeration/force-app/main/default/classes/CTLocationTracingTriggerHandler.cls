public with sharing class CTLocationTracingTriggerHandler {
    public static void beforeInsert(List<Location_Tracing__c> newRecords){
        List<Location_Tracing__c> duplicateRecords=CTLocationTracingController.checkDuplicates(newRecords);
        for(Location_Tracing__c l:duplicateRecords){
            l.addError('you are entering Duplicates');
        }
       }
}