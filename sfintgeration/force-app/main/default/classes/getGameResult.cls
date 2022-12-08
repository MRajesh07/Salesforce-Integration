public with sharing class getGameResult {
    @AuraEnabled
    public static string getGameResult(String result, String mode) {
        GameResult__c gameResult = new GameResult__c(Result__c = result, Mode__c = mode);
        insert gameResult;
        return 'success';
    }
}