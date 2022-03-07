trigger AccountTrigger on Account (before insert, before update) {
    for (Account current : Trigger.new){
        if (current.Match_Billing_Address__c) {
            if(Trigger.isInsert){
                current.ShippingPostalCode = current.BillingPostalCode;
            }
            if(Trigger.isUpdate){
               if(Trigger.oldMap.get(current.Id).BillingPostalCode != current.BillingPostalCode){
                   current.ShippingPostalCode = current.BillingPostalCode;
               }
            }
        }
    }
}