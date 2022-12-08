public with sharing class CTPeopleTracingTriggerHandler {
   public static void beforeInsert(list<People_Tracing__c> newRecords){
    List<People_Tracing__c> duplicateRecords=CTPersonTracingController.checkDuplicates(newRecords);
    for(People_Tracing__c p:duplicateRecords){
        p.addError('you are entering Duplicates');
    }
   }
}