// @dart=2.9
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:open_weather_app/app/state/state_management.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();

}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return  Center(
      child: Text("Seond screen"),
    );
//     final viewModal = watch(cityDetailsStateFuture);
//
//     return Scaffold(
//         appBar: AppBar(
//           title: const Text("Weather App"),
//           backgroundColor: Colors.indigo[900],
//         ),
//         body: SafeArea(
//           child: Column(
//             children: [
//               Consumer(
//                 builder: ((context,
//                     T Function<T>(ProviderBase<Object, T> provider) watch,
//                     child) {
//                   print("///////////////////////////////////#########");
//                   print(watch(cityDetailsStateFuture).data);
//                   // print(watch(cityDetailsStateFuture).data.value);
//                   // print(watch(cityDetailsStateFuture).data.value.list);
//
//                   return Expanded(child: Text("hghghcd"));
//
//                   //     child: watch(cityDetailsStateFuture).data == null
//                   //         ?
//                   //
//                   //     Center(
//                   //       // child:Text(watch(cityDetailsStateFuture).data.value.list.elementAt(index)),
//                   //       // child:Text(watch(cityDetailsStateFuture).data!.value!.list.elementAt(1).name.toString()),
//                   //       child: Container(
//                   //         height: 50.0,
//                   //         width: 50.0,
//                   //         child: Text(watch(cityDetailsStateFuture).data.toString()),
//                   //         // child: CircularProgressIndicator(),
//                   //       ),
//                   //     )
//                   //         : ListView.builder(
//                   //         itemCount: watch(cityDetailsStateFuture).data?.value?.list.length??0,
//                   //         // itemCount: watch(cityDetailsStateFuture).data!.value!.list.length == 0,
//                   //         // itemCount: 5,
//                   //         itemBuilder: (context, index){
//                   //           return Column(
//                   //             children: [
//                   //               Text(watch(cityDetailsStateFuture).data.value.list.elementAt(index).name),
//                   //               Text(watch(cityDetailsStateFuture).data.value.list.elementAt(index).id),
//                   //               Text(watch(cityDetailsStateFuture).data.value.list.elementAt(index).name),
//                   //               // Text(watch(cityDetailsStateFuture).data!.value!.name),
//                   //               // Text(index.toString())
//                   //             ],
//                   //           );
//                   //         }
//                   //     )
//                   // );
//                 }),
//               )
//             ],
//           ),
//         ));
  }
}
