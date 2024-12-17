import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather_app/screens/home_page/model/weather_model.dart';
import 'package:weather_app/screens/home_page/provider/home_provider.dart';
import 'package:weather_app/utils/extension/app_extension.dart';
import 'package:weather_app/utils/routes/app_routes.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // TextEditingController searchController = TextEditingController();
  // @override
  // void initState() {
  //   context.read<HomeProvider>().WeatherData('');
  //   super.initState();
  // }

  late HomeProvider hRead, hWatch;
  @override
  Widget build(BuildContext context) {
    hRead = context.read<HomeProvider>();
    hWatch = context.watch<HomeProvider>();
    String? img;
    Size size = MediaQuery.sizeOf(context);
    return Scaffold(
      backgroundColor: Color(0XFF141414),
      appBar: AppBar(
        backgroundColor: Color(0XFF141414),
        title: hWatch.bookMark.isNotEmpty
            ? Row(
                children: [
                  Icon(
                    Icons.location_on_outlined,
                    color: Colors.white,
                  ),
                  10.w,
                  Text(
                    "${hWatch.weatherModel?.countryName}",
                    style: TextStyle(color: Colors.white),
                    // textAlign: TextAlign.left,
                  ),
                ],
              )
            : IconButton(
                onPressed: () {
                  Navigator.pushNamed(context, AppRoutes.searchPage);
                },
                icon: Icon(
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
                  icon: Icon(
                    Icons.search_rounded,
                    color: Colors.white,
                  ),
                )
              : Text(""),
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
                  padding: EdgeInsets.all(16),
                  child: Column(
                    children: [
                      //Weather Container
                      Container(
                          height: size.height * 0.25,
                          width: double.infinity,
                          padding: EdgeInsets.all(10),
                          alignment: Alignment.topLeft,
                          decoration: BoxDecoration(
                            color: Color(0Xff313131),
                            image: DecorationImage(
                              fit: BoxFit.cover,
                              image: img == 'Haze' ||
                                      img == 'haze' ||
                                      img == 'fogg' ||
                                      img == 'Fog' ||
                                      img == 'Smoke'
                                  ? AssetImage("assets/images/foggy.jpg")
                                  : img == 'snow' || img == 'Clouds'
                                      ? AssetImage(
                                          'assets/images/snowWeather.jpg')
                                      : img == 'rainy' ||
                                              img == 'cloud' ||
                                              img == 'Rain'
                                          ? AssetImage(
                                              'assets/images/rainy.jpg')
                                          : img == 'sun' || img == 'sunny'
                                              ? AssetImage(
                                                  'assets/images/sunnyWeather.jpg')
                                              : img == 'suuny rainy'
                                                  ? AssetImage(
                                                      "assets/images/sunny&rainy.jpg")
                                                  : img == 'Thunderstorm'
                                                      ? AssetImage(
                                                          'assets/images/Thunderstorm.jpg')
                                                      : AssetImage(
                                                          'assets/images/clear.jpg'),
                            ),
                            borderRadius: BorderRadius.circular(15),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.white.withOpacity(0.3),
                                blurRadius: 6,
                                offset: Offset(2, 2),
                                spreadRadius: 2,
                              ),
                            ],
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Today,${DateTime.now().day} ${DateTime.now().month}",
                                style: TextStyle(
                                    fontSize: 16, color: Colors.white),
                              ),
                              Text(
                                "${hWatch.bookMark[hWatch.weatherBookmarkInx].weathers?[hWatch.weatherBookmarkInx].main}",
                                style: TextStyle(color: Colors.white),
                              ),
                              Spacer(),
                              Text(
                                "${hWatch.bookMark[hWatch.weatherBookmarkInx].mainModels?.temp}\u00B0C",
                                style: TextStyle(
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
                          color: Color(0xff313133),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        padding: EdgeInsets.all(10),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              children: [
                                Text(
                                  "Feels like",
                                  style: TextStyle(color: Colors.white),
                                ),
                                6.h,
                                Row(
                                  children: [
                                    Icon(
                                      Icons.thermostat,
                                      color: Colors.white,
                                    ),
                                    Text(
                                      "${hWatch.bookMark[hWatch.weatherBookmarkInx].mainModels?.feelsLike}\u00B0C",
                                      // "${hWatch.weatherModel?.mainModels?.feelsLike}\u00B0C",
                                      style: TextStyle(
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
                              style: TextStyle(color: Colors.white),
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
                                color: Color(0xff313133),
                              ),
                              padding: EdgeInsets.all(12),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Wind Speed",
                                    style: TextStyle(color: Colors.white),
                                  ),
                                  10.h,
                                  Row(
                                    children: [
                                      Icon(
                                        Icons.waves_rounded,
                                        size: 24,
                                        color: Colors.white,
                                      ),
                                      10.w,
                                      Text(
                                        "${hWatch.bookMark[hWatch.weatherBookmarkInx].windsModel?.windSpeed}km/h",
                                        // "${hWatch.weatherModel?.windsModel?.windSpeed}km/h",
                                        style: TextStyle(
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
                                color: Color(0xff313133),
                              ),
                              padding: EdgeInsets.all(12),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Humidity",
                                    style: TextStyle(color: Colors.white),
                                  ),
                                  10.h,
                                  Row(
                                    children: [
                                      Icon(
                                        Icons.water_drop_outlined,
                                        size: 28,
                                        color: Colors.white,
                                      ),
                                      10.w,
                                      Text(
                                        "${hWatch.bookMark[hWatch.weatherBookmarkInx].mainModels?.huminity}",
                                        // "${hWatch.weatherModel?.mainModels?.huminity ?? 0}%",
                                        style: TextStyle(
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
                    ],
                  ),
                );
              },
            )
          : Text(""),
    );
  }
}

// body: Padding(
//   padding: const EdgeInsets.all(12.0),
//   child: Column(
//     children: [
//       Expanded(
//         child: ListView.builder(
//           itemCount: hWatch.bookMark.length,
//           itemBuilder: (context, index) {
//             return ListTile(
//               // leading: hWatch.weatherList[index].main == 'rain'
//               //     ? Image.network('')
//               //     : hWatch.weatherList[index].main == 'sunny||hazy'
//               //         ? Image.network('')
//               //         : Image.network(''),
//               title: Text("${hWatch.bookMark[index].main}"),
//               subtitle: Text("${hWatch.weatherModel?.countryName ?? ''}"),
//               // "${context.watch<HomeProvider>().weatherList[index].main}"),
//               // subtitle: Text(
//               // "${context.watch<HomeProvider>().weatherModel!.countryName}"),
//               // trailing: Text(
//               // "${(context.watch<HomeProvider>().weatherModel!.mainModels!.tempMin! - 273.15).toStringAsFixed(2)}"),
//             );
//           },
//         ),
//       ),
//       IconButton(
//         onPressed: () {
//           hWatch.bookMark.clear();
//           Navigator.pushNamed(context, AppRoutes.searchPage);
//         },
//         icon: Icon(Icons.search),
//       ),
//     ],
//   ),
// ),
