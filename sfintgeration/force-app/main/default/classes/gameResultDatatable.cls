public with sharing class gameResultDatatable {
    @AuraEnabled
    public static list<GameResult__c> getResult(){
        String userId=UserInfo.getUserId();
        list<GameResult__c> result=[SELECT  Name, Mode__c, Result__c,CreatedDate FROM GameResult__c where CreatedById=:userId order By CreatedDate Desc];
        return result;
    }
    
}