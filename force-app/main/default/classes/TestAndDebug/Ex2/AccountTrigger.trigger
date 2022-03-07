trigger AccountTrigger on Account (before insert) {
    if(Trigger.isBefore && Trigger.isInsert){
        List<Account> accounts = Trigger.new;
        for(Account current : accounts) {
            if(current.Industry == null || current.BillingState == null){
                current.addError('Either Industry or BillingState field must be filled');
            }
        }
    }
}