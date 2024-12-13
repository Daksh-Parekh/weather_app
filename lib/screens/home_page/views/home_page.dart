import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather_app/screens/home_page/provider/home_provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    context.read<HomeProvider>().WeatherData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Home Page"),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: context.watch<HomeProvider>().weatherList.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(
                      "${context.watch<HomeProvider>().weatherList[index].main}"),
                  subtitle: Text(
                      "${context.watch<HomeProvider>().weatherModel!.countryName}"),
                  trailing: Text(
                      "${context.watch<HomeProvider>().weatherModel!.mainModels!.tempMin}"),
                );
              },
            ),
          )
        ],
      ),
    );
  }
}
