import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/all.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
class CarouselCard extends ConsumerWidget {
  var car;
  var data;
  CarouselCard({Key? key, required this.car ,required this.data}) : super(key: key);
  @override
  Widget build(BuildContext context,watch) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.only(
          top: 5.0,
          left: 8.0,
          right: 8.0,
        ),
        child: Container(
          width: MediaQuery.of(context).size.width * 0.8,
          height: MediaQuery.of(context).size.height * 0.5,
          decoration: BoxDecoration(
            color: Colors.lightBlueAccent,
            borderRadius: BorderRadius.circular(16.0),
            boxShadow: const [
              BoxShadow(
                 offset: Offset(0, 20), blurRadius: 10.0),
            ],
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              // Spacer(),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: <Widget>[
                    Spacer(),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          data['list'][car]['dt_txt']
                            ,style: const TextStyle(
                            fontSize: 20.0,
                            color: Colors.black,
                            fontWeight: FontWeight.w900,
                            fontStyle: FontStyle.italic)
                        ),

                        Row(
                          children: [
                            Padding(
                                padding: const EdgeInsets.all(5.0),
                                child: Image.network(
                                  "http://openweathermap.org/img/w/" +
                                      data['list'][car]['weather'][0]['icon'] +
                                      ".png",
                                  height: 100,
                                  width: 80,
                                  fit: BoxFit.cover,
                                )),
                            Container(
                              //apply margin and padding using Container Widget.
                              //   padding: const EdgeInsets.all(20),
                                //You can use EdgeInsets like above
                                margin: const EdgeInsets.symmetric(
                                    vertical: 5.0, horizontal: 15.0),
                                child: Text(
                                    data['list'][car]['weather'][0]['description'],
                                    style: const TextStyle(
                                        fontSize: 18.0,
                                        color: Colors.white,
                                        fontWeight: FontWeight.w900))),
                          ],
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
                                data['list'][car]['wind']['speed'].toString(),
                                style: const TextStyle(
                                    fontSize: 20.0,
                                    color: Colors.white,
                                    fontWeight: FontWeight.w900),
                              ),
                            ),
                          ],
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
                                data['list'][car]['main']['temp'].toString(),
                                style: const TextStyle(
                                    fontSize: 20.0,
                                    color: Colors.white,
                                    fontWeight: FontWeight.w900),
                              ),
                            )
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
