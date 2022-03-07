@isTest
public class DesignPatternEx1Test {
    @isTest
    public static void isMorningTestPositive(){
        DateTime currentTime = new DateTime(2022, 2, 23, 10, 0, 0);
        boolean result = DesignPatternEx1Handler.isMorning(currentTime);
        System.assert(result == true);
    }
    
    @isTest
    public static void isMorningTestNegative(){
        DateTime currentTime = new DateTime(2022, 2, 23, 14, 0, 0);
        boolean result = DesignPatternEx1Handler.isMorning(currentTime);
        System.assert(result == false);
    }

    
}
