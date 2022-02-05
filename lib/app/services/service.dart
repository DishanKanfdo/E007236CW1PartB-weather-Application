import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:open_weather_app/app/model/city_model.dart';
import 'package:open_weather_app/app/util/util_api.dart';
import 'package:http/http.dart' as http;
// final cityDetailsStateFuture = ChangeNotifierProvider<FetchCityDetails>((ref)=>FetchCityDetails());


class FetchCityDetails extends ChangeNotifier {
  List<CityModel> cityModel = [];
  List Cities = [];
  FetchCityDetails(){
    print(cityModel);
    print("Helllloooooooooooooooooooooo");
    getData();
  }

  Future getData() async {
    http.Response response = await http.get(Uri.parse(API_DETAILS_URL));
    List items = jsonDecode(response.body);
    for(int i=0; i< items.length; i++){
      Cities.add(items[i]);
    }
  }


}


class FetchColomboCityDetails extends ChangeNotifier {
    List colomboDetails =[] ;
  FetchColomboCityDetails(){
    print('//////////////////');
    print('colomboDetails');
    getColomboDetails();
  }

  Future getColomboDetails() async {
    http.Response response = await http.get(Uri.parse(COLOMBO_URL));
    final items = jsonDecode(response.body);

    print("getColomboDetails");
    print(items);

    // colomboDetails = items;
    colomboDetails.add(items);
    print(colomboDetails[0]["weather"][0]["main"]);
    print(colomboDetails[0]);

    // colomboDetails.add(items['main']);
    // colomboDetails.add(items['wind']);
    // for(int i=0; i< items.length; i++){
    //   print(items[i]);
    //   // colomboDetails.add(items[i]);
    // }
  }
}



class FetchColomboCity5DayDetails extends StateNotifier {
  List<Map<String, dynamic>> colomboDetails =[] ;
  // FetchColomboCity5DayDetails() : super(null){
  //   print('//////////////////');
  //   print('colomboDetails');
  //   getColombo5DayForeCastDetails();
  // }
  FetchColomboCity5DayDetails() : super(null);
  Future getColombo5DayForeCastDetails() async {
    http.Response response = await http.get(Uri.parse(COLOMBO_5DAY_FORECAST));
    final items = jsonDecode(response.body);

    // colomboDetails = items.list;
    colomboDetails.add(items);
    // print(colomboDetails[0]["weather"][0]["main"]);
    print(colomboDetails[0]['list'][0]['dt_txt']);

  }
}

class colomboDetails {
}


getFetchSpecificCityDetails(city) async {
  print('name name name');
  print(city);
  http.Response response = await http.get(Uri.parse('https://api.openweathermap.org/data/2.5/weather?q='+ city +'&appid=c143a889158143409812493635536d1b'));
  final items = jsonDecode(response.body);
  print(items);
  // colomboDetails = items.list;
  print('searchDetails');

}