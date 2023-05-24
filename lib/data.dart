import 'package:flutter/material.dart';
class Data{
  // ignore: prefer_typing_uninitialized_variables
  //Practically these values would be stored in a database preferably firebase
  static var itemselected;
  static List favourites=[];
  static  var snacks=["Bánh Cupcake","Bánh rán Dorayaki","Bánh Muffin","Bánh Pancake","Bánh Tiramisu","Bánh Gato","Bánh Cheesecake","Bánh Donut","Bánh mì ngọt","Bánh Macaron Pháp","Bánh Táo Mỹ","Bánh Mochi"];
  static List fav=[Colors.white,Colors.white,Colors.white,Colors.white,Colors.white,Colors.white,Colors.white,Colors.white,Colors.white,Colors.white,Colors.white,Colors.white,Colors.white,Colors.white];
  static var prices=["10","20","50","100","40","150","70","100","30","90","25","105"];
  static var description=["Thưởng thức những chiếc bánh quy sô cô la mới nướng của chúng tôi giòn bên ngoài và dai bên trong","Trải nghiệm hương vị trái cây bùng nổ với kẹo mút thủ công của chúng tôi","Thưởng thức bỏng ngô hảo hạng của chúng tôi, thứ hoàn hảo để thỏa mãn cơn thèm ăn nhẹ của bạn","Thưởng thức những chiếc bánh mới nướng hoàn hảo cho bất kỳ dịp nào","Đắm mình trong chiếc Chevda tự chế của chúng tôi, hoàn hảo cho mọi dịp","Thưởng thức sô cô la cao cấp hoàn hảo cho bất kỳ dịp nào của chúng tôi","Một món ăn nhẹ cổ điển hoàn hảo cho bất kỳ dịp nào","Một món ăn nhẹ giòn và giòn hoàn hảo để thỏa mãn cơn thèm của bạn","Một món ăn mềm và ngọt hoàn hảo cho bữa sáng hoặc món tráng miệng","Một món ăn nhẹ nướng và giòn hoàn hảo cho bất kỳ thời điểm nào trong ngày","Một món ăn nhẹ ngọt ngào và mềm mại, hoàn hảo cho bữa sáng hoặc món tráng miệng.","Một loại kẹo trái cây và dai hoàn hảo để thỏa mãn sở thích hảo ngọt của bạn"];
  static var total;
  static String accessToken="jfzjnceggvxtjtpj";
}