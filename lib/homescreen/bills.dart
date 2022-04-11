import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Billis extends StatelessWidget {
  const Billis({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(child: Scaffold(
      appBar: AppBar(
         automaticallyImplyLeading: false,
        backgroundColor: Color(0XFF738878),
        elevation: 0,
        title:Text("Bills",style: TextStyle(fontSize: 25,letterSpacing: 1),) ,
        centerTitle: true,
      ),
      body:ListView.builder(
                // physics: NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                scrollDirection: Axis.vertical,
                itemBuilder: (context, index) {
                return 
              
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
                               width: MediaQuery.of(context).size.width*0.42,
                             ),
                             Container(
                               height: 80,
                               width: 80,
                               decoration: BoxDecoration(
                                 borderRadius: BorderRadius.circular(200),
                                 color: Colors.green
                               ),
                               child: Icon(Icons.check,color: Colors.white,size:35 ,),
                             )
                           
                          ],
                        ),
                          Text("Amount",style: GoogleFonts.montserrat(color: Colors.black,fontSize: 22),),
                          SizedBox(
                            height: 10,
                          ),
                            Text("Payment Option",style: GoogleFonts.montserrat(color: Colors.black,fontSize: 22),),
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
      
      ));
  }
}