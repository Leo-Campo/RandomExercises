public without sharing class SearchAccount {

    @AuraEnabled(cacheable=true)
    public static Account searchForAccount(String name){
        try {
            List<Account> results = [
                SELECT Id, Name FROM Account WHERE Name = :name LIMIT 1
            ];
            if (results.size() == 0){
                return null;
            }
            else {
                return results[0];
            }
        } catch (Exception e) {
            throw new AuraHandledException(e.getMessage());
        }
    }
}
