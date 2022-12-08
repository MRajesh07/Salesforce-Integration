@isTest
public with sharing class ActivecheckContactTriggerTest {
    @TestSetUp
    public static void reusedMethod(){
        List<Account> Accounts =new List<Account>();
        Account Acc1=new Account(Name='test1');
        Account Acc2=new Account(Name='test2');
        Accounts.add(Acc1);
        Accounts.add(Acc2);
        Insert Accounts;
        list<Contact> contacts= new List<Contact>();
        contacts.add(new Contact(LastName='mathi1',AccountId=Accounts[0].Id,ActiveStatus__c=true));
        contacts.add(new Contact(LastName='mathi2',AccountId=Accounts[0].Id,ActiveStatus__c=true));
        contacts.add(new Contact(LastName='mathi3',AccountId=Accounts[0].Id));
        contacts.add(new Contact(LastName='mathi4',AccountId=Accounts[0].Id));
        contacts.add(new Contact(LastName='mathi5',AccountId=Accounts[1].Id));
        contacts.add(new Contact(LastName='mathi6',AccountId=Accounts[1].Id));
        Insert contacts;
    }
    @isTest
    public static void afterInserttest2(){
        List<Account> acc=[SELECT Id, Name, ActiveContacts__c FROM Account];
        for(Account a:acc){
            if(a.Name=='test1'){
                System.assertEquals(2, a.ActiveContacts__c);
            }else if(a.Name=='test2'){
                System.assertEquals(0, a.ActiveContacts__c);
            }
        }
        System.assertEquals(2, acc.Size(),'expected and actual value not equal');
    }
    @isTest
    public static void afterUpdate(){
        Account testAccount=[Select Id,Name from Account where Name In('test2')];
        list<Contact> Con=[select ID,LastName,AccountId from Contact];
        for(Contact c: Con){
            if(c.LastName=='mathi2'||c.LastName=='mathi1'){
                c.ActiveStatus__c=true;
                c.AccountId=testAccount.Id;
            }
            if(c.LastName=='mathi3'){
                c.ActiveStatus__c=true;
            }
        }
        Test.startTest();
        update Con;
        Test.stopTest();
        List<Account> acc=[SELECT Id, Name, ActiveContacts__c FROM Account];
        for(Account a:acc){
            if(a.Name=='test1'){
                System.assertEquals(1, a.ActiveContacts__c);
            }else if(a.Name=='test2'){
                System.assertEquals(2, a.ActiveContacts__c);
            }
        }
        System.assertEquals(2, acc.Size(),'expected and actual value not equal');
    }
    @isTest
    public static void afterDelete(){
        Account testAccount=[Select Id,Name from Account where Name In('test2')];
        list<Contact> Con=[select ID,LastName,AccountId from Contact];
        List<Contact> Con2= New List<Contact>();
        for(Contact c: Con){
            if(c.LastName=='mathi2'||c.LastName=='mathi1'){
                Con2.add(c);
            }
        }
        Test.startTest();
        Delete Con2;
        Test.stopTest();
        List<Account> acc=[SELECT Id, Name, ActiveContacts__c FROM Account];
        for(Account a:acc){
            if(a.Name=='test1'){
                System.assertEquals(0, a.ActiveContacts__c);
            }else if(a.Name=='test2'){
                System.assertEquals(0, a.ActiveContacts__c);
            }
        }
        System.assertEquals(2, acc.Size(),'expected and actual value not equal');
        list<Contact> unDeletedContacts=[select Id from Contact];
        System.assertEquals(4, unDeletedContacts.Size(),'expected and actual value not equal');
    }
    @isTest
    public static void afterUnDelete(){
        Account testAccount=[Select Id,Name from Account where Name In('test2')];
        list<Contact> Con=[select ID,LastName,AccountId from Contact];
        List<Contact> Con2= New List<Contact>();
        for(Contact c: Con){
            if(c.LastName=='mathi2'||c.LastName=='mathi1'){
                Con2.add(c);
            }
        }
        Delete Con2;
        Test.startTest();
        UnDelete Con2;
        Test.stopTest();
        List<Account> acc=[SELECT Id, Name, ActiveContacts__c FROM Account];
        for(Account a:acc){
            if(a.Name=='test1'){
                System.assertEquals(2, a.ActiveContacts__c);
            }else if(a.Name=='test2'){
                System.assertEquals(0, a.ActiveContacts__c);
            }
        }
        System.assertEquals(2, acc.Size(),'expected and actual value not equal');
        list<Contact> unDeletedContacts=[select Id from Contact];
        System.assertEquals(6, unDeletedContacts.Size(),'expected and actual value not equal');
    }
}