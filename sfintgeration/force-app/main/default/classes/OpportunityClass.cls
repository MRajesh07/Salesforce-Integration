public class OpportunityClass {
    Public Static void updateProfile(List<id> ids){
        List<Opportunity> Opp=[select Id,Amount from Opportunity where ID IN:ids];
        for(Opportunity i:Opp){
            
            if(i.Amount>50000){
                i.Profile__c='High';
            }else if(i.Amount>10000 && i.Amount<=50000){
               i.Profile__c='Medium';
            }else if(i.Amount<10000){
                i.Profile__c='Low';
            }else if(i.Amount==Null){
                i.Profile__c='Low';
            }
           
        }
       Update Opp;
    }

}