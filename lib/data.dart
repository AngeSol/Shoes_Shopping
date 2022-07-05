import 'models/product_model.dart';

class Data {
  static List<ProductModel> generateProducts(){
    return [
      ProductModel(
          1,
          "assets/shoes_1.png",
          "Nike",
          "Homme",
          "men shoes",
          15000
      ),
      ProductModel(
          2,
          "assets/shoes_2.png",
          "Air - Max Pre Day",
          "Homme",
          "men shoes",
          20000
      ),
      ProductModel(
          3,
          "assets/shoes_3.png",
          "Air Max 51",
          "Homme",
          "men shoes",
          25000
      ),
      ProductModel(
          4,
          "assets/shoes_4.png",
          "Jordan",
          "Fille",
          "men shoes",
          9000
      ),
    ];
  }

  static List<ProductModel> generateCategories(){
    return [
      ProductModel(
          1,
          "assets/shoes_1.png",
          "Lifestyle",
          "Men's Shoes",
          "men shoes",
         15000
      ),
      ProductModel(
          2,
          "assets/shoes_2.png",
          "Basketball",
          "Men's Shoes",
          "men shoes",
          20000
      ),
      ProductModel(
          3,
          "assets/shoes_3.png",
          "Running",
          "Men's Shoes",
          "men shoes",
          250000
      ),
      ProductModel(
          4,
          "assets/shoes_4.png",
          "Rugby",
          "Men's Shoes",
          "men shoes",
          9000
      ),
    ];
  }
}