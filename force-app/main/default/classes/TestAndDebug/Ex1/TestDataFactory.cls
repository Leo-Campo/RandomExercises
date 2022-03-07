public with sharing class TestDataFactory {
    public static void createAccountWithOpportunities(Integer numOpportunities, Decimal amount){

        List<Opportunity> opportunities = new List<Opportunity>();
        Account newAccount = new Account(Name = 'TestAccount', AccountNumber = '00000000');
        insert newAccount;

        for(Integer i = 0; i < numOpportunities; i++){
            opportunities.add(new Opportunity(
                Name = 'TotalAmountTestOpportuinity' + String.valueOf(i),
                StageName = 'Prospecting',
                CloseDate = date.parse('8/02/2022'),
                AccountId = newAccount.Id,
                Amount = amount
            ));
        }
        insert opportunities;

    }

    public static List<Account> createAccountWithOpportunitiesReturns(Integer numOpportunities, Decimal amount){

        List<Opportunity> opportunities = new List<Opportunity>();
        Account newAccount = new Account(Name = 'TestAccount', AccountNumber = '00000000');
        insert newAccount;

        for(Integer i = 0; i < numOpportunities; i++){
            opportunities.add(new Opportunity(
                Name = 'TotalAmountTestOpportuinity' + String.valueOf(i),
                StageName = 'Prospecting',
                CloseDate = date.parse('8/02/2022'),
                AccountId = newAccount.Id,
                Amount = amount
            ));
        }
        insert opportunities;
        List<Account> toReturn = new List<Account>();
        toReturn.add(newAccount);
        return toReturn;
    }

    public static void createAccountsWithOpportunities(Integer numAccounts, Integer numOpportunities, Decimal amount){
        List<Account> toInsert = new List<Account>();
        for(Integer i = 0; i < numAccounts; i++){
            toInsert.add(
                new Account(Name = 'TestAccount'+String.valueOf(i), AccountNumber = String.valueOf(i) + '0'.repeat(8-String.valueOf(i).length()))
            );
        }
        insert toInsert;
        List<Opportunity> opportunities = new List<Opportunity>();
        for(Account current : toInsert){
            Id currentId = current.Id;
            for(Integer i = 0; i < numOpportunities; i++){
                opportunities.add(
                    new Opportunity(
                        Name = 'TotalAmountTestOpportuinity' + String.valueOf(i),
                        AccountId = currentId,
                        StageName = 'Prospecting',
                        CloseDate = date.parse('8/02/2022'),
                        Amount = amount
                    )
                );
            }
        }
        insert opportunities;
    }

    public static List<Account> createAccountsWithOpportunitiesReturns(Integer numAccounts, Integer numOpportunities, Decimal amount){
        List<Account> toInsert = new List<Account>();
        for(Integer i = 0; i < numAccounts; i++){
            toInsert.add(
                new Account(Name = 'TestAccount'+String.valueOf(i), AccountNumber = String.valueOf(i) + + '0'.repeat(8-String.valueOf(i).length()))
            );
        }
        insert toInsert;
        List<Opportunity> opportunities = new List<Opportunity>();
        for(Account current : toInsert){
            Id currentId = current.Id;
            for(Integer i = 0; i < numOpportunities; i++){
                opportunities.add(
                    new Opportunity(
                        Name = 'TotalAmountTestOpportuinity' + String.valueOf(i),
                        StageName = 'Prospecting',
                        CloseDate = date.parse('8/02/2022'),
                        AccountId = currentId,
                        Amount = amount
                    )
                );
            }
        }
        insert opportunities;
        return toInsert;
    }
}
