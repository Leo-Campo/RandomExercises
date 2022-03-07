public class AccountTriggerHandler {
    @future
    public static void futureUpdate(List<Id> accountIds){
        List<Account> accounts = [SELECT name FROM Account WHERE id IN :accountIds];
        for(Account currentAccount : accounts){
            currentAccount.Name = 'Future Name';
        }
        update accounts;
    }
}
