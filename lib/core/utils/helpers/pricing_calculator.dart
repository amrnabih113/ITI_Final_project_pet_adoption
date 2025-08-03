class MyPricingCalculator {
  static double calculateTotalPrice(double price, String location) {
    double taxRate = getTaxRateLocation(location);
    double taxAmount = price * taxRate;

    double shippingCost = getShippingCost(location);

    return price + taxAmount + shippingCost;
  }

  static String calculateShippingCost(double price,String location) {
    double shippingCost = getShippingCost(location);

    return shippingCost.toStringAsFixed(2);
  }

  static String calculateTax(double price, String location) {
    double taxRate = getTaxRateLocation(location);
    double taxAmount = price * taxRate;

    return taxAmount.toStringAsFixed(2);
  }

static double getShippingCost(String location) {
    switch (location) {
      case 'USA':
        return 5.0;
      case 'Canada':
        return 10.0;
      default:
        return 0.0;
    }
  }

  static double getTaxRateLocation(String location) {
    switch (location) {
      case 'USA':
        return 0.07;
      case 'Canada':
        return 0.05;
      default:
        return 0.0;
    }
  }
}
