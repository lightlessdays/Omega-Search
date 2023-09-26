import 'package:flutter/material.dart';
import '../../backend/xmlmanager.dart';
import '../../backend/urllauncher.dart';
import '../widgets/appbar.dart';
import '../widgets/searchresults.dart';

// ignore: must_be_immutable
class NewsPage extends StatefulWidget {
  NewsPage({required this.data, super.key});
  List<List<String>> data;
  @override
  State<NewsPage> createState() => _NewsPageState();
}

class _NewsPageState extends State<NewsPage> {
  @override
  void initState() {
    fetchData();
    // TODO: implement initState
    super.initState();
  }

  fetchData() async {
    await fetchFeed();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(context, "News of the Day"),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 5.0),
              child: ListView.builder(
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  itemCount: widget.data.length,
                  itemBuilder: (BuildContext context, int index) {
                    return GestureDetector(
                      onTap: () async {
                        await launchUrlInBrowser(widget.data[index][1]);
                      },
                      child: buildSearchResult(widget.data[index][0], " ",
                          widget.data[index][2], widget.data[index][2]),
                    );
                  }),
            ),
            SizedBox(
              height: 10,
            )
          ],
        ),
      ),
    );
  }


}