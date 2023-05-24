// ignore_for_file: prefer_const_constructors, prefer_interpolation_to_compose_strings

import 'package:flutter/material.dart';
import './data.dart';

class Favourites extends StatefulWidget {
  const Favourites({super.key});

  @override
  State<Favourites> createState() => _FavouritesState();
}

class _FavouritesState extends State<Favourites> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Sản phẩm yêu thích"),
        centerTitle: true,
      ),
      body:Data.favourites.isEmpty? Center(
        child: Text("Ấn giữ vào sản phẩm để yêu thích.",
        style: TextStyle(
          fontSize: 15,
          fontWeight: FontWeight.bold
        ),
        ),
      ):Container(
        padding: EdgeInsets.all(10),
        child:ListView.builder(
          itemBuilder:((context, index) {
            return GestureDetector(
              onTap: (() {
                Data.itemselected=Data.favourites[index];
                Navigator.pushNamed(context, "/details");
              }),
              child: SizedBox(
                height: 100,
                child: Card(
                        elevation: 50,
                        shadowColor: Colors.black,
                        child: Center(
                          child: ListTile(
                leading:  Hero(
                  tag: Data.favourites[index],
                  child: CircleAvatar(
                    radius: 40,
                    backgroundImage: AssetImage(
                    "images/"+Data.favourites[index]+".jpg"
                    ),
                  ),
                ),
                title: Text(Data.favourites[index]+"      "+Data.prices[index] + "K VNĐ"),
                trailing: Icon(
                Icons.favorite,
                color: Colors.red[700],
                ),
                subtitle:Text(Data.description[index]),
                ),
                        ),
                ),
              ),
            );
          }),
          itemCount: Data.favourites.length,
        
          )
      ),

    );
  }
}