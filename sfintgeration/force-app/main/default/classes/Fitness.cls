public class Fitness {
    public decimal bmiValue(decimal bw,decimal bh){
        if(bh<=0 || bw<=0){
           return -1;
        }
                   return bw/(bh*bh);

    }
    public decimal calValue(decimal d,decimal t){
       if(t<=0||d<=0){
           return -1;
        }
       
              return (d/t)*60;
      
       
    }
}