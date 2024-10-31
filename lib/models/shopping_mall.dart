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

  // 장바구니 생성
  List<Product> shoppingCart = [];
  // 장바구니 내부에 상품이름 리스트
  List<String> shoppinCartItem = [];

  //[1]상품 목록을 출력하는 메서드
  void showProducts() {
    try {
      for (var product in products) {
        print('${product.productName} / ${product.productPrice}원');
      }
    } catch (error) {
      print('error message > $error');
    }
  }

  //[2]상품을 장바구니에 담는 메서드
  void addToCart(productName, productNum) {
    try {
      // product_num의 타입을 String => int 로 변환
      int intProductNum = int.parse(productNum);

      // 상품 목록에 없는 상품의 이름을 입력한 경우
      if (!products.any((product) => product.productName == productName)) {
        print("입력값이 올바르지 않아요(목록에 없는 상품이에요) !");
      }

      // 입력한 상품의 개수가 0 이하의 수인 경우
      if (intProductNum <= 0) {
        print("0개보다 많은 개수의 상품만 담을 수 있어요 !");
      }

      // 장바구니에 담은 상품들의 총 가격을 produecsTotalPrice 변수에 담아주기
      var oneProductPrice = products
          .firstWhere((product) => product.productName == productName)
          .productPrice;

      productsTotalPrice += oneProductPrice * intProductNum;

      // 장바구니에 상품의 이름과 개수 담기
      shoppingCart
          .add(Product(productName, oneProductPrice)); // 총 가격이 적용된 새로운 상품 추가
      print('🛒 장바구니에 상품이 담겼어요 !');
    } on FormatException catch (error) {
      // 상품의 개수를 숫자 형태로 입력하지 않은 경우
      print("입력값이 올바르지 않아요(상품의 개수를 숫자 형식으로 입력해주세요) ! $error");
    } catch (error) {
      print(error);
    }
  }

  //[3]장바구니에 담은 상품들의 목록과 총 가격을 출력하는 메서드
  void showTotal() {
    try {
      if (productsTotalPrice != 0) {
        for (var item in shoppingCart) {
          shoppinCartItem.add(item.productName);
        }
        var formatTotalPrice = NumberFormat('###,###,###,###');
        print(
            '🛒 장바구니에 ${shoppinCartItem.join(', ')}가 담겨있네요. 총 ${formatTotalPrice.format(productsTotalPrice)} 원 입니다!');
      } else {
        print('장바구니에 담긴 상품이 없습니다.');
      }
    } catch (error) {
      print('error message > $error');
    }
  }

  //[6]장바구니를 초기화할 수 있는 기능
  void clearShoppingCart() {
    try {
      if (productsTotalPrice != 0) {
        shoppingCart.clear();
        productsTotalPrice = 0;
        print("장바구니를 초기화합니다.");
      } else {
        print('이미 장바구니가 비어있습니다.');
      }
    } catch (error) {
      print('error message > $error');
    }
  }
}
