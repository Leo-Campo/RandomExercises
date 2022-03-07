@isTest
public class AccountTriggerTest {
    @isTest
    static void AccountTriggerTestOneAccPositive(){
        // Data Creation
        List<Account> toBeInserted = TestDataFactoryTrigger.createAccounts(1);
        toBeInserted[0].Industry = 'TestIndustry';
        toBeInserted[0].BillingState = 'TestBilligState';

        // Perform Test
        Test.startTest();
        Database.insert(toBeInserted, false);
        List<Account> retrieved = 
            [SELECT Id FROM Account WHERE Industry = 'TestIndustry' OR BillingState = 'TestBillingState'];

        Test.stopTest();

        // Verify Results 
        System.assertEquals(1, retrieved.size());
    }

    


}
