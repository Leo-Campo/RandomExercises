@isTest
public class AccountMethodTest {

    @isTest
    static void ComputeTotalAmountTestOneAccountOneOpp(){
        // Phase 1
        // Create custom data to test functionality on
        
        List<Account> inserted = TestDataFactory.createAccountWithOpportunitiesReturns(1, 10);

        // Phase 2
        // Invoke Test.startTest() and call the newly developed method, then use Test.stopTest()
        Test.startTest();
        AccountMethod.ComputeTotalAmount(inserted);
        Test.stopTest();

        // Phase 3
        // Using Assert, AssertEquals etc confirm that the resulting value are those expected
        Decimal totalAmount = 10.0;
        System.assertEquals(totalAmount, inserted[0].OpenOppAmount__c);
    }

    @isTest
    static void ComputeTotalAmountTestOneAccountMoreOpp(){
        List<Account> inserted = TestDataFactory.createAccountWithOpportunitiesReturns(10, 10);

        Test.startTest();
        AccountMethod.ComputeTotalAmount(inserted);
        Test.stopTest();

        Decimal totalAmount = 100.0;
        System.assertEquals(totalAmount, inserted[0].OpenOppAmount__c);

    }

    @isTest
    static void ComputeTotalAmountTestOneAccountZeroOpp(){
        List<Account> inserted = TestDataFactory.createAccountWithOpportunitiesReturns(0, 10);

        Test.startTest();
        AccountMethod.ComputeTotalAmount(inserted);
        Test.stopTest();

        Decimal totalAmount = null;
        System.assertEquals(totalAmount, inserted[0].OpenOppAmount__c);
    }
    @isTest
    static void ComputeTotalAmountTestMoreAccountMoreOpp(){
        List<Account> inserted = TestDataFactory.createAccountsWithOpportunitiesReturns(200, 20, 1);

        Test.startTest();
        AccountMethod.ComputeTotalAmount(inserted);
        Test.stopTest();

        for(Account current : inserted){
            System.assertEquals(20, current.OpenOppAmount__c);
        }
    }

    @isTest
    static void ComputeTotalAmountTestMoreAccountZeroOpp(){
        List<Account> inserted = TestDataFactory.createAccountsWithOpportunitiesReturns(200, 0, 1);

        Test.startTest();
        AccountMethod.ComputeTotalAmount(inserted);
        Test.stopTest();

        for(Account current : inserted){
            System.assertEquals(null, current.OpenOppAmount__c);
        }
    }
}
