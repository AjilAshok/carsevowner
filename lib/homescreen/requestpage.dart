import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Requestpage extends StatelessWidget {
  const Requestpage({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(child: Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0XFF738878),
        elevation: 0,
        title:Text("Request",style: TextStyle(fontSize: 25,letterSpacing: 1),) ,
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: EdgeInsets.all(10),
              child: Text("Accept your request",style: TextStyle(color: Colors.black,fontSize: 20,fontStyle:FontStyle.italic  ),),
            ), 
            SizedBox(
              // height: 200,
              child: ListView.builder(
                physics: NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                scrollDirection: Axis.vertical,
                itemBuilder: (context, index) {
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
                    padding: const EdgeInsets.only(left: 10,right: 10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Divider(
                         
                         
                          thickness: 1,
                          color: Colors.black,
                        ),
                        Text("Name of User",style: GoogleFonts.montserrat(color: Colors.black,fontSize: 22),),
                        SizedBox(
                          height: 5,
                        ),
                        Row(
                          children: [
                         
                             Text("Complaint",style: GoogleFonts.montserrat(color: Colors.black,fontSize: 22),),
                             SizedBox(
                               width: MediaQuery.of(context).size.width*0.32,
                             ),
                             SizedBox(
                              width: 120,
                              height: 50,
                              child: ElevatedButton(
                                style: ButtonStyle(
                                  backgroundColor: MaterialStateProperty.all(
                                      Color(0xFF62A769)),
                                ),
                                onPressed: () {},
                                child: Text(
                                  "Accept",
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 20,
                                      letterSpacing: 1),
                                ),
                              ),
                            ),
                          ],
                        ),
                          Text("Location",style: GoogleFonts.montserrat(color: Colors.black,fontSize: 22),),
                            Divider(
                          thickness: 1,
                          color: Colors.black,
                        ),
                      ],
                      
                    ),
                  
                  
                 );
                  
      
              },
              itemCount: 5,
              ),
            )
          ],
        ),
      ),

    ));
  }
}