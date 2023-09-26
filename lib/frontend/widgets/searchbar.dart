// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import '../../frontend/pages/searchpage.dart';
import '../../backend/constants.dart';
import '../../backend/jsonmanager.dart';

//variable that controls whether to show the cross in the search bar or not.
bool showCross = false;

//search bar's actual code
class searchBar extends StatefulWidget {
  searchBar(this.searchController, {super.key});
  TextEditingController searchController;
  @override
  State<searchBar> createState() => _searchBarState();
}

class _searchBarState extends State<searchBar> {
  var searchDataSet;

  Widget build(BuildContext context) {
    return TextField(
      textInputAction: TextInputAction.search,
      onSubmitted: (text) async {
        EasyLoading.show(status: 'loading...');

          searchDataSet =
              await decodeJSONData(text, cseId, apiKey);

        EasyLoading.dismiss();

        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) =>
                SearchPage(text, searchDataSet),
          ),
        );
      },
      onChanged: (text) {
        if (text.isNotEmpty) {
          setState(() {
            showCross = true;
          });
        } else {
          setState(() {
            showCross = false;
          });
        }
      },
      controller: widget.searchController,
      decoration: InputDecoration(
          suffixIcon: (showCross)
              ? IconButton(
                  icon: Icon(
                    Icons.close,
                    color: Colors.black,
                  ),
                  onPressed: () {
                    setState(() {
                      widget.searchController.text = "";
                      showCross = false;
                    });
                  },
                )
              : const Icon(
                  Icons.close,
                  size: 0,
                ),
          border: buildSearchBoxOutlineInputBorder(),
          enabledBorder: buildSearchBoxOutlineInputBorder(),
          focusedBorder: buildSearchBoxOutlineInputBorder(),
          contentPadding: EdgeInsets.symmetric(horizontal: 10, vertical: 15)),
      cursorColor: Colors.black,
      cursorWidth: 1.5,
      style: TextStyle(fontFamily: "DMSans", fontWeight: FontWeight.w600),
    );
  }
}

//border for search box : putting it as a seperate method because this method is used three times
OutlineInputBorder buildSearchBoxOutlineInputBorder() {
  return OutlineInputBorder(
    borderRadius: BorderRadius.only(
      topLeft: Radius.circular(10),
      bottomLeft: Radius.circular(10),
    ),
    borderSide: BorderSide(
      color: Colors.black,
      width: 1.0,
    ),
  );
}

//search bar and button
class buildSearchBarWithButton extends StatelessWidget {
  buildSearchBarWithButton({
    required this.searchController,
    super.key,
  });

  TextEditingController searchController;
  var searchDataSet;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: Row(
        children: [
          Expanded(
            child: searchBar(searchController),
          ),
          GestureDetector(
            onTap: () async {
              EasyLoading.show(status: 'loading...');

                searchDataSet =
                    await decodeJSONData(searchController.text, cseId, apiKey);

              EasyLoading.dismiss();

              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) =>
                      SearchPage(searchController.text, searchDataSet),
                ),
              );
            },
            child: Container(
              height: 52,
              width: 52,
              decoration: BoxDecoration(
                color: Colors.black,
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(10),
                  bottomRight: Radius.circular(10),
                ),
              ),
              child: Icon(
                Icons.search_rounded,
                color: Colors.white,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
