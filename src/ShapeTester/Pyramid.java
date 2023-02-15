public class Pyramid{
  //Member Variables
  private double l;
  private double w;
  private double h;

  //Constructor
  public Pyramid(){
    l = 0;
    w = 0;
    h = 0;
  }

  //Set Methods
  public void setL(double l){
    this.l = l;
  }
  public void setW(double w){
    this.w = w;
  }
  public void setH(double h){
    this.h = h;
  }

  //Calculation Methods
  public double calcVol(){
    double vol = (l * w * h)/3;
    return vol;
  }

  //Surface Area Calculation
  public double calcSurfArea(){
    double sa = (l * w) + l * (Math.sqrt(Math.pow(w/2, 2)) + 
    (Math.pow(h, 2))) + w * (Math.sqrt(Math.pow(l/2, 2)) + 
    (Math.pow(h, 2)));
    return sa;
  }

}