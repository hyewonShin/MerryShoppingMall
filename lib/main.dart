import 'dart:io';
import 'dart:convert';
import 'package:shoppingmall/models/shopping_mall.dart';
import 'package:shoppingmall/utils/guid_num.dart';

void main() {
  try {
    ShoppingMall mall = ShoppingMall();
    String? num;

    // while문 제어하는 변수
    bool whileloop = true;

    while (whileloop) {
      guideNum();
      stdout.write('😽 번호를 입력해 주세요:');
      num = stdin.readLineSync();
      print('🐱 입력하신 번호는 [ $num ] 입니다.');

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
      } else if (num == "4") {
        stdout.write("정말 종료하시겠습니까? 5번을 입력하면 종료됩니다.");
        num = stdin.readLineSync();
        if (num == "5") {
          whileloop = false;
          print("이용해 주셔서 감사합니다 ~ 안녕히 가세요 ! ⭐");
          break;
        } else {
          print('종료하지 않습니다.');
        }
      } else if (num == "6") {
        mall.clearShoppingCart();
      } else {
        print("지원하지 않는 기능입니다 ! 다시 시도해 주세요 ..");
      }
    }
  } catch (error) {
    print('error message > $error');
  }
}
