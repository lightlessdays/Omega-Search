// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:sadhusearch/backend/constants.dart';
import 'package:sadhusearch/backend/urllauncher.dart';
import 'package:sadhusearch/frontend/pages/error404.dart';

import '../widgets/appbar.dart';

class Images extends StatefulWidget {
  Images({super.key});


  @override
  State<Images> createState() => _ImagesState();
}

class _ImagesState extends State<Images> {

  late int i;
  List imageData = [];
  TextEditingController textController = TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    i = 1;
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(context,"Image Search"),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30.0),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 40,
              ),
              const Text(
                "Image Search",
                style: TextStyle(
                  color: Colors.black,
                  fontFamily: "DMSans",
                  fontWeight: FontWeight.bold,
                  fontSize: 36,
                ),
                textAlign: TextAlign.left,
              ),
              const Text(
                "We have a collection of 100K+ free-to-use copyright free images.",
                style: TextStyle(
                    color: Colors.black, fontFamily: "DMSans", fontSize: 18),
              ),
              const SizedBox(
                height: 24,
              ),
              TextField(
                onSubmitted: (text) async {
                  i=1;
                  EasyLoading.show(status: "Loading...");
                  List data = await searchImages(textController.text, i);
                  if (data.isNotEmpty){
                    setState(() {
                      imageData= data;
                    });
                  }else{
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => Error404(details: FlutterErrorDetails(exception: Exception("No Images Found")),
                      ),
                    ));
                  }
                  EasyLoading.dismiss();
                },
                controller: textController,
                textInputAction: TextInputAction.search,
                style: const TextStyle(fontFamily: "DMSans", fontSize: 18),
                cursorColor: Colors.black,
                decoration: InputDecoration(
                  contentPadding: const EdgeInsets.symmetric(
                      vertical: 12.0, horizontal: 16.0),
                  filled: true,
                  fillColor: Colors.white,
                  hintText: 'Search Images',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                    borderSide: const BorderSide(
                      color: Colors.black, // Border color
                      width: 2.0, // Border width
                    ),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                    borderSide: const BorderSide(
                      color: Colors.black, // Border color
                      width: 2.0, // Border width
                    ),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                    borderSide: const BorderSide(
                      color: Colors.black, // Border color
                      width: 2.0, // Border width
                    ),
                  ),

                  suffixIcon: IconButton(
                    icon: const Icon(Icons.search),
                    onPressed: () async {
                      i=1;
                      EasyLoading.show(status: "Loading...");
                      List data = await searchImages(textController.text, i);
                      if (data.isNotEmpty){
                        setState(() {
                          imageData= data;
                        });
                      }else{
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => Error404(details: FlutterErrorDetails(exception: Exception("No Images Found")),
                              ),
                            ));
                      }
                      EasyLoading.dismiss();
                      },
                  ),
                ),
              ),
              SizedBox(height: 30,),
              ListView.builder(
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  itemCount: imageData.length,
                  itemBuilder: (BuildContext context, int index) {
                    return buildImageResult(imageData[index][1], imageData[index][0]
                    );
                  }),              SizedBox(height: 30,),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Expanded(flex:1,child: GestureDetector(
                      onTap: () async {
                        if( i!=1){
                          i--;
                          EasyLoading.show(status: "Loading...");
                          List data = await searchImages(textController.text, i);
                          EasyLoading.dismiss();
                          setState(()  {

                            if (data.isNotEmpty){
                              imageData= data;
                            }
                          });
                        }


                      },
                      child: Container(color: Colors.black,child: Center(child: Text("\n← Previous\n",style: TextStyle(color: Colors.white,fontFamily: "DMSans",fontSize: 18),)),))),
                  SizedBox(width: 30,),
                  Expanded(flex:1,child: GestureDetector(
                    onTap: () async {
                      i++;
                      EasyLoading.show(status: "Loading...");
                      List data = await searchImages(textController.text, i);
                      EasyLoading.dismiss();

                      setState(()  {

                        if (data.isNotEmpty){
                          imageData= data;
                        }
                      });
                    },
                      child: Container(color: Colors.black,child: Center(child: Text("\nNext →\n",style: TextStyle(color: Colors.white,fontFamily: "DMSans",fontSize: 18)))))),
                ],
              ),
              SizedBox(height: 30,),
            ],
          ),
        ),
      ),
    );
  }

  Column buildImageResult(String imageUrl, String launchUrl) {
    return Column(
      children: [

        GestureDetector(
                  onTap: (){
                    launchUrlInBrowser(imageUrl);
                  },
                    child: Image.network(launchUrl)),
        SizedBox(height: 30,),

      ],

    );
  }
}
