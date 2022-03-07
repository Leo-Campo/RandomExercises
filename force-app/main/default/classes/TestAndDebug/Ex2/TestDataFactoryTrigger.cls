public class TestDataFactoryTrigger {
    public static List<Account> createAccounts(Integer numAccounts){
        List<Account> toBeInserted = new List<Account>();
        for(Integer i = 0; i < numAccounts; i++){
            toBeInserted.add(
                new Account(
                    Name = 'AccountTriggerTest',
                    AccountNumber = String.valueOf(i) + '0'.repeat(8- String.valueOf(i).length())
                )
            );
        }
        return toBeInserted;
    }
}
