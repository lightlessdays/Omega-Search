//error handling done
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class Error404 extends StatelessWidget {
  Error404({required this.details,super.key});



  FlutterErrorDetails details;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:Center(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Text("We are sorry, we looked everywhere, but didn't find the search result. 😭\n",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20,),textAlign: TextAlign.center,),
              CachedNetworkImage(imageUrl: "https://raw.githubusercontent.com/lightlessdays/Sadhu-Search/main/pages/404cat.jpg",width: 350,),
              GestureDetector(
                onTap: (){
                  Navigator.of(context).pop();
                },
                  child: const Text("\nGo Back ",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20,decoration: TextDecoration.underline),textAlign: TextAlign.center,)),

            ],
          ),
        ),
      ),
    );
  }
}
