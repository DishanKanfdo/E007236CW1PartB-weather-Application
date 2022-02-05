import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:open_weather_app/app/services/service.dart';

final cityDetailsStateFuture = ChangeNotifierProvider<FetchCityDetails>((ref)=>FetchCityDetails());
final colomboDetails = ChangeNotifierProvider<FetchColomboCityDetails>((ref)=>FetchColomboCityDetails());
final colombo5DayForecastDetails = StateNotifierProvider((ref) => FetchColomboCity5DayDetails());








