import 'package:e_commerce_app/data/model/Response/ProductResponse/ProductSourceResponse.dart';

abstract class ProductContract{

Future<ProductSourceResponse?>  getAllProduct();
}