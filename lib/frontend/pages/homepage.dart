import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:sadhusearch/backend/urllauncher.dart';
import 'package:sadhusearch/frontend/pages/images.dart';
import '../../frontend/pages/news.dart';
import '../widgets/logo.dart';
import '../widgets/searchbar.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

TextEditingController searchController = TextEditingController();

class _HomePageState extends State<HomePage> {
  @override
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      drawer: Drawer(
        backgroundColor: Colors.white,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ListTile(
              title: Text(
                "Quick Links",
                style: TextStyle(
                    fontFamily: "DMSans",
                    fontSize: 30,
                    fontWeight: FontWeight.bold),
              ),
            ),
            buildGestureDetector(
                "Free Courses", "https://crookshanksacademy.com"),
            buildGestureDetector(
                "Bizz Newsletter", "https://bootstrapclub.in/newsletter"),
            buildGestureDetector(
                "Free Audiobooks", "https://dhruvbadaya.com/audiobooks"),
            buildGestureDetector("Privacy Policy",
                "https://lightlessdays.github.io/Omega-Search/Privacy-Policy.html"),
            buildGestureDetector("Developer Info", "https://dhruvbadaya.com"),
            buildGestureDetector(
                "Rate Us", "https://dhruvbadaya.com/rateOmega"),
          ],
        ),
      ),
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
                    _scaffoldKey.currentState?.openDrawer();
                  },
                  icon: const Icon(
                    Icons.lens_blur_outlined,
                    size: 35,
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 80,
            ),
            buildHomeLogo(context),
            buildSearchBarWithButton(
              searchController: searchController,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 5.0),
              child: Column(
                children: [
                  const SizedBox(
                    height: 20,
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => Images(),
                        ),
                      );
                    },
                    child: CachedNetworkImage(
                      imageUrl:
                          "https://raw.githubusercontent.com/lightlessdays/Sadhu-Search/main/home_one.png",
                    ),
                  ),
                  GestureDetector(
                    onTap: () async {
                      EasyLoading.show(status: 'loading...');
                      List<List<String>> data = await fetchFeed();
                      EasyLoading.dismiss();
                      // ignore: use_build_context_synchronously
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => NewsPage(data: data),
                        ),
                      );
                    },
                    child: CachedNetworkImage(
                      imageUrl:
                          "https://raw.githubusercontent.com/lightlessdays/Sadhu-Search/main/home_four.png",
                    ),
                  ),
                  GestureDetector(
                    onTap: () {},
                    child: CachedNetworkImage(
                      imageUrl:
                          "https://raw.githubusercontent.com/lightlessdays/Sadhu-Search/main/home_three.png",
                    ),
                  ),
                  GestureDetector(
                    onTap: () {},
                    child: CachedNetworkImage(
                      imageUrl:
                          "https://raw.githubusercontent.com/lightlessdays/Sadhu-Search/main/home_two.png",
                    ),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  const Text(
                    "M A D E     W I T H     ❤     I N     I N D I A",
                    style: TextStyle(
                        fontFamily: "DMSans", fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  GestureDetector buildGestureDetector(String title, String url) {
    return GestureDetector(
      onTap: () {
        launchUrlInBrowser(url);
      },
      child: ListTile(
        title: Text(
          title + " →",
          style: TextStyle(
            fontFamily: "DMSans",
            fontSize: 20,
          ),
        ),
      ),
    );
  }
}
