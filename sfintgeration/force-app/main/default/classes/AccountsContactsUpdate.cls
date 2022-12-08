/*public class AccountsContactsUpdate {
    public static void updateAccounts(Set<id> AccountsId){
        List<AggregateResult> activeContacts=[SELECT AccountId,count(Id) total FROM Contact Where ActiveStatus__c=true AND AccountId IN:AccountsId group By AccountId];                                                    
        map<id,Account> accontstobeUpdated=new map<id,Account>();
        for(AggregateResult a:activeContacts){
            string accId=(string)a.get('AccountId');
            Integer noofContacts=(integer)a.get('total');
            Account acc=new Account(Id=accId,ActiveContacts__c=noofContacts);
            accontstobeUpdated.put(accId,acc);
        }
        for(id i:AccountsId){
            if(!accontstobeUpdated.containsKey(i)){
               accontstobeUpdated.put(i,new Account(Id=i,ActiveContacts__c=0)); 
            }
        }
        update accontstobeUpdated.values();
    }
}*/
public class AccountsContactsUpdate{
    public Static void updateAccounts(set<Id>accountIds){
        List<AggregateResult> activeAccounts=[SELECT AccountId,count(Id) total FROM Contact Where ActiveStatus__c=true AND AccountId IN:accountIds group By AccountId]; 
        map<Id,Account> accountsToBeUpdated=new map<Id,Account>();
        for(AggregateResult r:activeAccounts){
            integer activeContacts=(integer)r.get('total');
            String accId=(String)r.get('AccountId');
            Account a=new Account(Id=accId,ActiveContacts__c=activeContacts);
            accountsToBeUpdated.put(accId,a);
        }
               for(id i:accountIds){
            if(!accountsToBeUpdated.containsKey(i)){
               accountsToBeUpdated.put(i,new Account(Id=i,ActiveContacts__c=0)); 
            }
        }
        update accountsToBeUpdated.values();
    }
}