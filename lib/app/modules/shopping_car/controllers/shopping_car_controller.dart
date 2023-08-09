import 'package:get/get.dart';

class ShoppingCarController extends GetxController {
  final shoppingCarList = [
    {
      "image":"https://zimg.qdocti.com/3ece890d877b123aad3ebe5841252f87",
      "name":"Obardans",
      "describe":"Lorem ipsum dolor sit ",
      "price":18,
      "number":"1"
    },
    {
      "image":"https://zimg.qdocti.com/3ece890d877b123aad3ebe5841252f87",
      "name":"Obardans",
      "describe":"Lorem ipsum dolor sit ",
      "price":18,
      "number":"1"
    },
    {
      "image":"https://zimg.qdocti.com/3ece890d877b123aad3ebe5841252f87",
      "name":"Obardans",
      "describe":"Lorem ipsum dolor sit ",
      "price":18,
      "number":"1"
    },
    {
      "image":"https://zimg.qdocti.com/3ece890d877b123aad3ebe5841252f87",
      "name":"Obardans",
      "describe":"Lorem ipsum dolor sit ",
      "price":18,
      "number":"1"
    },
    {
      "image":"https://zimg.qdocti.com/3ece890d877b123aad3ebe5841252f87",
      "name":"Obardans",
      "describe":"Lorem ipsum dolor sit ",
      "price":18,
      "number":"1"
    },
    {
      "image":"https://zimg.qdocti.com/3ece890d877b123aad3ebe5841252f87",
      "name":"Obardans",
      "describe":"Lorem ipsum dolor sit ",
      "price":18,
      "number":"1"
    },
    {
      "image":"https://zimg.qdocti.com/3ece890d877b123aad3ebe5841252f87",
      "name":"Obardans",
      "describe":"Lorem ipsum dolor sit ",
      "price":18,
      "number":"1"
    },
    {
      "image":"https://zimg.qdocti.com/3ece890d877b123aad3ebe5841252f87",
      "name":"Obardans",
      "describe":"Lorem ipsum dolor sit ",
      "price":18,
      "number":"1"
    }
  ].obs;
  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }


  void increaseNumber(int index) {
    var number = int.parse(shoppingCarList[index]["number"] as String);
    shoppingCarList[index]["number"] = (number + 1).toString();
    shoppingCarList.refresh();
  }

  void unIncreaseNumber(int index) {
    print(shoppingCarList[index]["number"].runtimeType);
    var number = int.parse(shoppingCarList[index]["number"] as String);
    if(number <= 0){
      return;
    }
    shoppingCarList[index]["number"] = (number - 1).toString();
    shoppingCarList.refresh();
  }

  void deleteShoppingCarItem(int index){
    print(index);
    shoppingCarList.removeAt(index);
    shoppingCarList.refresh();
    print(shoppingCarList.length);
  }
}
