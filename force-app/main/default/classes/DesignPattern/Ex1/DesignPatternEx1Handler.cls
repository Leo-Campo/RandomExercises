public class DesignPatternEx1Handler {
    public DesignPatternEx1Handler() {}

    public static void validateInsert(List<Account> toBeInserted){
        DateTime now = DateTime.now();
        if (isMorning(now)){
            for (Account current : toBeInserted){
                current.addError('Illegal Time Window for Operation');
            }
        }
    }

    public static boolean isMorning(DateTime now){
        if(now.hour() >= 9 && now.hour() <=13 ){
            return true;
        }
        else return false;
    }


}
