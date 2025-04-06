import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather_app/screens/home/components/rowContainerCompo.dart';
import 'package:weather_app/screens/home/provider/homeProvider.dart';
import 'package:weather_app/utils/extension/sizeBoxExtension.dart';
import 'package:arc_progress_bar_new/arc_progress_bar_new.dart';
import 'package:weather_app/utils/routes/appRoutes.dart';

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
    String? img = hWatch.weatherModel?.weathers?.firstOrNull?.main;

    Size size = MediaQuery.sizeOf(context);
    return Scaffold(
      backgroundColor: const Color(0XFF141414),
      appBar: AppBar(
        backgroundColor: const Color(0XFF141414),
        title: hWatch.isProgressOn == true
            ? Center()
            : hWatch.searchedCity != null
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
          hWatch.isProgressOn == true
              ? Center()
              : hWatch.searchedCity != null
                  ? Row(
                      children: [
                        IconButton(
                          onPressed: () {
                            Navigator.pushNamed(
                                context, AppRoutes.bookmarkPage);
                          },
                          icon: const Icon(
                            Icons.bookmark,
                            color: Colors.white,
                          ),
                        ),
                        IconButton(
                          onPressed: () {
                            // hWatch.bookMark.removeRange(0, 1);
                            Navigator.pushNamed(context, AppRoutes.searchPage);
                          },
                          icon: const Icon(
                            Icons.search_rounded,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    )
                  : const Text(""),
        ],
      ),
      body: hWatch.isProgressOn == true
          ? Center(child: CircularProgressIndicator())
          : hWatch.searchedCity != null
              ? Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        //Weather Container
                        Container(
                            height: size.height * 0.30,
                            width: double.infinity,
                            padding: const EdgeInsets.all(10),
                            alignment: Alignment.topLeft,
                            decoration: BoxDecoration(
                              color: const Color.fromARGB(255, 45, 45, 45),
                              borderRadius: BorderRadius.circular(14),
                              // color: const Color(0Xff313131),
                              image: hWatch.dynamicImages(img),

                              // borderRadius: BorderRadius.circular(15),
                              // boxShadow: [
                              //   BoxShadow(
                              //     color: Colors.white.withOpacity(0.3),
                              //     blurRadius: 6,
                              //     offset: const Offset(2, 2),
                              //     spreadRadius: 2,
                              //   ),
                              // ],
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
                                  "${hWatch.weatherModel?.weathers?.firstOrNull?.main}",
                                  style: const TextStyle(color: Colors.white),
                                ),
                                const Spacer(),
                                Text(
                                  "${hWatch.weatherModel?.mainModels?.temp}\u00B0C",
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
                            borderRadius: BorderRadius.circular(8),
                            color: const Color.fromARGB(255, 45, 45, 45),
                            // color: const Color(0xff313133),
                            // border: Border.all(
                            //   color: Colors.grey.withOpacity(0.3),
                            // ),
                            // boxShadow: [
                            //   BoxShadow(
                            //     color: Colors.white.withOpacity(0.3),
                            //     blurRadius: 5,
                            //     offset: const Offset(3, 2.5),
                            //     // spreadRadius: 2,
                            //   ),
                            // ],
                          ),
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
                                        "${hWatch.weatherModel?.mainModels?.feelsLike}\u00B0C",
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
                                "${hWatch.weatherList.firstOrNull?.description ?? ''}",
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
                            rowsContainer(
                                key: "Wind Speed",
                                values:
                                    "${hWatch.weatherModel?.windsModel?.windSpeed}km/h",
                                icons: Icons.air_rounded,
                                size: size),
                            10.w,
                            //Humidity
                            rowsContainer(
                                key: "Humidity",
                                values:
                                    "${hWatch.weatherModel?.mainModels?.huminity}%",
                                icons: Icons.water_drop_outlined,
                                size: size),
                          ],
                        ),
                        14.h,
                        //Visibility and Pressure
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            //Visibility
                            rowsContainer(
                                key: 'Visibiltiy',
                                values:
                                    '${(hWatch.weatherModel?.visibility ?? 0) / 1000} km',
                                icons: Icons.visibility_outlined,
                                size: size),
                            10.w,
                            //Pressure
                            rowsContainer(
                                key: 'Pressure',
                                values:
                                    '${(hWatch.weatherModel!.mainModels?.pressure)} hPa',
                                icons: Icons.compress_outlined,
                                size: size),
                          ],
                        ),
                        22.h,
                        Column(
                          children: [
                            Container(
                              height: size.height * 0.25,
                              padding: const EdgeInsets.all(10),
                              child: ArcProgressBar(
                                percentage: hWatch.arcInidicator.toDouble(),
                                arcThickness: 5,
                                handleSize: 20,
                                backgroundColor: Colors.grey,
                                strokeCap: StrokeCap.round,
                                foregroundColor: Colors.white,
                              ),
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 14),
                              child: Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          const Icon(
                                            Icons.wb_sunny_rounded,
                                            color: Colors.amber,
                                          ),
                                          8.h,
                                          Text(
                                            "${DateTime.fromMicrosecondsSinceEpoch((hWatch.weatherModel?.sys?.sunset ?? 0) * 1000).hour} : ${DateTime.fromMicrosecondsSinceEpoch((hWatch.weatherModel?.sys?.sunset ?? 0) * 1000).minute} am",
                                            style: const TextStyle(
                                                color: Colors.white),
                                          ),
                                        ],
                                      ),
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.end,
                                        children: [
                                          const Icon(
                                            Icons.wb_twilight_sharp,
                                            color: Colors.orange,
                                          ),
                                          8.h,
                                          Text(
                                            "${DateTime.fromMicrosecondsSinceEpoch((hWatch.weatherModel?.sys?.sunset ?? 0) * 1000).hour} : ${DateTime.fromMicrosecondsSinceEpoch((hWatch.weatherModel?.sys?.sunset ?? 0) * 1000).minute} pm",
                                            style: const TextStyle(
                                                color: Colors.white),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            )
                          ],
                        ),

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
                  ),
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
