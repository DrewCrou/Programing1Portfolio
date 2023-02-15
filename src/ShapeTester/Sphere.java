public class Sphere{
  //Member Variables
  private double r;

  //Constructor
  public Sphere(){
    r = 0;
  }

  //Set Methods
  public void setR(double r){
    this.r = r;
  }


  //Calculation Methods
  public double calcVol(){
    double vol = 4/3 * 3.14 * (Math. pow(r,3));
    return vol;
  }

  //Surface Area Calculation
  public double calcSurfArea(){
    double sa = 4 * 3.14 * (Math. pow(r,2));
    return sa;
  }

}