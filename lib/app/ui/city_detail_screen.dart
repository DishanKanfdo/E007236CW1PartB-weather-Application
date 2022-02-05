import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/all.dart';
import 'package:open_weather_app/app/ui/side_menu/side_menu.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:http/http.dart' as http;

class CityDetailsScreen extends StatefulWidget {
  CityDetailsScreen({Key? key, required this.name}) : super(key: key);
  String name;

  @override
  _CityDetailsScreenState createState() => _CityDetailsScreenState();
}

class _CityDetailsScreenState extends State<CityDetailsScreen> {
  Map data = {};

  getData() async {
    print(widget.name);
    http.Response response = await http.get(Uri.parse(
        'https://api.openweathermap.org/data/2.5/weather?q=' +
            widget.name +
            '&appid=c143a889158143409812493635536d1b'));
    try {
      setState(() {
        data = jsonDecode(response.body);
      });
    } catch (e) {
      return 'failed';
    }
  }

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance!.addPostFrameCallback((_) {
      getData();
    });
    getData();
  }

  @override
  Widget build(BuildContext context) {
    // final viewModal = watch(specificCityDetails);
    return Scaffold(
        drawer: const SideMenu(),
        // appBar: AppBar(),
        body: Stack(
          children: <Widget>[
            Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                  colorFilter: ColorFilter.mode(
                      Colors.black.withOpacity(0.75), BlendMode.dstATop),
                  image: AssetImage('assets/images/diff.jpg'),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            AppBar(

              backgroundColor: Colors.transparent,
              elevation: 0,
              leading: Builder(
                builder: (context) => // Ensure Scaffold is in context
                    IconButton(
                        icon: const Icon(Icons.menu),
                        onPressed: () => Scaffold.of(context).openDrawer()),
              ),
            ),
            Center(
                child: data.isEmpty
                    ? Center(
                        child: Container(
                          height: 50.0,
                          width: 50.0,
                          child: CircularProgressIndicator(),
                        ),
                      )
                    : SizedBox(
                        width: 350.0,
                        height: 500.0,
                        child: Card(
                            color: Colors.green,
                            child: Column(
                              children: [
                                // Text(widget.name),
                                Text(data["name"].toString(),
                                    style: const TextStyle(
                                        fontSize: 38.0,
                                        color: Colors.white,
                                        fontWeight: FontWeight.w900,
                                        fontStyle: FontStyle.italic)),
                                Row(
                                  children: [
                                    Padding(
                                        padding: const EdgeInsets.all(5.0),
                                        child: Image.network(
                                          "http://openweathermap.org/img/w/" +
                                              data["weather"][0]["icon"] +
                                              ".png",
                                          height: 100,
                                          width: 80,
                                          fit: BoxFit.cover,
                                        )),
                                    Flexible(
                                        child: Container(
                                            //apply margin and padding using Container Widget.
                                            padding: const EdgeInsets.all(20),
                                            //You can use EdgeInsets like above
                                            margin: const EdgeInsets.symmetric(
                                                vertical: 5.0,
                                                horizontal: 15.0),
                                            child: Text(
                                                data["weather"][0]
                                                        ["description"]
                                                    .toString(),
                                                style: const TextStyle(
                                                    fontSize: 20.0,
                                                    color: Colors.white,
                                                    fontWeight:
                                                        FontWeight.w900)))),
                                  ],
                                ),
                                const Divider(
                                  color: Colors.white,
                                  height: 50,
                                ),
                                Row(
                                  children: [
                                    const Padding(
                                        padding: EdgeInsets.all(15.0),
                                        child: Icon(
                                          FontAwesomeIcons.wind,
                                          size: 50, //Icon Size
                                          color: Colors.grey, //Color Of Icon
                                        )),
                                    Container(
                                      //apply margin and padding using Container Widget.
                                      padding: const EdgeInsets.all(20),
                                      //You can use EdgeInsets like above
                                      margin: const EdgeInsets.symmetric(
                                          vertical: 5.0, horizontal: 50.0),
                                      child: Text(
                                        data["wind"]["speed"].toString(),
                                        style: const TextStyle(
                                            fontSize: 20.0,
                                            color: Colors.white,
                                            fontWeight: FontWeight.w900),
                                      ),
                                    ),
                                  ],
                                ),
                                const Divider(
                                  color: Colors.white,
                                  height: 50,
                                ),
                                Row(
                                  children: [
                                    const Padding(
                                        padding: EdgeInsets.all(20.0),
                                        child: Icon(
                                          FontAwesomeIcons.temperatureHigh,
                                          size: 50, //Icon Size
                                          color: Colors.red, //Color Of Icon
                                        )),
                                    Container(
                                      //apply margin and padding using Container Widget.
                                      padding: const EdgeInsets.all(20),
                                      //You can use EdgeInsets like above
                                      margin: const EdgeInsets.symmetric(
                                          vertical: 5.0, horizontal: 25.0),
                                      child: Text(
                                        data["main"]["temp"].toString(),
                                        style: const TextStyle(
                                            fontSize: 20.0,
                                            color: Colors.white,
                                            fontWeight: FontWeight.w900),
                                      ),
                                    )
                                  ],
                                ),
                              ],
                            )),
                      ))
          ],
        ));
  }
}
