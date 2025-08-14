import 'dart:convert';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:e_commerce_app/data/model/Request/LogInRequest.dart';
import 'package:e_commerce_app/data/model/Response/GetallCategory/BrandSourceResponse.dart';
import 'package:e_commerce_app/data/model/Response/GetallCategory/CategoryResponse.dart';
import 'package:e_commerce_app/data/model/Response/LoginResponse/LoginResponse.dart';
import 'package:e_commerce_app/data/model/Response/ProductResponse/ProductSourceResponse.dart';
import 'package:http/http.dart' as http;
import '../model/Request/RequestRegisterScreen.dart';
import '../model/Response/RegisterResponse/RegisterResponse.dart';
import 'api_const.dart';

class ApiManger {
  ApiManger._();

  static ApiManger? _instance;

  static ApiManger getApiInstance() {
    _instance ??= ApiManger._();
    return _instance!;
  }

  Future<RegisterResponse?> register(
    String name,
    String email,
    String password,
    String rePassword,
    String phone,
  ) async {
    final connectivityResult = await Connectivity().checkConnectivity();

    if (connectivityResult == ConnectivityResult.mobile ||
        connectivityResult == ConnectivityResult.wifi) {
      Uri url = Uri.https(ApiConst.baseUrl, ApiConst.registerUrl);

      var requestBody = RequestRegisterScreen(
        name: name,
        email: email,
        password: password,
        rePassword: rePassword,
        phone: phone,
      );

      var response = await http.post(url, body: requestBody.toJson());

      var registerResponse =
          RegisterResponse.fromJson(json.decode(response.body));

      if (response.statusCode >= 200 && response.statusCode < 300) {
        return registerResponse;
      } else {
        return registerResponse;
      }
    } else {
      return RegisterResponse(message: 'Please check internet connection');
    }
  }

  Future<LoginResponse> Login(String email, String password) async {
    final connectivityResult = await Connectivity().checkConnectivity();
    if (connectivityResult == ConnectivityResult.mobile ||
        connectivityResult == ConnectivityResult.wifi) {
      Uri url = Uri.https(ApiConst.baseUrl, ApiConst.loginUrl);

      var requestBody = LogInRequest(
        password: password,
        email: email,
      );

      var response = await http.post(
        url,
        body: requestBody.toJson(),
      );

      var loginResponse = LoginResponse.fromJson(json.decode(response.body));

      if (response.statusCode >= 200 && response.statusCode < 300) {
        return loginResponse;
      } else {
        return loginResponse;
      }
    } else {
      return LoginResponse(message: 'Please check internet connection');
    }
  }

  Future<CategoryResponse?> getAllCategory({int page = 1,}) async {
    final connectivityResult = await Connectivity().checkConnectivity();
    if (connectivityResult == ConnectivityResult.mobile ||
        connectivityResult == ConnectivityResult.wifi) {
      Uri url = Uri.https(ApiConst.baseUrl, ApiConst.categoryUrl);
      var response = await http.get(url);
      var bodyString = response.body;
      var json = jsonDecode(bodyString);
      return CategoryResponse.fromJson(json);
    } else {
      print('No internet connection');
      return null;
    }
  }

  Future<BrandSourceResponse?> getAllBrands({int page = 1,}) async {
    /*
https://ecommerce.routemisr.com/api/v1/brands
     */
    final connectivityResult = await Connectivity().checkConnectivity();
    if (connectivityResult == ConnectivityResult.mobile ||
        connectivityResult == ConnectivityResult.wifi) {
      Uri url = Uri.http(ApiConst.baseUrl, ApiConst.brandsUrl,{
        'page':page.toString()

      });
      var response = await http.get(url);
      var bodyString = response.body;
      var json = jsonDecode(bodyString);
      return BrandSourceResponse.fromJson(json);
    } else {
      print('No internet connection');
      return null;
    }
  }

  ///Search for Brand
  Future<BrandSourceResponse?> searchBrand(String name) async {
    final connectivityResult = await Connectivity().checkConnectivity();
    if (connectivityResult == ConnectivityResult.mobile ||
        connectivityResult == ConnectivityResult.wifi) {
      Uri url = Uri.https(ApiConst.baseUrl, ApiConst.brandsUrl);

      var response = await http.get(url);
      var bodyString = response.body;
      var jsonMap = jsonDecode(bodyString);
      var fullResponse = BrandSourceResponse.fromJson(jsonMap);

      fullResponse.data = fullResponse.data
          ?.where((brand) =>
              brand.name?.toLowerCase().contains(name.toLowerCase()) ?? false)
          .toList();

      return fullResponse;
    } else {
      print('No internet connection');
      return null;
    }
  }

  Future<ProductSourceResponse?> getAllProduct({int page = 1,}) async {
    /*
 https://ecommerce.routemisr.com/api/v1/products
  */
    Uri url = Uri.https(ApiConst.baseUrl, ApiConst.productUrl,{
      'page':page.toString()
    });
    var response = await http.get(url);
    var bodyString = response.body;
    var json = jsonDecode(bodyString);
    return ProductSourceResponse.fromJson(json);
  }

  ///Search for product
  Future<ProductSourceResponse?> searchProduct(String title) async {
    final connectivityResult = await Connectivity().checkConnectivity();
    if (connectivityResult == ConnectivityResult.mobile ||
        connectivityResult == ConnectivityResult.wifi) {
      Uri url = Uri.https(ApiConst.baseUrl, ApiConst.productUrl, {
        'title': title,
      });
      var response = await http.get(url);

      var bodyString = response.body;

      var json = jsonDecode(bodyString);
      var fullResponse = ProductSourceResponse.fromJson(json);
      fullResponse.data = fullResponse.data
          ?.where((product) =>
              product.title?.toLowerCase().contains(title.toLowerCase()) ??
              false)
          .toList();

      return fullResponse;
    } else {
      print('No internet connection');
      return null;
    }
  }
}
