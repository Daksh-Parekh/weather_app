import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather_app/screens/home/provider/homeProvider.dart';
import 'package:weather_app/utils/extension/sizeBoxExtension.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  late HomeProvider hread, hWatch;
  String? cityName;

  TextEditingController searchController = TextEditingController();
  @override
  void initState() {
    if (context.read<HomeProvider>().searchedCity != null &&
        context.read<HomeProvider>().searchedCity!.isNotEmpty) {
      context.read<HomeProvider>().getWeatherData();
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    hWatch = context.watch<HomeProvider>();
    hread = context.read<HomeProvider>();
    return Scaffold(
      backgroundColor: const Color(0XFF141414),
      appBar: AppBar(
        backgroundColor: const Color(0XFF141414),
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
            hWatch.searchWeatherModel = null;
          },
          icon: const Icon(
            Icons.arrow_back_ios_new_rounded,
            color: Colors.white,
          ),
        ),
        title: const Text(
          "Search Page",
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: searchController,
              onSubmitted: (value) {
                hread.searchesData(value);
                cityName = value;
                log('$cityName');
              },
              style: const TextStyle(color: Colors.white),
              decoration: InputDecoration(
                hintText: "Enter country",
                hintStyle: TextStyle(color: Colors.grey.shade800),
                border: const OutlineInputBorder(),
                // enabled: true,
              ),
            ),
            20.h,
            hWatch.searchWeatherModel == null
                ? Expanded(
                    child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        "Please Select Country",
                        // : "Country Not Found",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.bold),
                      ),
                      50.h,
                      const Icon(
                        Icons.dangerous_rounded,
                        color: Colors.redAccent,
                        size: 150,
                      ),
                    ],
                  ))
                : Stack(
                    alignment: const Alignment(1, -0.5),
                    children: [
                      Container(
                        height: 200,
                        width: 300,
                        child: Stack(
                          alignment: Alignment.bottomLeft,
                          children: [
                            Image.asset('assets/images/rect2.png'),
                            Padding(
                              padding: const EdgeInsets.all(16.0),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.end,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "${hWatch.searchWeatherModel?.mainModels?.temp}\u2103",
                                    style: TextStyle(
                                        color: Colors.white.withOpacity(0.7),
                                        fontSize: 15),
                                  ),
                                  6.h,
                                  Text(
                                    "${hWatch.searchWeatherModel?.countryName}",
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
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Container(
                            height: 160,
                            width: 160,
                            alignment: const Alignment(0, -0.2),
                            child: Image.asset(
                              hWatch.iconPath ?? '',
                            ),
                          ),
                          IconButton(
                            onPressed: () {
                              // hread.setWeatherBookmarkIndex(index);
                              String searchCity = searchController.text;
                              log(searchCity);
                              hread.addWeatherBookMark(searchCity);

                              Navigator.pop(context);
                            },
                            icon: const Icon(
                              Icons.bookmark_add_rounded,
                              size: 30,
                              color: Colors.white,
                            ),
                          ),
                          30.h,
                        ],
                      ),
                    ],
                  )
          ],
        ),
      ),
    );
  }
}
