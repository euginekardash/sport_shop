import 'package:flutter/material.dart';
import 'dart:core';

class MyPricingCalculator{
  static double calculateTotalPrice(double productPrice, String location){
    double taxRate = getTaxRateForLocation(location);
    double taxAmount = productPrice * taxRate;

    double shippingCost = getShoppingCost(location);

    double totalPrice = productPrice + taxAmount + shippingCost;
    return totalPrice;
  }

  //shipping cost
  static String calculateShippingCost(double productPrice, String location){
    double shippingCost = getShoppingCost(location);
    return shippingCost.toStringAsFixed(2);
  }

  //calc tax
  static String calculateTax(double productPrice, String location){
    double taxRate = getTaxRateForLocation(location);
    double taxAmount = productPrice * taxRate;
    return taxAmount.toStringAsFixed(2);
  }

  static double getTaxRateForLocation(String location){
    return 0.10; // 10% но можно использовать какоето API
  }

  static double getShoppingCost(String location){
    return 5.0; //5$ но опять же можно использовать апи
  }
}