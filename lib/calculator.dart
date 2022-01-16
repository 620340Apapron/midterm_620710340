class Calculator {
  double? weight;
  double? price;
  Calculator() {}

  double getweight(double length, double girth) {
    weight = (girth / 100) * (girth / 100) * (length / 100) * 69.3;
    return weight!;
  }

  double getlow(double weight) {
    price = (weight - 3) * 112.50;
    return price!;
  }
  double gethigh(double weight) {
    price = (weight + 3) * 112.50;
    return price!;
  }
}
