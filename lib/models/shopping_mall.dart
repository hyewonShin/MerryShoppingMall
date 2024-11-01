import 'dart:convert';
import 'dart:io';

import 'package:shoppingmall/models/product.dart';
import 'package:intl/intl.dart';

class ShoppingMall {
  //판매하는 상품 목록
  List<Product> products = [
    Product("a", 45000),
    Product("b", 30000),
    Product("c", 35000),
    Product("d", 38000),
    Product("e", 5000),
  ];

  // 장바구니에 담은 상품들의 총 가격
  int productsTotalPrice = 0;

  // 장바구니 내부에 상품이름 리스트
  List<String> shoppingCartItem = [];

  //[1]상품 목록을 출력하는 메서드
  void showProducts() {
    try {
      for (var product in products) {
        print('${product.productName} / ${product.productPrice}원');
      }
    } catch (error) {
      print('showProducts error > $error');
    }
  }

  //[2]상품을 장바구니에 담는 메서드
  void addToCart() {
    stdout.write("상품 이름을 입력해 주세요 ! ");
    String productName =
        stdin.readLineSync(encoding: Encoding.getByName('utf-8')!) ?? "";

    stdout.write("상품 개수를 입력해 주세요 ! ");
    String productNum =
        stdin.readLineSync(encoding: Encoding.getByName('utf-8')!) ?? "";

    try {
      // product_num의 타입을 String => int 로 변환
      int intProductNum = int.parse(productNum);

      // Product 클래스는 사용자 지정 정의 타입이기 때문에, Dart에서는 Product 객체를 String,int 등의 일반적인 타입의 변수에 할당할 수 없다.
      // dart는 정적 타입 언어이기 때문에, 특정 타입으로 선언된 변수에는 해당 타입의 데이터만 할당할 수 있도록 강제한다.
      // 따라서 product.firstWhere() 로 찾은 결과가 Product 타입인 경우, 이를 받을 변수도 반드시 Product 타입이어야 한다.
      Product product =
          products.firstWhere((product) => product.productName == productName);

      // 입력한 상품의 개수가 0 이하의 수인 경우
      if (intProductNum <= 0) {
        print("0개보다 많은 개수의 상품만 담을 수 있어요 !");
      } else {
        // 장바구니에 담은 상품 하나의 가격
        var oneProductPrice = product.productPrice;

        // 장바구니에 담은 상품들의 총 가격을 produecsTotalPrice 변수에 담아주기
        productsTotalPrice += oneProductPrice * intProductNum;

        // 장바구니에 상품의 이름과 개수 담기
        shoppingCartItem.add(product.productName); // 총 가격이 적용된 새로운 상품 추가
        print('🛒 장바구니에 상품이 담겼어요 !');
      }
    } on FormatException catch (error) {
      // 상품의 개수를 숫자 형태로 입력하지 않은 경우
      print("입력값이 올바르지 않아요! (상품의 개수를 숫자 형태로 입력해주세요)");
    } catch (error) {
      print('입력값이 올바르지 않아요! (존재하지 않는 상품입니다) $error');
    }
  }

  //[3]장바구니에 담은 상품들의 목록과 총 가격을 출력하는 메서드
  void showTotal() {
    try {
      if (productsTotalPrice != 0) {
        var formatTotalPrice = NumberFormat('###,###,###,###');
        print(
            '🛒 장바구니에 ${shoppingCartItem.join(', ')}가 담겨있네요. 총 ${formatTotalPrice.format(productsTotalPrice)} 원 입니다!');
      } else {
        print('장바구니에 담긴 상품이 없습니다.');
      }
    } catch (error) {
      print('showTotal error > $error');
    }
  }

  //[6]장바구니를 초기화할 수 있는 기능
  void clearShoppingCart() {
    try {
      if (productsTotalPrice != 0) {
        productsTotalPrice = 0;
        print("장바구니를 초기화합니다.");
      } else {
        print('이미 장바구니가 비어있습니다.');
      }
    } catch (error) {
      print('clearShoppingCart error > $error');
    }
  }
}
