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
    Size size = MediaQuery.sizeOf(context);
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          children: [
            26.h,
            Row(
              children: [
                Icon(Icons.location_on_outlined),
                10.w,
                Text(
                  "${hWatch.weatherModel?.countryName ?? 'Surat'}",
                  // textAlign: TextAlign.left,
                ),
                Spacer(),
                IconButton(
                  onPressed: () {
                    Navigator.pushNamed(context, AppRoutes.searchPage);
                  },
                  icon: Icon(Icons.search_rounded),
                ),
              ],
            ),
            20.h,
            Container(
                height: size.height * 0.25,
                width: double.infinity,
                padding: EdgeInsets.all(10),
                alignment: Alignment.topLeft,
                decoration: BoxDecoration(
                  color: Colors.grey.shade400,
                  borderRadius: BorderRadius.circular(15),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.white.withOpacity(0.3),
                      blurRadius: 6,
                      offset: Offset(3, 4),
                      spreadRadius: 2,
                    ),
                  ],
                ),
                child:
                    // hWatch.weatherModel != null
                    Column(
                  children: [
                    Text(
                      "Today,${DateTime.now().day} ${DateTime.now().month}",
                      style: TextStyle(fontSize: 16),
                    ),
                    Text(
                      "${hWatch.bookMark.map(
                            (e) => e.main,
                          ).toString() ?? 'sunny'}",
                    ),
                    Spacer(),
                    Text(
                      "${hWatch.weatherModel?.mainModels?.tempMin != null ? (hWatch.weatherModel!.mainModels!.tempMin! - 273.15).toStringAsFixed(2) : '1'}\u00B0C",
                      style:
                          TextStyle(fontSize: 46, fontWeight: FontWeight.bold),
                    ),
                  ],
                )
                // : null,
                ),
            14.h,
            Container(
              height: size.height * 0.1,
              width: double.infinity,
              decoration: BoxDecoration(
                color: Colors.grey[900],
                borderRadius: BorderRadius.circular(8),
              ),
              padding: EdgeInsets.all(10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    children: [
                      Text("Feels like"),
                      Row(
                        children: [
                          Icon(Icons.thermostat),
                          Text(
                            "${hWatch.weatherModel?.mainModels?.tempMin != null ? (hWatch.weatherModel!.mainModels!.tempMin! - 273.15).toStringAsFixed(2) : '1'}\u00B0C",
                          )
                        ],
                      )
                    ],
                  ),
                  Text("${hWatch.bookMark.map(
                    (e) => e.main,
                  )}")
                ],
              ),
            ),
            14.h,
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Container(
                    height: size.height * 0.12,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.grey,
                    ),
                    padding: EdgeInsets.all(12),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Wind Speed"),
                        10.h,
                        Row(
                          children: [
                            Icon(
                              Icons.waves_rounded,
                              size: 26,
                            ),
                            10.w,
                            Text(
                              "${hWatch.weatherModel?.windsModel?.windSpeed}km/h",
                              style: TextStyle(
                                fontSize: 19,
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
                Expanded(
                  child: Container(
                    height: size.height * 0.12,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.grey,
                    ),
                    padding: EdgeInsets.all(12),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Humidity"),
                        10.h,
                        Row(
                          children: [
                            Icon(
                              Icons.water_drop_outlined,
                              size: 28,
                            ),
                            10.w,
                            Text(
                              "${hWatch.weatherModel!.mainModels?.huminity ?? 0}%",
                              style: TextStyle(
                                fontSize: 20,
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
      ),
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
