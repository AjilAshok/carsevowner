import 'package:carsevowner/controller/ownerservice.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:intl/intl.dart';
class Trackpage extends StatelessWidget {
   Trackpage({ Key? key,required this.username,required this.latitude,required this.logitude,required this.index,required this.currentuserid,required this.docid }) : super(key: key);
  TextEditingController workdone=TextEditingController();
   TextEditingController sparechange=TextEditingController();
    TextEditingController amount=TextEditingController();
    final _formKey = GlobalKey<FormState>();
    final List<Marker> markers =  [];
    var username;
    var latitude;
    var logitude;
    int index;
    var currentuserid;
    var docid;
    

  @override
  Widget build(BuildContext context) {
   
    Get.put(Ownerservice());
    return SafeArea(child: Scaffold(
      backgroundColor: Color(0XFF3D433E),
      body:Form(
        key: _formKey,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                color: Colors.blue,
                height: MediaQuery.of(context).size.height/2,
                child: GetBuilder<Ownerservice>(
      
                  builder: (controller) => 
                   GoogleMap(
                    mapType: MapType.normal,
                    markers:controller.markers,
                    
                    onMapCreated: controller.map(long:logitude,lat: latitude,title: username ),
                    initialCameraPosition: CameraPosition(
                        target: LatLng(
                          latitude,logitude),
                        zoom: 10.0),
                  ),
                ),
        
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Text("Works",style: TextStyle(color: Colors.white,fontSize: 30,letterSpacing:1),),
              ),
               Padding(
                  padding:
                      const EdgeInsets.all(10),
                  child: TextFormField(
                    controller: workdone,
                    validator: (value){
                      if (value==null||value.isEmpty) {
                        return "Enter details";
                        
                      }
                    },
                    style: TextStyle(color: Colors.white),
                    decoration: InputDecoration(
                      hintText: "Work Done",
                      hintStyle: TextStyle(color: Colors.white),
                      enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(12.0)),
                          borderSide: BorderSide(color: Color(0xFF008000), width: 1)),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10.0)),
                        borderSide: BorderSide(color: Color(0xFF008000)),
                      ),
                    ),
                  ),
                ),
                 Padding(
                  padding:
                      const EdgeInsets.all(10),
                  child: TextFormField(
                  controller: sparechange,
                     validator: (value){
                      if (value==null||value.isEmpty) {
                        return "Enter details";
                        
                      }
                    },
                    style: TextStyle(color: Colors.white),
                    decoration: InputDecoration(
                      hintText: "Spare change",
                      hintStyle: TextStyle(color: Colors.white),
                      enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(12.0)),
                          borderSide: BorderSide(color: Color(0xFF008000), width: 1)),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10.0)),
                        borderSide: BorderSide(color: Color(0xFF008000)),
                      ),
                    ),
                  ),
                ),
                   Padding(
                  padding:
                      const EdgeInsets.all(10),
                  child: Container(
                      height: 60,
                      width: double.infinity,
                      // margin: const EdgeInsets.only(right: 20.0, left: 20),
                      // padding: const EdgeInsets.all(15.0),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12),
                          border: Border.all(color: Color(0xFF008000))),
                      child: Padding(
                        padding: const EdgeInsets.only(top: 15, left: 12),
                        child: GetBuilder<Ownerservice>(
                          builder: (controller) => 
                           Text(
                             DateFormat('dd-MM-yyyy').format( DateTime.now()),
                          
                            
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                      ),
                    ),
                ),
                   Padding(
                  padding:
                      const EdgeInsets.all(10),
                  child: TextFormField(
                    keyboardType: TextInputType.number,
                    controller: amount,
                       validator: (value){
                      if (value==null||value.isEmpty) {
                        return "Enter details";
                        
                      }
                    },
                    style: TextStyle(color: Colors.white),
                    decoration: InputDecoration(
                      hintText: "Amount",
                      hintStyle: TextStyle(color: Colors.white),
                      enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(12.0)),
                          borderSide: BorderSide(color: Color(0xFF008000), width: 1)),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10.0)),
                        borderSide: BorderSide(color: Color(0xFF008000)),
                      ),
                    ),
                  ),
                ),
                 Center(
                              child: SizedBox(
                                width: 180,
                                height: 50,
                                child: ElevatedButton(
                                  style: ButtonStyle(
                                    backgroundColor: MaterialStateProperty.all(
                                        Color(0xFF62A769)),
                                  ),
                                  onPressed: ()async {
                                    if(_formKey.currentState!.validate()){
                                      await addamount();
                                      // Navigator.pop(context);

                                    }
                                  //  Navigator.push(context,MaterialPageRoute(builder: (context) => Trackpage(),));
                                  },
                                  child: Text(
                                    "Add",
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 20,
                                        letterSpacing: 1),
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 20,
                            )
            ],
          ),
        ),
      ),
    ));
  }
  addamount()async{
    final owernerid=FirebaseAuth.instance.currentUser!.uid;
    CollectionReference amoutform =
        FirebaseFirestore.instance.collection("Amountform");
        return amoutform.add({
          "username":username,
          "workdone":workdone.text,
          "sparechange":sparechange.text,
          "date":DateTime.now().millisecondsSinceEpoch,
          "amount":amount.text,
          "currenuserid":currentuserid,
          "ownerid":owernerid,


        }).then((value){
          workdone.clear();
          sparechange.clear();
          amount.clear();

        });
    

        // FirebaseFirestore.instance.collection("Accepted").up

  }
 
}

