// ignore_for_file: prefer_const_constructors, prefer_interpolation_to_compose_strings

import 'package:flutter/material.dart';
import 'package:online_ordering_app/data.dart';
import 'package:online_ordering_app/search.dart';
class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {

  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:AppBar(
        actions: [
          IconButton(
            //implement search
            onPressed:(){
              showSearch(context: context, delegate:Mysearch());
            }, 
          icon: Icon(Icons.search,
          color: Colors.white,
          )
          ),
        ],
        title:Text("Đặt bánh") ,
        centerTitle: true,
      ) ,

      body: Container(
        padding: EdgeInsets.all(10),
        child:ListView.builder(
          itemBuilder:((context, index) {
            return GestureDetector(
              onLongPress: () {
                if(Data.fav[index]==Colors.white)
                  {
                    //add item to favourites
                    setState(() {
                      Data.fav[index]=Colors.red[900];
                      Data.favourites.add(Data.snacks[index]);
                    });
                  }
                  else
                  {
                    //remove item from favourites
                    setState(() {
                      Data.fav[index]=Colors.white;
                    Data.favourites.remove(Data.snacks[index]);
                    });
                  }
              },
              onTap: (() {
                Data.itemselected=Data.snacks[index];
                Navigator.pushNamed(context, "/details");
              }),
              child: SizedBox(
                height: 100,
                child: Card(
                  semanticContainer: true,
                        elevation: 50,
                        shadowColor: Colors.black,
                        child: Center(
                          child: ListTile(        
                leading: Hero(
                  tag: Data.snacks[index],
                  child: CircleAvatar(
                    radius: 40,
                    backgroundImage: AssetImage(
                    "images/"+Data.snacks[index]+".jpg"
                    ),
                  ),
                ),
                title: Text(Data.snacks[index]+"      "+Data.prices[index] + "K VNĐ"),
                trailing:Icon(
                Icons.favorite,
                color: Data.fav[index],
                )  ,
                subtitle:Text(Data.description[index]),
                ),
                        ),
                ),
              ),
            );
          }),
          itemCount: Data.snacks.length,
        
          )
      ),
      floatingActionButton: FloatingActionButton(
            tooltip: "Sản phẩm yêu thích",
            backgroundColor: Colors.green[700],
            child: Icon(Icons.favorite_border),
            onPressed:()=> Navigator.pushNamed(context, "/favourites")),
    );
  }
}