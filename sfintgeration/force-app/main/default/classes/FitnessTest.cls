@isTest
public class FitnessTest {
    @isTest
    public static void bmiTest(){
        Fitness test = new Fitness();
        System.assertEquals(46.08,test.bmiValue(72,1.25),'the expected value doesnot match');
    }
    @isTest
    public static void calTest(){
        Decimal d=(70/20)*60;
        Fitness test = new Fitness();
        System.assertEquals(420.0,test.calValue(70,10),'the expected value doesnot match');
    }
    @isTest
    public static void negativetest(){
      
       
		Fitness test2= new Fitness();
        System.assert(-1==test2.bmiValue(70,0),'the expected value doesnot match');
        System.assert(-1==test2.calValue(70,0),'the expected value doesnot match');
    }
}