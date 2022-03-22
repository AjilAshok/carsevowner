import 'package:carsevowner/controller/ownerservice.dart';
import 'package:carsevowner/homescreen/bills.dart';
import 'package:carsevowner/homescreen/homescreen.dart';
import 'package:carsevowner/homescreen/profile.dart';
import 'package:carsevowner/homescreen/requestpage.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';

class Bottomnav extends StatelessWidget {
  static var id;

  Bottomnav({Key? key}) : super(key: key);

  final page = [Homescreen(), Requestpage(), Billis(), Profile()];

  // int currentindex = 0;

  @override
  Widget build(BuildContext context) {
    Get.put(Ownerservice());
    return SafeArea(
        child: GetBuilder<Ownerservice>(
      builder: (controller) => Scaffold(
        body: page[controller.currentindex],
        bottomNavigationBar: BottomNavigationBar(

            //  backgroundColor: Colors.black,
            currentIndex: controller.currentindex,
            unselectedFontSize: 10,
            selectedFontSize: 15,
            unselectedItemColor: Color.fromARGB(255, 31, 30, 30),
            type: BottomNavigationBarType.fixed,
            selectedItemColor: Colors.black,
            elevation: 0,
            onTap: (index) {
              controller.bottomnavbar(index);
            },
            items: const [
              BottomNavigationBarItem(
                label: "Home",
                icon: Icon(Icons.home),
              ),
              BottomNavigationBarItem(
                label: "Request",
                icon: Icon(FontAwesomeIcons.screwdriver),
              ),
              BottomNavigationBarItem(
                label: "Bills",
                icon: Icon(FontAwesomeIcons.rupeeSign),
              ),
              BottomNavigationBarItem(
                label: "Profile",
                icon: Icon(FontAwesomeIcons.userAlt),
              )
            ]),
      ),
    ));
    // SafeArea(
    //     child: Scaffold(
    //   backgroundColor: Color.fromARGB(255, 250, 249, 249),
    //   body: GetBuilder<Ownerservice>(
    //       builder: (controller) => page[controller.currentindex]),
    //   bottomNavigationBar: GetBuilder<Ownerservice>(
    //     builder: (controller) => BottomNavigationBar(

    //         //  backgroundColor: Colors.black,
    //         currentIndex: controller.currentindex,
    //         unselectedFontSize: 10,
    //         selectedFontSize: 15,
    //         unselectedItemColor: Color.fromARGB(255, 31, 30, 30),
    //         type: BottomNavigationBarType.fixed,
    //         selectedItemColor: Colors.black,
    //         elevation: 0,
    //         onTap: (index) {
    //           controller.bottomnavbar(index);
    //         },
    //         items: const [
    //           BottomNavigationBarItem(
    //             label: "Home",
    //             icon: Icon(Icons.home),
    //           ),
    //           BottomNavigationBarItem(
    //             label: "Request",
    //             icon: Icon(FontAwesomeIcons.screwdriver),
    //           ),
    //            BottomNavigationBarItem(
    //             label: "Bills",
    //             icon: Icon(FontAwesomeIcons.screwdriver),
    //           ),
    //           BottomNavigationBarItem(
    //             label: "Profile",
    //             icon: Icon(FontAwesomeIcons.userAlt ),
    //           )
    //         ]),
    //   ),
    // ));
  }
}
