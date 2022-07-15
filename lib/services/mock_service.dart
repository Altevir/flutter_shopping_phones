import 'package:flutter_shopping_phones/models/phone.dart';

class MockService {
  static List<Phone> listPhones = [
    Phone(
      image: 'pProduct1.png',
      name: 'Oneplus 8T',
      classification: 5,
      price: 349.00,
    ),
    Phone(
      image: 'pProduct2.png',
      name: 'OnePlus Nord N20',
      classification: 5,
      price: 349.00,
    ),
    Phone(
      image: 'pProduct3.png',
      name: 'OnePlus Nord CE 2 5G',
      classification: 5,
      price: 449.00,
    )
  ];
}
