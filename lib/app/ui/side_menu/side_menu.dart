import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import '../carousel_list.dart';
import '../home_view.dart';
import '../main_screen.dart';
import '../temperature.dart';

class SideMenu extends StatelessWidget {
  const SideMenu({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {


    return Drawer(
     backgroundColor: Colors.grey,






      child: ListView(




        padding: const EdgeInsets.all(16.0),





        children: <Widget>[

          const DrawerHeader(




            child: Text(

              'Weather Today',

              style: TextStyle(color: Colors.yellow, fontSize: 35),
            ),
            decoration: BoxDecoration(


              image: DecorationImage(
                colorFilter: ColorFilter.mode(
                    Colors.black, BlendMode.dstATop),
                image: AssetImage('assets/images/cloud.jpg'),
                fit: BoxFit.cover,
              ),


            )
          ),


          ListTile(
            tileColor: Colors.lightGreen,

            leading: const Icon(Icons.house_sharp),
            title: const Text('Home'),
            onTap: () => {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const MainScreen()),
              )
            },
          ),
          ListTile(
            tileColor: Colors.yellow,
            leading: const Icon(Icons.ten_mp),
            title: const Text('City Temperature'),
            onTap: () => {Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const TemCity()),
            )},
          ),


          ListTile(
            tileColor: Colors.lightGreenAccent,
            leading: const Icon(Icons.lock_clock),
            title: const Text('5 Day / 3 Hour Forecast'),
            onTap: () => {Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const CarouselList()),
            )},
          ),
          ListTile(
            tileColor: Colors.yellow,

            leading: const Icon(Icons.location_city),
            title: const Text('City List'),
            onTap: () => {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const HomeView()),
              )
            },
          )

        ],
      ),

    );

  }

}


