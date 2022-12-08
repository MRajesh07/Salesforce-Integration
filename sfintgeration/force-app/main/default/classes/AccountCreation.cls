public class AccountCreation {
    public static void updateAvgCasesforAccount(list<Id>Accounts){
        Map<Id,Integer> totalDays=new Map<Id,Integer>();
        Map<Id,Integer> totalCases=new Map<Id,Integer>();
        for(Case con:[SELECT Id, CreatedDate, ClosedDate,AccountId FROM Case where IsClosed=true And AccountId IN:Accounts]){
            if(!totalCases.containsKey(con.AccountId)){
                totalCases.put(con.AccountId,0);
                totalDays.put(con.AccountId,0);
            }
            Integer cases=totalCases.get(con.AccountId);
            cases++;
            totalCases.put(con.AccountId,cases);
            Integer daysTaken=totalDays.get(con.AccountId);
            daysTaken+=con.CreatedDate.Date().daysBetween(con.ClosedDate.Date());
            totalDays.put(con.AccountId,daysTaken);
            
        }
         List<Account> acc=new List<Account>();
        for(Id i:totalCases.keySet()){
            Decimal avg=totalDays.get(i)/totalCases.get(i);
           	acc.add(new Account(Id=i,AverageCaseresolvedperday__c=avg));
        }
        update acc; 
    }
}