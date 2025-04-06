import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather_app/screens/home/provider/homeProvider.dart';
import 'package:weather_app/utils/extension/sizeBoxExtension.dart';
import 'package:weather_app/utils/helper/shrHelper.dart';

class BookmarkPage extends StatefulWidget {
  const BookmarkPage({super.key});

  @override
  State<BookmarkPage> createState() => _BookmarkPageState();
}

class _BookmarkPageState extends State<BookmarkPage> {
  HomeProvider? hRead, hWatch;

  @override
  Widget build(BuildContext context) {
    hRead = context.read<HomeProvider>();
    hWatch = context.watch<HomeProvider>();

    return Scaffold(
      backgroundColor: const Color(0XFF141414),
      appBar: AppBar(
        backgroundColor: const Color(0XFF141414),
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(
            Icons.arrow_back_ios_new_rounded,
            color: Colors.white,
          ),
        ),
        title: Text(
          "Bookmark Page",
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: hWatch!.bookMarkCities.isNotEmpty
          ? ListView.builder(
              itemCount: hWatch?.bookMarkCities.length,
              itemBuilder: (context, index) {
                String? iconcode = hWatch!.searchIcons(
                    hWatch!.bookMarkCities[index].weathers!.first.iconCode!);
                return Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: GestureDetector(
                    onTap: () {
                      hRead!.searchedCity =
                          hWatch!.bookMarkCities[index].countryName!;
                      hRead!.weatherData();
                      ShrHelper helper = ShrHelper();
                      helper.setBookmarkedCity(
                          city: hRead!.books,
                          searchCity: hWatch!.searchedCity!);
                      Navigator.pop(context);
                    },
                    child: Stack(
                      alignment: const Alignment(1, -0.7),
                      children: [
                        Container(
                          // height: 200,
                          // color: Colors.blue,
                          child: Stack(
                            alignment: Alignment.bottomLeft,
                            children: [
                              //   Expanded(child: Image.asset('assets/images/rect2.png')),
                              Image.asset('assets/images/rect2.png'),
                              Padding(
                                padding: const EdgeInsets.all(16.0),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "${hWatch!.bookMarkCities[index].mainModels?.temp}\u2103",
                                      style: TextStyle(
                                          color: Colors.white.withOpacity(0.7),
                                          fontSize: 15),
                                    ),
                                    6.h,
                                    Text(
                                      "${hWatch!.bookMarkCities[index].countryName}",
                                      style: const TextStyle(
                                          color: Colors.white,
                                          fontSize: 17,
                                          fontWeight: FontWeight.w600),
                                    ),
                                  ],
                                ),
                              )
                            ],
                          ),
                        ),
                        Container(
                          alignment: const Alignment(0, -0.5),
                          height: 120,
                          width: 120,
                          // color: Colors.amber,
                          decoration: BoxDecoration(
                              // color: Colors.amber,
                              //   image: DecorationImage(
                              //       image: AssetImage(iconcode!), fit: BoxFit.cover),
                              ),
                          child: Image.asset(
                            iconcode!,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            )
          : Center(),
    );
  }
}
