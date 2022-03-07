public with sharing class BatchProcessor implements Database.Batchable<SObject>, Database.stateful {

    public Integer numProcessed = 0;

    public Database.QueryLocator start(Database.BatchableContext bc) {
        String query = 'SELECT Id, Match_Billing_Address__c FROM Accounts';
        return Database.getQueryLocator(query);
    }

    public void execute(Database.BatchableContext bc, List<Account> scope){
        System.debug('Currently Processing ' + scope.size() + ' Accounts');
        for (Account currentAccount : scope) {
            currentAccount.Match_Billing_Address__c = true;
        }
        update scope;
        numProcessed += scope.size();
    }

    public void finish(Database.BatchableContext bc){
        System.debug('Total number of processed records: ' + numProcessed);
    }
}