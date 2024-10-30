import 'dart:convert';
import 'dart:io';

class ShoppingMall {
  //판매하는 상품 목록
  List<Product> products = [
    Product("a", 45000),
    Product("b", 30000),
    Product("c", 35000),
    Product("d", 38000),
    Product("e", 5000),
  ];

  // 장바구니 생성
  List<Product> shoppingCart = [];

  // 장바구니에 담은 상품들의 총 가격
  int productsTotalPrice = 0;

  //[1]상품 목록을 출력하는 메서드
  void showProducts() {
    for (var product in products) {
      print('${product.productName} / ${product.productPrice}원');
    }
  }

  //[2]상품을 장바구니에 담는 메서드
  void addToCart(productName, productNum) {
    try {
      // print("product_name, product_num > $productName, $productNum");

      // product_num의 타입을 String => int 로 변환
      int intProductNum = int.parse(productNum);
      // print("intProductNum > $intProductNum");

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

      productsTotalPrice = oneProductPrice * intProductNum;
      // print('장바구니에 담긴 총액수 ! > $productsTotalPrice');
      // print('물건 하나의 가격 ! > $oneProductPrice');

      // 장바구니에 상품의 이름과 개수 담기
      shoppingCart
          .add(Product(productName, oneProductPrice)); // 총 가격이 적용된 새로운 상품 추가
      print('장바구니에 상품이 담겼어요 !');

      // 장바구니 상품의 이름과 개수 출력
      // print('shoppingCart > ${shoppingCart}');
    } catch (error) {
      // 상품의 개수를 숫자 형태로 입력하지 않은 경우
      print("입력값이 올바르지 않아요(숫자형식으로 입력해주세요) !");
    }
  }

  //[3]장바구니에 담은 상품의 총 가격을 출력하는 메서드
  void showTotal() {
    print('3번 함수 > 장바구니에 담긴 총액수 ! > $shoppingCart');
  }
}

class Product {
  String productName = "";
  int productPrice = 0;

  Product(this.productName, this.productPrice);

//shoppingCart > [Instance of 'Product'] 이렇게 객체로 되어 있는 값을 문자열로 표현해줌!
  @override
  String toString() {
    return '$productName: $productPrice원'; // 상품 이름과 가격을 출력하도록 toString 메서드 오버라이드
  }
}

void main() {
  // print(
  //     "-------------------------------------------------------------------------------------------------------");
  // print("[1] 상품 목록 보기 / [2] 장바구니에 담기 / [3] 장바구니에 담긴 상품의 총 가격 보기 / [4] 프로그램 종료
  // print(
  //     "-------------------------------------------------------------------------------------------------------");

  while (num != "4") {
    print('😽 번호를 입력해 주세요:');
    String? num = stdin.readLineSync();
    ShoppingMall mall = ShoppingMall();

    if (num == "1") {
      mall.showProducts();
    } else if (num == "2") {
      stdout.write("상품 이름을 입력해 주세요 !");
      String? productName =
          stdin.readLineSync(encoding: Encoding.getByName('utf-8')!);

      stdout.write("상품 개수를 입력해 주세요 !");
      String? productNum =
          stdin.readLineSync(encoding: Encoding.getByName('utf-8')!);
      if (productName != null &&
          productName != "" &&
          productNum != null &&
          productNum != "") {
        mall.addToCart(productName, productNum);
      } else {
        print("상품 이름과 갯수가 입력되지 않았습니다.");
      }
    } else if (num == "3") {
      mall.showTotal();
    } else {
      print("이용해 주셔서 감사합니다 ~ 안녕히 가세요 ! ⭐");
      break;
    }
  }
}
