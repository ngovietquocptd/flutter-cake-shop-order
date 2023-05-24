// ignore_for_file: prefer_const_constructors, prefer_interpolation_to_compose_strings

import 'package:flutter/material.dart';
import 'package:online_ordering_app/data.dart';

class Mysearch extends SearchDelegate{
  @override
  List<Widget>? buildActions(BuildContext context) {
    return[
    TextButton(onPressed: (){
      query="";
    }, child: Text("CLEAR",
    style: TextStyle(
      color: Colors.green[700]
    ),
    ))
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(onPressed: (){
      close(context, null);
    },
     icon: Icon(Icons.arrow_back)
     );
  }

  @override
  Widget buildResults(BuildContext context) {
    var match=[];
    for(var snack in Data.snacks)
    {
      if( snack.toLowerCase().contains(query.toLowerCase()))
      {
        match.add(snack);
      }
    }
    return ListView.builder(
          itemBuilder:((context, index) {
            return GestureDetector(
              onLongPress: () {
                if(Data.fav[index]==Colors.white)
                  {
                    //add item to favourites
                      Data.fav[index]=Colors.red[900];
                      Data.favourites.add(match[index]);
                  }
                  else
                  {
                    //remove item from favourites
                      Data.fav[index]=Colors.white;
                    Data.favourites.remove(match[index]);
                    
                  }
              },
              onTap: (() {
                Data.itemselected=match[index];
                Navigator.pushNamed(context, "/details");
              }),
              child: SizedBox(
                height: 100,
                child: Card(
                        elevation: 50,
                        shadowColor: Colors.black,
                        child: Center(
                          child: ListTile(
                leading: CircleAvatar(
                  radius: 40,
                  backgroundImage: AssetImage(
                  "images/"+match[index]+".jpg"
                  ),
                ),
                title: Text(match[index]+"      Ksh."+Data.prices[Data.snacks.indexOf(match[index])]),
                trailing:Icon(
                Icons.favorite,
                color: Data.fav[index],
                )  ,
                subtitle:Text(Data.description[Data.snacks.indexOf(match[index])]),
                ),
                        ),
                ),
              ),
            );
          }),
          itemCount: match.length,
        
          );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    var match=[];
    for(var snack in Data.snacks)
    {
      if( snack.toLowerCase().contains(query.toLowerCase()))
      {
        match.add(snack);
      }
    }
    return ListView.builder(
          itemBuilder:((context, index) {
            return GestureDetector(
              onLongPress: () {
                if(Data.fav[index]==Colors.white)
                  {
                    //add item to favourites
                      Data.fav[index]=Colors.red[900];
                      Data.favourites.add(match[index]);
                  }
                  else
                  {
                    //remove item from favourites
                      Data.fav[index]=Colors.white;
                    Data.favourites.remove(match[index]);
                    
                  }
              },
              onTap: (() {
                Data.itemselected=match[index];
                Navigator.pushNamed(context, "/details");
              }),
              child: SizedBox(
                height: 100,
                child: Card(
                        elevation: 50,
                        shadowColor: Colors.black,
                        child: Center(
                          child: ListTile(
                leading: CircleAvatar(
                  radius: 40,
                  backgroundImage: AssetImage(
                  "images/"+match[index]+".jpg"
                  ),
                ),
                title: Text(match[index]+"      "+Data.prices[Data.snacks.indexOf(match[index])] + "K VNĐ"),
                trailing:Icon(
                Icons.favorite,
                color: Data.fav[index],
                )  ,
                subtitle:Text(Data.description[Data.snacks.indexOf(match[index])]),
                ),
                        ),
                ),
              ),
            );
          }),
          itemCount: match.length,
        
          );
  }

}