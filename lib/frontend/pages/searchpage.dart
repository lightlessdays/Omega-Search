// ignore_for_file: must_be_immutable

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:sadhusearch/backend/urllauncher.dart';
import 'package:sadhusearch/frontend/pages/homepage.dart';
import '../widgets/searchbar.dart';
import '../widgets/searchresults.dart';

TextEditingController searchController = TextEditingController();
String newSpelling = "";

class SearchPage extends StatefulWidget {
  SearchPage(this.text, this.searchDataSet, {super.key});

  String text;
  List searchDataSet;

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  @override
  void initState() {
    setState(() {
      newSpelling = "";
    });
    searchController.text = widget.text;

    if (widget.searchDataSet[widget.searchDataSet.length - 1][1] == true) {
      setState(() {
        newSpelling = widget.searchDataSet[widget.searchDataSet.length - 1][0];
      });
      widget.searchDataSet.removeLast();
    }
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 0,
        elevation: 0,
        backgroundColor: Colors.black,
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: 10,
            ),
            Row(
              children: [
                const SizedBox(
                  width: 10,
                ),
                IconButton(
                  onPressed: () {
                    Navigator.of(context).pushAndRemoveUntil(
                      MaterialPageRoute(
                        builder: (c) => const HomePage(),
                      ),
                      (route) => false,
                    );
                  },
                  icon: const Icon(
                    Icons.arrow_back_ios_new,
                    size: 20,
                    color: Colors.black,
                  ),
                ),
                CachedNetworkImage(
                  imageUrl:
                      "https://raw.githubusercontent.com/lightlessdays/Sadhu-Search/main/icon_new.jpg",
                  width: 100,
                  alignment: Alignment.center,
                ),
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            buildSearchBarWithButton(
              searchController: searchController,
            ),
            (newSpelling == "")
                ? const SizedBox(
                    height: 0,
                  )
                : Padding(
                    padding: const EdgeInsets.all(
                      14.0,
                    ),
                    child: Text(
                      "Searching for ${newSpelling} instead of ${searchController.text}",
                      style: const TextStyle(
                        fontSize: 15,
                        color: Colors.grey,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 5.0),
              child: ListView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: widget.searchDataSet.length,
                  itemBuilder: (BuildContext context, int index) {
                    return GestureDetector(
                      onTap: () async {
                        await launchUrlInBrowser(
                            widget.searchDataSet[index][2]);
                      },
                      child: buildSearchResult(
                        widget.searchDataSet[index][0],
                        widget.searchDataSet[index][3],
                        widget.searchDataSet[index][1],
                        widget.searchDataSet[index][2],
                      ),
                    );
                  }),
            ),
            const SizedBox(
              height: 30,
            ),
          ],
        ),
      ),
    );
  }
}
