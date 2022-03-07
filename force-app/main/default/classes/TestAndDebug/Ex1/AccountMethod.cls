public with sharing class AccountMethod {
    public AccountMethod() {}

    public static void ComputeTotalAmount(List<Account> accounts){
        Map<Id, Decimal> accOppMap = new Map<Id, Decimal>();

        List<Id> ids = new List<Id>();
        for (Account current : accounts){
            ids.add(current.Id);
            accOppMap.put(current.id, 0.0);
        }

        List<Opportunity> opps =  [SELECT Id, Amount, StageName, AccountId FROM opportunity WHERE AccountId in :ids and StageName not in ('Closed Won', 'Closed Lost')];

        for(Opportunity opp: opps){
            Decimal accumulator = accOppMap.get(opp.AccountId);
            accumulator += opp.Amount;
            accOppMap.put(opp.AccountId, accumulator);
        }

        for(Account current : accounts){
            Decimal totalAmount = accOppMap.get(current.Id);
            if (totalAmount == 0.0) {
                current.OpenOppAmount__c = null;
            }
            else {
                current.OpenOppAmount__c = totalAmount;
            }
        }
        
        update accounts;
    }
}
