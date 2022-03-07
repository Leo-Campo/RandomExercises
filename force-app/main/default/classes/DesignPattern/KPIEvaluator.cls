public with sharing class KPIEvaluator {

    public class KPIException extends Exception {}

    public class ContactDAO {
    
        public List <Contact> getContactFromAccountId (String AccountId){
            List <Contact> contatti = [SELECT AccountId, Value__c 
                                       FROM Contact WHERE AccountId = :AccountId];
            return contatti;
        }
    }

    private ContactDAO queryMaker;
    private Integer threshold;

    public KPIEvaluator() {
        this.queryMaker = new ContactDao();
    }

    public KPIEvaluator(Integer threshold){
        this.queryMaker = new ContactDao();
        this.threshold = threshold;
    }

    public void setThreshold(Integer threshold){
        this.threshold = threshold;
    }

    public void evaluate(String accountId){
        List<Contact> contacts = this.queryMaker.getContactFromAccountId(accountId);
        Decimal totalValue = 0;
        Integer valuableContactNum = 0;
        
        List<Account> retrievedAccounts = [SELECT id, Total_Value__c, Num_Valuable_Contacts__c, Valuable_Account__c 
        FROM Account WHERE id = :accountId];

        if (retrievedAccounts.isEmpty()){
            throw new KPIException('No Account matches the given ID');
        }
        Account targetAccount = retrievedAccounts[0];

        for(Contact cont : contacts) {
            if (cont.Value__c < 0) {
                throw new KPIException('Zero-Valued Contact encountered during evaluation');
            }
            if (cont.Value__c > this.threshold){
                valuableContactNum += 1;
            }
            totalValue += cont.Value__c;
        }

        targetAccount.Total_Value__c = totalValue;
        targetAccount.Num_Valuable_Contacts__c = valuableContactNum;
        targetAccount.Valuable_Account__c = (valuableContactNum > contacts.size() / 2);

        update targetAccount;
    }

    public void evaluate(String accountId, Integer threshold){
        this.setThreshold(threshold);
        this.evaluate(accountId);
    }
    
}
