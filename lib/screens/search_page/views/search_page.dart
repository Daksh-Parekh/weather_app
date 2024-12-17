import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather_app/main.dart';
import 'package:weather_app/screens/home_page/provider/home_provider.dart';
import 'package:weather_app/screens/home_page/views/home_page.dart';
import 'package:weather_app/utils/extension/app_extension.dart';
import 'package:weather_app/utils/routes/app_routes.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  late HomeProvider hread, hWatch;
  @override
  void initState() {
    context.read<HomeProvider>().WeatherData('');
    super.initState();
  }

  TextEditingController searchController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    hWatch = context.watch<HomeProvider>();
    hread = context.read<HomeProvider>();
    return Scaffold(
      backgroundColor: Color(0XFF141414),
      appBar: AppBar(
        backgroundColor: Color(0XFF141414),
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
                context.read<HomeProvider>().WeatherData(value);
              },
              style: TextStyle(color: Colors.white),
              decoration: InputDecoration(
                hintText: "Enter country",
                hintStyle: TextStyle(color: Colors.grey.shade800),
                border: OutlineInputBorder(),
                // enabled: true,
              ),
            ),
            20.h,
            Expanded(
              child: ListView.builder(
                itemCount: context.watch<HomeProvider>().weatherList.length,
                itemBuilder: (context, index) {
                  return Container(
                    height: 75,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: Color(0xff313133),
                      borderRadius: BorderRadius.circular(10),
                      boxShadow: [
                        BoxShadow(
                          blurRadius: 6,
                          spreadRadius: 2,
                          color: Colors.white24,
                          offset: Offset(4, 4),
                        ),
                      ],
                    ),
                    child: ListTile(
                      // leading: hWatch.weatherList[index].main == 'rain'
                      //     ? Image.network('')
                      //     : hWatch.weatherList[index].main == 'sunny||hazy'
                      //         ? Image.network('')

                      //         : Image.network(''),
                      title: Text(
                        "${context.watch<HomeProvider>().weatherModel!.countryName}",
                        style: TextStyle(color: Colors.white, fontSize: 18),
                      ),

                      subtitle: Text(
                        "${context.watch<HomeProvider>().weatherList[index].main}",
                        style: TextStyle(color: Colors.white, fontSize: 14),
                      ),
                      // trailing: Text(
                      //     "${(context.watch<HomeProvider>().weatherModel!.mainModels!.tempMin! - 273.15).toStringAsFixed(2)}"),
                      trailing: IconButton(
                        onPressed: () {
                          hread.setWeatherBookmarkIndex(index);
                          hread.addWeatherBookMark(hWatch.weatherModel);
                          Navigator.pop(context);
                          // arguments: hWatch.bookMark);
                        },
                        icon: Icon(
                          Icons.bookmark_add_rounded,
                          size: 30,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
