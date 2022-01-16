
class Calculator{
  double? weight;
  double? price;

  Calculator(){
  }

  double getweight(double length, double girth){
    weight = (girth/100) * (girth/100) * (length/100) * 69.3;
    return weight!;
  }

}