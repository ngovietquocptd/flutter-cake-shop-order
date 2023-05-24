//This is the delivery form where the package is to be sent
//it will be a form
// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:mailer/mailer.dart';
import 'package:mailer/smtp_server.dart';
import 'package:mailer/smtp_server/gmail.dart';
import 'package:online_ordering_app/data.dart';

class Checkout extends StatefulWidget {
  const Checkout({super.key});

  @override
  State<Checkout> createState() => _CheckoutState();
}

class _CheckoutState extends State<Checkout> {
  var formkey = GlobalKey<FormState>();
  var name = TextEditingController();
  var shipping = TextEditingController();
  var phone = TextEditingController();
  var email = TextEditingController();
  late DateTime time;

  //send mail function
  Future<void> sendmail(
      var price, var location, var name, var userEmail) async {
    try {
      time = DateTime.now().add(Duration(minutes: 30));

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          backgroundColor: Colors.green[700],
          content: Text("Đã đặt hàng...Chi tiết đơn hàng đã gửi về mail"),
          duration: Duration(seconds: 6),
        ),
      );
    } catch (e) {
      print(e.toString());
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          backgroundColor: Colors.green[700],
          content: Text(e.toString()),
          duration: Duration(milliseconds: 2000),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Thanh toán ${Data.itemselected}"),
        centerTitle: true,
      ),
      body: ListView(
        children: [
          Hero(
              tag: Data.itemselected,
              child: Image(
                image: AssetImage("images/${Data.itemselected}.jpg"),
                fit: BoxFit.fill,
              )),
          SizedBox(
            height: 20,
          ),
          Text(Data.itemselected,
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 50)),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Form(
              key: formkey,
              child: Center(
                child: Column(children: [
                  TextFormField(
                    decoration: InputDecoration(
                      hintText: "Tên của bạn",
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5)),
                    ),
                    controller: name,
                    validator: (value) {
                      if (value == null) {
                        return "Không thể để trống";
                      }
                      if (value.isEmpty) {
                        return "Không thể để trống";
                      }
                      return null;
                    },
                  ),
                  SizedBox(height: 40),
                  TextFormField(
                    decoration: InputDecoration(
                      hintText: "Địa chỉ của bạn",
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5)),
                    ),
                    controller: shipping,
                    validator: (value) {
                      if (value == null) {
                        return "Không thể để trống";
                      }
                      if (value.isEmpty) {
                        return "Không thể để trống";
                      }
                      return null;
                    },
                  ),
                  SizedBox(height: 40),
                  TextFormField(
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      hintText: "Số điện thoại",
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5)),
                    ),
                    controller: phone,
                    validator: (value) {
                      if (value == null) {
                        return "Không thể để trống";
                      }
                      if (value.isEmpty) {
                        return "Không thể để trống";
                      }
                      if (value.length < 10) {
                        return "Hãy nhập SĐT hợp lệ";
                      }
                      return null;
                    },
                  ),
                  SizedBox(height: 40),
                  TextFormField(
                    keyboardType: TextInputType.emailAddress,
                    decoration: InputDecoration(
                      hintText: "Email của bạn",
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5)),
                    ),
                    controller: email,
                    validator: (value) {
                      if (value == null) {
                        return "Không thể để trống";
                      }
                      if (value.isEmpty) {
                        return "Không thể để trống";
                      }
                      if (!RegExp(
                              r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                          .hasMatch(value)) {
                        return "Hãy nhập email hợp lệ";
                      }
                      return null;
                    },
                  ),
                  SizedBox(height: 40),
                  Center(
                    child: Text("Tổng tiền :${Data.total}" + "K VNĐ",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 35)),
                  ),
                  SizedBox(height: 40),
                  ElevatedButton.icon(
                    onPressed: () async {
                      //check all fields are filled
                      if (formkey.currentState!.validate()) {
                        //send email with shipment details
                        await sendmail(
                            Data.total, shipping.text, name.text, email.text);
                        //clear fields
                        shipping.clear();
                        name.clear();
                        phone.clear();
                        email.clear();
                      }
                    },
                    icon: Icon(Icons.local_shipping),
                    label: Text("Đặt hàng"),
                  ),
                ]),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
