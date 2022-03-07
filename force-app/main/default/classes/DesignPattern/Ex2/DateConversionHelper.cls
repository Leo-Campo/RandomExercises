public class DateConversionHelper {
    public static DateTime convertToItalianTime(Datetime utc){
        Integer currentMonth = utc.month();
        if (currentMonth > 3 && currentMonth < 11) {
            Datetime toReturn = utc.addHours(2);
            return toReturn;
        }
        else {
            Datetime toReturn = utc.addHours(1);
            return toReturn;
        }
    }
}
