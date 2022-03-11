import 'package:carsevowner/bottomnav/bottomnav.dart';
import 'package:carsevowner/controller/ownerservice.dart';
import 'package:carsevowner/homescreen/homescreen.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';
import 'package:google_fonts/google_fonts.dart';

class Registrationpage extends StatelessWidget {
  Registrationpage({Key? key}) : super(key: key);
  final types = [" Bike", "Car"];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: Text(
          "Register Your shop",
          style: GoogleFonts.aclonica(fontSize: 20, color: Color(0XFF72E77E)),
        ),
        centerTitle: true,
        elevation: 0,
        backgroundColor: Color(0XFF738878),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: MediaQuery.of(context).size.height * 0.4,
              decoration: BoxDecoration(
                  color: Colors.amber,
                  borderRadius: BorderRadius.circular(20),
                  image: DecorationImage(
                      image: AssetImage("assets/team-profile.jpg"),
                      fit: BoxFit.fill)),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 20, right: 25, left: 25),
              child: TextFormField(
                decoration: InputDecoration(
                  hintText: "Shop name",
                  hintStyle: TextStyle(color: Colors.white),
                  enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(12.0)),
                      borderSide:
                          BorderSide(color: Color(0xFF008000), width: 1)),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10.0)),
                    borderSide: BorderSide(color: Color(0xFF008000)),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 20, right: 25, left: 25),
              child: TextFormField(
                decoration: InputDecoration(
                  hintText: "Phone number",
                  hintStyle: TextStyle(color: Colors.white),
                  enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(12.0)),
                      borderSide:
                          BorderSide(color: Color(0xFF008000), width: 1)),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10.0)),
                    borderSide: BorderSide(color: Color(0xFF008000)),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 20, right: 25, left: 25),
              child: TextFormField(
                decoration: InputDecoration(
                  hintText: "Owner Name",
                  hintStyle: TextStyle(color: Colors.white),
                  enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(12.0)),
                      borderSide:
                          BorderSide(color: Color(0xFF008000), width: 1)),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10.0)),
                    borderSide: BorderSide(color: Color(0xFF008000)),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 20, right: 25, left: 25),
              child: TextFormField(
                decoration: InputDecoration(
                  hintText: "Email",
                  hintStyle: TextStyle(color: Colors.white),
                  enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(12.0)),
                      borderSide:
                          BorderSide(color: Color(0xFF008000), width: 1)),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10.0)),
                    borderSide: BorderSide(color: Color(0xFF008000)),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 20, right: 25, left: 25),
              child:  Container(
                height: 60,
                width: double.infinity,
                // margin: const EdgeInsets.only(right: 20.0, left: 20),
                padding: const EdgeInsets.all(12.0),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(color: Color(0xFF008000))),
                child: Text(
                  "Location",
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
            GetBuilder<Ownerservice>(
              init: Ownerservice(),
              builder: (controller) => Padding(
                padding:
                    EdgeInsets.only(top: 20, right: 25, left: 25, bottom: 10),
                child: Theme(
                  data: Theme.of(context).copyWith(
                    canvasColor: Colors.black,
                  ),
                  child: Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(12.0)),
                        border: Border.all(color: Color(0xFF008000))),
                    child: DropdownButtonHideUnderline(
                      child: DropdownButton(
                        hint: Text(
                          "Type",
                          style: TextStyle(color: Colors.white),
                        ),
                        isExpanded: true,
                        iconEnabledColor: Color(0xFF008000),
                        value: controller.values,
                        // items: years.map(buildmenu).toList(),
                        onChanged: (value) {
                          controller.dropdowntype(value);
                        },
                        items: types.map((String value) {
                          return DropdownMenuItem(
                              value: value,
                              child: Text(value,
                                  style: TextStyle(
                                      color:
                                          Color.fromARGB(255, 250, 250, 250))));
                        }).toList(),
                      ),
                    ),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 10, right: 25, left: 25),
              child: Container(
                height: 60,
                width: double.infinity,
                // margin: const EdgeInsets.only(right: 20.0, left: 20),
                padding: const EdgeInsets.all(12.0),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(color: Color(0xFF008000))),
                child: Text(
                  "Shop license proof",
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 15, left: 25),
              child: Text(
                "Works",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 25,
                  decoration: TextDecoration.underline,
                  decorationColor: Color(0xFF008000),
                  decorationThickness: 2,
                ),
              ),
            ),
            GetBuilder<Ownerservice>(
              init: Ownerservice(),
              builder: (controller) => Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  checkbox("Enginework", controller.Enginework, controller),
                  checkbox("Oilchange", controller.Oilchange, controller),
                ],
              ),
            ),
            GetBuilder<Ownerservice>(
              init: Ownerservice(),
              builder: (controller) => Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  checkbox("Brekdown", controller.breakdown, controller),
                  checkbox("Carwash", controller.carwash, controller),
                ],
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Center(
                child: SizedBox(
              width: 180,
              height: 50,
              child: ElevatedButton(
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(Color(0xFF62A769)),
                ),
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => Bottomnav(),
                      ));
                },
                child: Text(
                  "Register",
                  style: TextStyle(
                      color: Colors.black, fontSize: 20, letterSpacing: 1),
                ),
              ),
            )),
            SizedBox(
              height: 20,
            ),
          ],
        ),
      ),
    ));
  }

  Widget checkbox(String title, bool boolValue, Ownerservice control) {
    return Padding(
      padding: const EdgeInsets.only(left: 20),
      child: Row(
        // mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            title,
            style: TextStyle(color: Colors.white, fontSize: 20),
          ),
          Checkbox(
            activeColor: Color(0xFF008000),
            value: boolValue,
            onChanged: (value) {
              control.chekbox(title, value!);
            },
          )
        ],
      ),
    );
  }
}
