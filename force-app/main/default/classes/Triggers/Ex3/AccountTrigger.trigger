trigger AccountTrigger on Account (after insert) {

    if(Trigger.isInsert && Trigger.isAfter){
        List<Id> accountIds = new List<Id>();
        for (Account current : Trigger.new){
            if(current.Match_Billing_Address__c){
                accountIds.add(current.Id);
            }
        }
    }
    if (! accountIds.isEmpty()){
        AccountTriggerHandler.futureUpdate(accountIds);
    }
}