import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather_app/screens/home_page/provider/home_provider.dart';
import 'package:weather_app/utils/extension/app_extension.dart';
import 'package:weather_app/utils/routes/app_routes.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late HomeProvider hRead, hWatch;
  @override
  Widget build(BuildContext context) {
    hRead = context.read<HomeProvider>();
    hWatch = context.watch<HomeProvider>();
    String? img;
    Size size = MediaQuery.sizeOf(context);
    return Scaffold(
      backgroundColor: const Color(0XFF141414),
      appBar: AppBar(
        backgroundColor: const Color(0XFF141414),
        title: hWatch.bookMark.isNotEmpty
            ? Row(
                children: [
                  const Icon(
                    Icons.location_on_outlined,
                    color: Colors.white,
                  ),
                  10.w,
                  Text(
                    "${hWatch.weatherModel?.countryName}",
                    style: const TextStyle(color: Colors.white),
                    // textAlign: TextAlign.left,
                  ),
                ],
              )
            : IconButton(
                onPressed: () {
                  Navigator.pushNamed(context, AppRoutes.searchPage);
                },
                icon: const Icon(
                  Icons.search_rounded,
                  color: Colors.white,
                ),
              ),
        actions: [
          hWatch.bookMark.isNotEmpty
              ? IconButton(
                  onPressed: () {
                    hWatch.bookMark.removeRange(0, 1);
                    Navigator.pushNamed(context, AppRoutes.searchPage);
                  },
                  icon: const Icon(
                    Icons.search_rounded,
                    color: Colors.white,
                  ),
                )
              : const Text(""),
        ],
      ),
      body: hWatch.bookMark.isNotEmpty
          // ? PageView.builder(
          //     itemCount: hWatch.bookMark.length,
          //     itemBuilder: (context, index) {
          //       return
          //     },
          //   )
          ? ListView.builder(
              itemCount: hWatch.bookMark.length,
              itemBuilder: (context, index) {
                img = hWatch.bookMark[hWatch.weatherBookmarkInx]
                    .weathers![hWatch.weatherBookmarkInx].main;
                return Padding(
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    children: [
                      //Weather Container
                      Container(
                          height: size.height * 0.25,
                          width: double.infinity,
                          padding: const EdgeInsets.all(10),
                          alignment: Alignment.topLeft,
                          decoration: BoxDecoration(
                            color: const Color(0Xff313131),
                            image: DecorationImage(
                              fit: BoxFit.cover,
                              image: img == 'Haze' ||
                                      img == 'haze' ||
                                      img == 'fogg' ||
                                      img == 'Fog' ||
                                      img == 'Smoke'
                                  ? const AssetImage("assets/images/foggy.jpg")
                                  : img == 'snow' || img == 'Clouds'
                                      ? const AssetImage(
                                          'assets/images/snowWeather.jpg')
                                      : img == 'rainy' ||
                                              img == 'cloud' ||
                                              img == 'Rain'
                                          ? const AssetImage(
                                              'assets/images/rainy.jpg')
                                          : img == 'sun' || img == 'sunny'
                                              ? const AssetImage(
                                                  'assets/images/sunnyWeather.jpg')
                                              : img == 'suuny rainy'
                                                  ? const AssetImage(
                                                      "assets/images/sunny&rainy.jpg")
                                                  : img == 'Thunderstorm'
                                                      ? const AssetImage(
                                                          'assets/images/Thunderstorm.jpg')
                                                      : const AssetImage(
                                                          'assets/images/clear.jpg'),
                            ),
                            borderRadius: BorderRadius.circular(15),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.white.withOpacity(0.3),
                                blurRadius: 6,
                                offset: const Offset(2, 2),
                                spreadRadius: 2,
                              ),
                            ],
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Today,${DateTime.now().day} ${DateTime.now().month}",
                                style: const TextStyle(
                                    fontSize: 16, color: Colors.white),
                              ),
                              Text(
                                "${hWatch.bookMark[hWatch.weatherBookmarkInx].weathers?[hWatch.weatherBookmarkInx].main}",
                                style: const TextStyle(color: Colors.white),
                              ),
                              const Spacer(),
                              Text(
                                "${hWatch.bookMark[hWatch.weatherBookmarkInx].mainModels?.temp}\u00B0C",
                                style: const TextStyle(
                                    fontSize: 46,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white),
                              ),
                            ],
                          )
                          // : null,
                          ),
                      18.h,
                      //Feels Like & Description
                      Container(
                        height: size.height * 0.1,
                        width: double.infinity,
                        decoration: BoxDecoration(
                            color: const Color(0xff313133),
                            borderRadius: BorderRadius.circular(8),
                            border: Border.all(
                              color: Colors.grey.withOpacity(0.3),
                            ),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.white.withOpacity(0.3),
                                blurRadius: 5,
                                offset: const Offset(3, 2.5),
                                // spreadRadius: 2,
                              ),
                            ]),
                        padding: const EdgeInsets.all(10),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              children: [
                                const Text(
                                  "Feels like",
                                  style: TextStyle(color: Colors.white),
                                ),
                                6.h,
                                Row(
                                  children: [
                                    const Icon(
                                      Icons.thermostat,
                                      color: Colors.white,
                                    ),
                                    Text(
                                      "${hWatch.bookMark[hWatch.weatherBookmarkInx].mainModels?.feelsLike}\u00B0C",
                                      // "${hWatch.weatherModel?.mainModels?.feelsLike}\u00B0C",
                                      style: const TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 15),
                                    )
                                  ],
                                )
                              ],
                            ),
                            Text(
                              "${hWatch.bookMark[hWatch.weatherBookmarkInx].weathers?[hWatch.weatherBookmarkInx].description}",
                              // "${hWatch.bookMark[index].weathers?[index].main}",
                              style: const TextStyle(color: Colors.white),
                            )
                          ],
                        ),
                      ),
                      14.h,
                      //Wind Spped&Humanity
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          //WindSpeed
                          Expanded(
                            child: Container(
                              height: size.height * 0.12,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: const Color(0xff313133),
                                border: Border.all(
                                  color: Colors.grey.withOpacity(0.3),
                                ),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.white.withOpacity(0.3),
                                    blurRadius: 5,
                                    offset: const Offset(3, 2.5),
                                    // spreadRadius: 2,
                                  ),
                                ],
                              ),
                              padding: const EdgeInsets.all(12),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Text(
                                    "Wind Speed",
                                    style: TextStyle(color: Colors.white),
                                  ),
                                  10.h,
                                  Row(
                                    children: [
                                      const Icon(
                                        Icons.waves_rounded,
                                        size: 24,
                                        color: Colors.white,
                                      ),
                                      10.w,
                                      Text(
                                        "${hWatch.bookMark[hWatch.weatherBookmarkInx].windsModel?.windSpeed}km/h",
                                        // "${hWatch.weatherModel?.windsModel?.windSpeed}km/h",
                                        style: const TextStyle(
                                          fontSize: 17,
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                          10.w,
                          //Humidity
                          Expanded(
                            child: Container(
                              height: size.height * 0.12,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: const Color(0xff313133),
                                border: Border.all(
                                  color: Colors.grey.withOpacity(0.3),
                                ),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.white.withOpacity(0.3),
                                    blurRadius: 5,
                                    offset: const Offset(3, 2.5),
                                    // spreadRadius: 2,
                                  ),
                                ],
                              ),
                              padding: const EdgeInsets.all(10),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Text(
                                    "Humidity",
                                    style: TextStyle(color: Colors.white),
                                  ),
                                  10.h,
                                  Row(
                                    children: [
                                      const Icon(
                                        Icons.water_drop_outlined,
                                        size: 28,
                                        color: Colors.white,
                                      ),
                                      10.w,
                                      Text(
                                        "${hWatch.bookMark[hWatch.weatherBookmarkInx].mainModels?.huminity}%",
                                        // "${hWatch.weatherModel?.mainModels?.huminity ?? 0}%",
                                        style: const TextStyle(
                                          fontSize: 20,
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                      14.h,
                      //Sunrise and sunset
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          //Sunrise
                          Expanded(
                            child: Container(
                              height: size.height * 0.12,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: const Color(0xff313133),
                                border: Border.all(
                                  color: Colors.grey.withOpacity(0.3),
                                ),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.white.withOpacity(0.3),
                                    blurRadius: 5,
                                    offset: const Offset(3, 2.5),
                                    // spreadRadius: 2,
                                  ),
                                ],
                              ),
                              padding: const EdgeInsets.all(12),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Text(
                                    "Sunrise Time",
                                    style: TextStyle(color: Colors.white),
                                  ),
                                  10.h,
                                  Row(
                                    children: [
                                      const Icon(
                                        Icons.wb_sunny_rounded,
                                        size: 24,
                                        color: Colors.yellow,
                                      ),
                                      10.w,
                                      Text(
                                        "${DateTime.fromMicrosecondsSinceEpoch((hWatch.bookMark[hWatch.weatherBookmarkInx].sys!.sunrise!) * 1000).hour} : ${DateTime.fromMicrosecondsSinceEpoch((hWatch.bookMark[hWatch.weatherBookmarkInx].sys!.sunrise!) * 1000).minute} am",
                                        style: const TextStyle(
                                          fontSize: 17,
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                          10.w,
                          //sunset
                          Expanded(
                            child: Container(
                              height: size.height * 0.12,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: const Color(0xff313133),
                                border: Border.all(
                                  color: Colors.grey.withOpacity(0.3),
                                ),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.white.withOpacity(0.3),
                                    blurRadius: 5,
                                    offset: const Offset(3, 2.5),
                                    // spreadRadius: 2,
                                  ),
                                ],
                              ),
                              padding: const EdgeInsets.all(10),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Text(
                                    "Sunset Time",
                                    style: TextStyle(color: Colors.white),
                                  ),
                                  10.h,
                                  Row(
                                    children: [
                                      const Icon(
                                        Icons.wb_twilight_rounded,
                                        size: 28,
                                        color: Colors.orange,
                                      ),
                                      10.w,
                                      Text(
                                        "${DateTime.fromMicrosecondsSinceEpoch((hWatch.bookMark[hWatch.weatherBookmarkInx].sys!.sunset!) * 1000).hour} : ${DateTime.fromMicrosecondsSinceEpoch((hWatch.bookMark[hWatch.weatherBookmarkInx].sys!.sunset!) * 1000).minute} pm",
                                        style: const TextStyle(
                                          fontSize: 17,
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                      // ArcProgressBar(
                      //     percentage: 10,
                      //     arcThickness: 5,
                      //     innerPadding: 16,
                      //     animateFromLastPercent: true,
                      //     handleSize: 10,
                      //     backgroundColor: Colors.black12,
                      //     foregroundColor: Colors.black),
                      // Icon(
                      //   Icons.wb_twilight_rounded,
                      //   color: Colors.white,
                      // ),
                      // Icon(
                      //   Icons.arrow_upward_rounded,
                      //   color: Colors.white,
                      // ),
                      // //Sunrise Time
                      // Container(
                      //   height: size.height * 0.1,
                      //   width: double.infinity,
                      //   color: Colors.green,
                      //   child: Text(
                      //       "${DateTime.fromMicrosecondsSinceEpoch((hWatch.bookMark[hWatch.weatherBookmarkInx].sys!.Sunrise!) * 1000).hour} : ${DateTime.fromMicrosecondsSinceEpoch((hWatch.bookMark[hWatch.weatherBookmarkInx].sys!.Sunrise!) * 1000).minute} am"),
                      // ),
                    ],
                  ),
                );
              },
            )
          : Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  "Please Select Country",
                  style: TextStyle(
                    fontSize: 20,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Image.asset(
                  'assets/images/country_not_select.png',
                ),
              ],
            ),
    );
  }
}
