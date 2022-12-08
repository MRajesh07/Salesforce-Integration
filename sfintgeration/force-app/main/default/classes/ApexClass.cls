public class ApexClass {
     private list<InnerClass> cus = new list<InnerClass>();
    public void show(String cusName,String email, Long phoneNumber,Integer age){
       InnerClass addCus= new InnerClass(cusName,email,phoneNumber,age);
       cus.add(addCus);
    }
    public void print(){
        for(Innerclass i:cus){
            system.debug('CustomerName :'+i.cusName  + 'CustomerEmail :'+i.email  + 'CustomerphoneNumber :'+i.phoneNumber  + 'Customerage :'+i.age );
        }
    }
    public class InnerClass{
        public String cusName;
        public String email;
        public Long phoneNumber;
        public Integer age;
         public InnerClass(String cusName,String email, Long phoneNumber,Integer age){
            this.cusName=cusName;
            this.email=email;
            this.phoneNumber=phoneNumber;
            this.age=age;
        }
    }
}