trigger DesignPatternEx1 on Account (before insert) {
    List<Account> toBeInserted = Trigger.new;
    DesignPatternEx1Handler.validateInsert(toBeInserted);
}
