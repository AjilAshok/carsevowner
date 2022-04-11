

import 'package:carsevowner/controller/ownerservice.dart';
import 'package:carsevowner/model/pushnotification.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:get/get_connect/http/src/utils/utils.dart';
import 'package:get/get_instance/get_instance.dart';
import 'package:get/route_manager.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:native_notify/native_notify.dart';
import 'package:overlay_support/overlay_support.dart';

class Requestpage extends StatefulWidget {
  const Requestpage({Key? key}) : super(key: key);

  @override
  State<Requestpage> createState() => _RequestpageState();
  
}

class _RequestpageState extends State<Requestpage> {
  @override
   final user = FirebaseAuth.instance.currentUser;
  //   late FirebaseMessaging _meassaging;


  //   Pushnotification? notification;
  //   void register()async{
  //     _meassaging=FirebaseMessaging.instance; 
  //     NotificationSettings settings=await _meassaging.requestPermission(
  //       alert: true,
  //       sound: true,
  //       provisional: false,
  //       badge: true
  //     );
  //     if (settings.authorizationStatus==AuthorizationStatus.authorized) {
  //       print("user granted the permmisiom");
        
  //       FirebaseMessaging.onMessage.listen((RemoteMessage message) { 

  //         Pushnotification notification=Pushnotification(
  //           title: message.notification!.title,
  //           body: message.notification!.body,
  //           datatitle: message.data['title'],
  //           databody: message.data['body'],
  //         );
  //         if (notification !=null) {
  //           showSimpleNotification(
  //             Text(notification.title.toString()),
  //             subtitle: Text(notification.body.toString()),
  //             duration: Duration(seconds: 3)
  //           );
            
  //         }
       
  //       });

        
  //     }
  //   }
  void initState() {
    // TODO: implement initState
    super.initState();
   
    
  }
  @override
  Widget build(BuildContext context) {
   
    // print(user);
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Color(0XFF738878),
        elevation: 0,
        title: Text(
          "Request",
          style: TextStyle(fontSize: 25, letterSpacing: 1),
        ),
        centerTitle: true,
      ),
      body: StreamBuilder<QuerySnapshot>(
          stream: FirebaseFirestore.instance
              .collection('Userform')
              .where("owerid", isEqualTo: user!.uid)
              .snapshots(),
          builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
            if (snapshot.hasError) {
              return Center(
                child: CircularProgressIndicator(),
              );
            }

            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(
                child: CircularProgressIndicator(),
              );
            }
            if (snapshot.data!.docs.isEmpty) {
              return Center(child: Text("No request"));
            }
           
            
              return SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      padding: EdgeInsets.all(10),
                      child: Text(
                        "Accept your request",
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 20,
                            fontStyle: FontStyle.italic),
                      ),
                    ),
                    SizedBox(
                      // height: 200,
                      child: ListView.builder(
                        physics: NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        scrollDirection: Axis.vertical,
                        itemBuilder: (context, index) {
                          // if (snapshot.connectionState==ConnectionState.waiting) {
                          //   return Center(
                          //     child: CircularProgressIndicator(),
                          //   );
                          // }
                         

                          final ownerdeails = snapshot.data!.docs[index];
                       
                          

                          return
                              // Container(
                              //   margin: EdgeInsets.all(10),
                              //   decoration: BoxDecoration(
                              //    color: Colors.red,
                              //     borderRadius: BorderRadius.circular(8)
                              //   ),
                              //   height: 150,
                              //   child:
                              Padding(
                            padding: const EdgeInsets.only(left: 10, right: 10),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Divider(
                                  thickness: 1,
                                  color: Colors.black,
                                ),
                                Text(
                                  ownerdeails['username'],
                                  style: GoogleFonts.montserrat(
                                      color: Colors.black, fontSize: 22),
                                ),
                                SizedBox(
                                  height: 1,
                                ),
                                Row(
                                  children: [
                                    FittedBox(
                                      child: Text(
                                        ownerdeails['issues'],
                                        style: GoogleFonts.montserrat(
                                            color: Colors.black, fontSize: 22),
                                      ),
                                    ),
                                 Spacer(),
                                    SizedBox(
                                      width: 120,
                                      height: 50,
                                      child: FittedBox(
                                        child: ElevatedButton(
                                          style: ButtonStyle(
                                            backgroundColor:
                                                MaterialStateProperty.all(
                                                    Color(0xFF62A769)),
                                          ),
                                          onPressed: ()async {
                                            //  yourIndiePushSendingFunction();
                                           
                                           await accepted(ownerdeails);
                                           FirebaseFirestore.instance.collection('Userform').doc(ownerdeails.id).delete().then((value) => print("delete"));
                                          },
                                          child: Text(
                                            "Accept",
                                            style: TextStyle(
                                                color: Colors.black,
                                                fontSize: 20,
                                                letterSpacing: 1),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                Text(
                                  ownerdeails['userlocation'],
                                  style: GoogleFonts.montserrat(
                                      color: Colors.black, fontSize: 22),
                                ),
                                 Padding(
                                   padding: const EdgeInsets.only(top: 10),
                                   child: Text(ownerdeails['work'],style: GoogleFonts.montserrat(color: Colors.black,fontSize: 22),),
                                 ),
                                   Padding(
                                   padding: const EdgeInsets.only(top: 10),
                                   child: Text(ownerdeails['Manufacture'],style: GoogleFonts.montserrat(color: Colors.black,fontSize: 22),),
                                 ),
                                   Row(
                                     children: [
                                       Padding(
                                       padding: const EdgeInsets.only(top: 10),
                                       child: Text(ownerdeails['model'],style: GoogleFonts.montserrat(color: Colors.black,fontSize: 22),),
                                 ),
                                 Spacer(),
                                   SizedBox(
                                      width: 120,
                                      height: 50,
                                      child: FittedBox(
                                        child: ElevatedButton(
                                          style: ButtonStyle(
                                            backgroundColor:
                                                MaterialStateProperty.all(
                                                    Color(0xFF62A769)),
                                          ),
                                          onPressed: ()async {
                                          
                                           
                                           await rejected(ownerdeails);
                                           FirebaseFirestore.instance.collection('Userform').doc(ownerdeails.id).delete().then((value) => print("deletereject"));
                                          },
                                          child: Text(
                                            "Reject",
                                            style: TextStyle(
                                                color: Colors.black,
                                                fontSize: 20,
                                                letterSpacing: 1),
                                          ),
                                        ),
                                      ),
                                    ),
                                     ],
                                   ),
                                   Padding(
                                   padding: const EdgeInsets.only(top: 10),
                                   child: Text(ownerdeails['year'],style: GoogleFonts.montserrat(color: Colors.black,fontSize: 22),),
                                 ),

                                Divider(
                                  thickness: 1,
                                  color: Colors.black,
                                ),
                              ],
                            ),
                          );
                        },
                        itemCount: snapshot.data!.docs.length,
                      ),
                    )
                  ],
                ),
              );
            
            
          }),
    ));
  }

  accepted(details)async{
    final contoler=Get.put(Ownerservice());
    
    // print(details['currenuserid']);
     CollectionReference accepetform =
        FirebaseFirestore.instance.collection("Accepted");
        return accepetform.add({
       
          "nameuser":details['username'],
          "complaint":details['issues'],
          "works":details['work'],
          "location":details['userlocation'],
          "year":details['year'],
          "manufuture":details['Manufacture'],
          "model":details['model'],
          "ownerlocation":details['location'],
          "shopname":details['shopname'],
          "ownername":details['ownername'],
          "currentuserid":details['currenuserid'],
          "latitude":details['latitude'],
          "longitude":details['logitude'],
          "ownerlatitde":contoler.latitude,
          "ownerlongitude":contoler.longitude,
          "date":DateFormat('dd-MM-yyyy').format(DateTime.now())

          

          


        }).then((value) => print('accpeted form'));
      

  }
   rejected(details)async{
    final contoler=Get.put(Ownerservice());
    
    // print(details['currenuserid']);
     CollectionReference rejectedform =
        FirebaseFirestore.instance.collection("Rejected");
        return rejectedform.add({
       
          "nameuser":details['username'],
          "complaint":details['issues'],
          "works":details['work'],
          "location":details['userlocation'],
          "year":details['year'],
          "manufuture":details['Manufacture'],
          "model":details['model'],
          "ownerlocation":details['location'],
          "shopname":details['shopname'],
          "ownername":details['ownername'],
          "currentuserid":details['currenuserid'],
          "latitude":details['latitude'],
          "longitude":details['logitude'],
          "ownerlatitde":contoler.latitude,
          "ownerlongitude":contoler.longitude,
          "date":DateFormat('dd-MM-yyyy').format(DateTime.now())

          

          


        }).then((value) => print('rejected form'));
      

  }
//     void yourIndiePushSendingFunction() {
    
//     NativeNotify.sendIndieNotification(472, 'qMMR6PMv5Lfht6dCRrmQzA', '4', 'your_title', 'your_body', null, null);
//     // yourAppID, yourAppToken, 'your_sub_id', 'your_title', 'your_body' is required
//     // put null in any other parameter you do NOT want to use
// }
}
