import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Billis extends StatelessWidget {
  const Billis({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final userid = FirebaseAuth.instance.currentUser!.uid;
    print(userid);
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Color(0XFF738878),
        elevation: 0,
        title: Text(
          "Bills",
          style: TextStyle(fontSize: 25, letterSpacing: 1,color: Colors.black),
        ),
        centerTitle: true,
      ),
      body: StreamBuilder<QuerySnapshot>(
          stream: FirebaseFirestore.instance
              .collection('Bills')
              .where("ownerid", isEqualTo: userid)
              .snapshots(),
          builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(
                child: CircularProgressIndicator(),
              );
            }
            if (snapshot.data!.docs.isEmpty) {
              return Center(child: Text("No request"));
            }
            return ListView.builder(
              // physics: NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              scrollDirection: Axis.vertical,
              itemBuilder: (context, index) {
                final ownerdeails = snapshot.data!.docs[index];
                print(ownerdeails['amount']);

                return Padding(
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
                      // SizedBox(
                      //   height: 5,
                      // ),
                      Row(
                        children: [
                          Text(
                            ownerdeails['work'],
                            style: GoogleFonts.montserrat(
                                color: Colors.black, fontSize: 22),
                          ),
                         Spacer(),
                          Container(
                            height: 70,
                            width: 70,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(200),
                                color: Colors.green),
                            child: Icon(
                              Icons.check,
                              color: Colors.white,
                              size: 30,
                            ),
                          )
                        ],
                      ),
                      Text(
                        ownerdeails['amount'],
                        style: GoogleFonts.montserrat(
                            color: Colors.black, fontSize: 22),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        ownerdeails['paymentoption'],
                        style: GoogleFonts.montserrat(
                            color: Colors.black, fontSize: 22),
                      ),
                       SizedBox(
                        height: 10,
                      ),
                      Text(
                        ownerdeails['sparechanged'],
                        style: GoogleFonts.montserrat(
                            color: Colors.black, fontSize: 22),
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
            );
          }),
    ));
  }
}
