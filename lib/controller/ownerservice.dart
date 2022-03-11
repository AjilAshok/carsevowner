import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
class Ownerservice extends GetxController{
  String ? values;
   bool Enginework = false;
  bool Oilchange = false;
  bool breakdown = false;
  bool carwash = false;
  //  

   int currentindex=0; 
   final Set<Marker> markers = {};
   

  bottomnavbar(index) {
    currentindex = index;
    update();
  }
  
  map() {
    markers.add(Marker(
      
      markerId: MarkerId("id-1"),
      position: LatLng(10.1004,76.3570),
       infoWindow: InfoWindow(
      // title:address.value
      )
      
    ));
  }
  dropdowntype(value ){
    values=value;
    update();

  }
  chekbox( title,bool vallue){
     switch (title) {
                case "Enginework":
                 Enginework  = vallue;
                //  Enginework=false;

                  break;
                case "Oilchange":
                  Oilchange = vallue;
                  break;
                case "Brekdown":
                  breakdown = vallue;
                  break;
                case "Carwash":
                  carwash = vallue;
                  break;

  }
  update();
  }
  


}