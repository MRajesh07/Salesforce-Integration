public class ActivecheckContact {
    public static void afterInsert(list<Contact> Contacts){
        set<id> accountIds= new set<id>();
        for(Contact c:Contacts){
            if(String.isNotBlank(c.AccountId)){
                accountIds.add(c.AccountId);
            } 
        }
        AccountsContactsUpdate.updateAccounts(accountIds);
    }
    public static void afterUpdate(list<Contact> Con,map<id,Contact> contacts){
        set<id> accountIds= new set<id>();
        for(Contact c:Con){
            if(String.isNotBlank(c.AccountId) && contacts.get(c.Id).ActiveStatus__c!=c.ActiveStatus__c){
                accountIds.add(c.AccountId);
            }
            if(c.AccountId != contacts.get(c.Id).AccountId){
                accountIds.add(c.AccountId);
                accountIds.add(contacts.get(c.Id).AccountId);
            }
            
        }
        AccountsContactsUpdate.updateAccounts(accountIds);
    }
    public static void afterDelete(List<Contact> oldcontacts){
        set<id> accountIds= new set<id>();
        for(Contact c:oldcontacts){
            if(String.isNotBlank(c.AccountId)){
                accountIds.add(c.AccountId);
            } 
        }
        AccountsContactsUpdate.updateAccounts(accountIds);
    }  
    public static void afterUndelete(List<Contact> newcontacts){
        set<id> accountIds= new set<id>();
        for(Contact c:newcontacts){
            if(String.isNotBlank(c.AccountId)){
                accountIds.add(c.AccountId);
            } 
        }
        AccountsContactsUpdate.updateAccounts(accountIds);
    } 
}