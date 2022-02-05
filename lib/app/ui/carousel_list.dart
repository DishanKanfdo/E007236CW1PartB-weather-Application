import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/all.dart';
import 'package:open_weather_app/app/ui/side_menu/side_menu.dart';
import 'package:http/http.dart' as http;
import 'carousal.dart';

class CarouselList extends StatefulWidget {
  const CarouselList({Key? key}) : super(key: key);

  @override
  _CarouselListState createState() => _CarouselListState();
}

class _CarouselListState extends State<CarouselList> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance!.addPostFrameCallback((_) {
      search();
    });
  }

  int currentPage = 0;
  Map data = {};
  TextEditingController searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: SafeArea(
            child: Scaffold(
                resizeToAvoidBottomInset: false,
                drawer: const SideMenu(),
                appBar: AppBar(
                  backgroundColor: Colors.grey[900],
                  elevation: 0,
                  leading: Builder(
                    builder: (context) => // Ensure Scaffold is in context
                        IconButton(
                            icon: const Icon(
                              Icons.menu,
                              color: Colors.white,
                            ),
                            onPressed: () => Scaffold.of(context).openDrawer()),
                  ),
                ),
                body: Stack(children: [
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
                  Center(
                      child: data.isEmpty
                          ? Center(
                              child: Container(
                                height: 50.0,
                                width: 50.0,
                                child: CircularProgressIndicator(),
                              ),
                            )
                          : Container(
                              child: Column(children: [
                              Padding(
                                // fromLTRB(right, bottom, left, top)
                                padding:
                                    const EdgeInsets.fromLTRB(12, 0, 12, 15),
                                child: TextField(
                                  autofocus: false,
                                  controller: searchController,
                                  cursorColor: Colors.black,
                                  decoration: InputDecoration(
                                      hintText: " Search here...",
                                      // border: InputBorder.none,
                                      suffixIcon: IconButton(
                                        icon: Icon(Icons.search),
                                        color: Color.fromRGBO(93, 25, 72, 1),
                                        onPressed: () {
                                          search();
                                        },
                                      )),
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 15.0),
                                  onChanged: (content) {
                                    search();
                                  },
                                ),
                              ),
                              ('200' == data['cod'])
                                  ? Text(data['city']['name'],
                                      style: const TextStyle(
                                          fontSize: 25.0,
                                          color: Colors.red,
                                          fontWeight: FontWeight.w900,
                                          fontStyle: FontStyle.italic))
                                  : Container(
                                      child: Text('No Data Found'),
                                    ),
                              const Text("5 Day / 3 Hour-Weather-Forecast",
                                  style: TextStyle(
                                      fontSize: 17.0,
                                      color: Colors.yellow,
                                      fontWeight: FontWeight.w900,
                                      fontStyle: FontStyle.italic)),
                              ('200' == data['cod'])
                                  ? Container(
                                      height:
                                          MediaQuery.of(context).size.height *
                                              0.6,
                                      width: double.infinity,
                                      child: PageView.builder(
                                        itemBuilder: (context, index) {
                                          return Opacity(
                                            opacity: currentPage == index
                                                ? 1.0
                                                : 0.8,
                                            child: CarouselCard(
                                              car: index,
                                              data: data,
                                            ),
                                          );
                                        },
                                        // itemCount: 5,
                                        itemCount: data['list'].length,
                                        controller: PageController(
                                            initialPage: 0,
                                            viewportFraction: 0.75),
                                        onPageChanged: (index) {
                                          setState(() {
                                            currentPage = index;
                                          });
                                        },
                                      ),
                                    )
                                  : Container(
                                      child: Text(''),
                                    )
                            ])))
                ]))));
  }

  search() async {
    var text = 'Colombo';
    print('search');
    var searchText = searchController.text.toLowerCase();
    print('' == searchText);
    http.Response response = await http.get(Uri.parse(
        'https://api.openweathermap.org/data/2.5/forecast?q=' +
            ('' == searchText ? text : searchText) +
            '&appid=cbd8206380cf907632707690f4d9971b'));

    print('/////////////////////////// sonDecode(response.body');
    print('200' == jsonDecode(response.body)['cod']);
    // print(jsonDecode(response.body).cod);
    setState(() {
      data = jsonDecode(response.body);
    });
  }
}
