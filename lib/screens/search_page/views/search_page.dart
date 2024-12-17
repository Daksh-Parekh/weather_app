import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather_app/screens/home_page/provider/home_provider.dart';
import 'package:weather_app/utils/extension/app_extension.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  late HomeProvider hread, hWatch;
  @override
  void initState() {
    context.read<HomeProvider>().weatherData('');
    super.initState();
  }

  TextEditingController searchController = TextEditingController();
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
                context.read<HomeProvider>().weatherData(value);
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
            hWatch.weatherModel != null
                ? Expanded(
                    child: ListView.builder(
                      itemCount:
                          context.watch<HomeProvider>().weatherList.length,
                      itemBuilder: (context, index) {
                        return Container(
                          height: 75,
                          width: double.infinity,
                          decoration: BoxDecoration(
                            color: const Color(0xff313133),
                            borderRadius: BorderRadius.circular(10),
                            boxShadow: const [
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
                              style: const TextStyle(
                                  color: Colors.white, fontSize: 18),
                            ),

                            subtitle: Text(
                              "${context.watch<HomeProvider>().weatherList[index].main}",
                              style: const TextStyle(
                                  color: Colors.white, fontSize: 14),
                            ),
                            trailing: IconButton(
                              onPressed: () {
                                hread.setWeatherBookmarkIndex(index);
                                hread.addWeatherBookMark(hWatch.weatherModel);
                                Navigator.pop(context);
                              },
                              icon: const Icon(
                                Icons.bookmark_add_rounded,
                                size: 30,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  )
                : Expanded(
                    child: Image.asset('assets/images/errors.png'),
                  ),
          ],
        ),
      ),
    );
  }
}
