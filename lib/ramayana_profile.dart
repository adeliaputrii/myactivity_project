import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:barcode_flutter/barcode_flutter.dart';
import 'package:pretty_qr_code/pretty_qr_code.dart';
import 'package:image_picker/image_picker.dart';
import 'package:barcode_flutter/barcode_flutter.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:flutter/services.dart';


class Profilee extends StatefulWidget {
  const Profilee({super.key});

  @override
  State<Profilee> createState() => _ProfileeState();
}

class _ProfileeState extends State<Profilee> {

  TextEditingController myController = TextEditingController();

  String _scanBarcode = '0460545';

  
  bool isOn = false;
                        
                    Widget myWidget =  Container(
                    key: ValueKey(2),
                    margin: EdgeInsets.fromLTRB(0, 0, 0, 0),
                     child: Container (
                      width: 700,
                      height: 280,
                      decoration: BoxDecoration(
                        color: Colors.green,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(20),
                        topRight: Radius.circular(20),
                        bottomLeft: Radius.circular(20),
                        bottomRight: Radius.circular(20),
                      ),
                       image: DecorationImage(
                      image: AssetImage('assets/kartu.jpg'), fit: BoxFit.fill),
                         ),
                         
                      ) 
                        
        
            );

  //  TextEditingController _editingController = TextEditingController(text: '');
  // String data = '';

 XFile? image;

  final ImagePicker picker = ImagePicker();

  //we can upload image from camera or from gallery based on parameter
  Future getImage(ImageSource media) async {
    var img = await picker.pickImage(source: media);

    setState(() {
      image = img;
    });
  }

  //show popup dialog
  void myAlert() {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
            title: Text('Please choose media to select'),
            content: Container(
              height: MediaQuery.of(context).size.height / 8,
              child: Column(
                children: [
                  MaterialButton(
                    //if user click this button, user can upload image from gallery
                    color: Color.fromARGB(255, 255, 17, 17),
                    onPressed: () {
                      Navigator.pop(context);
                      getImage(ImageSource.gallery);
                    },
                    child: Row(
                      children: [
                        Icon(Icons.image, color: Colors.white),
                        Text('From Gallery', style: TextStyle(color: Colors.white),),
                      ],
                    ),
                  ),
                  MaterialButton(
                    //if user click this button. user can upload image from camera
                     color: Color.fromARGB(255, 255, 17, 17),
                    onPressed: () {
                      Navigator.pop(context);
                      getImage(ImageSource.camera);
                    },
                    child: Row(
                      children: [
                        Icon(Icons.camera,  color: Colors.white),
                        Text('From Camera',  style: TextStyle(color: Colors.white)),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        });
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Profile', style: TextStyle(fontSize: 23)),
        backgroundColor: Color.fromARGB(255, 255, 17, 17),
        elevation: 7.20  ,
          toolbarHeight: 90,
        ),
         body: Stack(
          children: <Widget>[
            Container(
              color: Colors.white,
            ),
           Container(
              child: ListView(

                children: <Widget> [
                   Container(
              margin: EdgeInsets.fromLTRB(10, 380, 10, 0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                     Text('Full Name',
                  style: TextStyle(color: Colors.black, fontWeight: FontWeight.w500, fontSize: 17),
                  ),
                   TextFormField(
                    cursorColor: Colors.black,
                          style: TextStyle(
                            fontSize: 17
                          ),
                          decoration: InputDecoration(
                            labelStyle: TextStyle(color: Colors.black),
                            focusedBorder: UnderlineInputBorder(
                              borderSide: new BorderSide(color: Colors.black),
                            )
                          )
                    
                  ),
                  SizedBox(
                    height: 20,
                    width: 20,
                    ),
                    Text('Email',
                  style: TextStyle(color: Colors.black, fontWeight: FontWeight.w500, fontSize: 17),
                  ),
                  
                  TextFormField(
                    
                    cursorColor: Colors.black,
                          style: TextStyle(
                            fontSize: 17
                          ),
                          decoration: InputDecoration(
                            labelStyle: TextStyle(color: Colors.black),
                            focusedBorder: UnderlineInputBorder(
                              borderSide: new BorderSide(color: Colors.black),
                            )
                          )
                    
                  ),
                  SizedBox(
                    height: 20,
                    width: 20,
                    ),
                  Text('Code',
                  style: TextStyle(color: Colors.black, fontWeight: FontWeight.w500, fontSize: 17),
                  ),
                  TextFormField(
                    cursorColor: Colors.black,
                    
                    decoration:
                      InputDecoration(
                       labelStyle: TextStyle(color: Colors.black),
                            focusedBorder: UnderlineInputBorder(
                              borderSide: new BorderSide(color: Colors.black),
                            )
                      ),
                //  controller: _editingController,
               
               controller: myController..text = '$_scanBarcode\n',
                  ),
                 
                  SizedBox(
                    height: 20,
                    width: 20,
                    ),
                    Text('Sub Divisi',
                  style: TextStyle(color: Colors.black, fontWeight: FontWeight.w500, fontSize: 17),
                  ),
                  TextFormField(
                    
                    cursorColor: Colors.black,
                          style: TextStyle(
                            fontSize: 17
                          ),
                          decoration: InputDecoration(
                            labelStyle: TextStyle(color: Colors.black),
                            focusedBorder: UnderlineInputBorder(
                              borderSide: new BorderSide(color: Colors.black),
                            )
                          )
                    
                  ),
                  SizedBox(
                    height: 20,
                    width: 20,
                    ),
                  ],
              )
              ),
             Container(
              //margin: EdgeInsets.only(top: 590),
                color: Color.fromARGB(255, 255, 17, 17),
                width: 500,
                height: 50,
                    
              child:
              Container(
               
                child: 
                TextButton(
                      onPressed: () {
                         setState(() {
                    _scanBarcode = myController.text;
                    // data = _editingController.text;
                  });
                      }, 
                      child: 
                       Text(
                      'UPDATE', style: TextStyle(fontWeight: FontWeight.w700, fontSize: 22, color: Colors.white),
                       ),
                      ),
              ),
              ),
                   ]
              ),
           ),
             
            // Container(
            //   margin: EdgeInsets.only(top: 15, left: 20, right: 20),
            //   height: 350,
               
            //   decoration: BoxDecoration(
               
            //     color: Color.fromARGB(255, 212, 212, 211),
            //      boxShadow: [BoxShadow(
            //       blurRadius: 5, 
            //      // spreadRadius: 2
            //      )],
            //    // borderRadius: BorderRadius.circular(20),
                 
            //   ),
            // ),
             Container(
            //  margin: EdgeInsets.only(top: 20, left: 20, right: 20),
              height: 300,
               
              decoration: BoxDecoration(
               
                color: Color.fromARGB(255, 235, 227, 227),
                 boxShadow: [BoxShadow(
                  blurRadius: 5, 
                 // spreadRadius: 2
                 )],
               // borderRadius: BorderRadius.circular(20),
                 
              ),
            ),
          //  Container(
          //           margin: EdgeInsets.fromLTRB(70, 30, 70, 0),
          //           child: 
          //           Image.asset(
          //         'assets/kartu.jpg',
          //         width: 350,
                 
          //       )
          //   ),
            Container( 
             margin: EdgeInsets.only( top: 10, left: 10, right: 10),
            // color: Colors.green,
          child: 
        Column(
          
          mainAxisAlignment: MainAxisAlignment.start,
          children: [

            AnimatedSwitcher(
              child: myWidget,
              duration: Duration(seconds: 1),
              transitionBuilder: (child, animation) => FadeTransition(
                opacity: animation,
                child: child,
                ),
            ),
            SizedBox(
              height: 30,
            ),
            Switch(
              activeColor: Color.fromARGB(255, 255, 17, 17),
              activeThumbImage:  AssetImage(
                  'assets/ramayana.jpg',
                  
                ),
              value: isOn, 
              onChanged: (newValue) {
                isOn = newValue;
                setState(() {
                  if(isOn)
                  myWidget = Container(
                    key: ValueKey(1),
                    margin: EdgeInsets.fromLTRB(0, 0, 0, 0),
                     child: Container (
                      width: 700,
                      height: 280,
                      decoration: BoxDecoration(
                        color: Colors.green,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(20),
                        topRight: Radius.circular(20),
                        bottomLeft: Radius.circular(20),
                        bottomRight: Radius.circular(20),
                      ),
                      
                       image: DecorationImage(
                image: AssetImage('assets/desain.jpg'), 
                fit: BoxFit.fill
                ),
          ),
          child: Container(
                          margin: EdgeInsets.only(top: 20, bottom: 30, left: 70, right: 70),
                          //color: Colors.green,
                          
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children : <Widget>[

                          QrImage(
                           //backgroundColor: Colors.red,
                               foregroundColor: Colors.white,
                          data: "$_scanBarcode",
                          version: QrVersions.auto,
                          size: 70.0,
                        ), 
                          BarCodeImage(
                           backgroundColor: Colors.white,
                  params: Code128BarCodeParams(
                    "$_scanBarcode",
                    lineWidth: 2.65,                // width for a single black/white bar (default: 2.0)
                    barHeight: 45,               // height for the entire widget (default: 100.0)
                    withText: true,                // Render with text label or not (default: false)
                  ),
                  padding: EdgeInsets.only(bottom: 7),
                  onError: (error) {               // Error handler
                    print('error = $error');
                    
                  },
                        ),
                        
                 ])
                        )
                     ),
                    );

                  else 
                  myWidget =  Container(
                    key: ValueKey(2),
                    margin: EdgeInsets.fromLTRB(0, 0, 0, 0),
                     child: Container (
                      width: 700,
                      height: 280,
                      decoration: BoxDecoration(
                        color: Colors.green,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(20),
                        topRight: Radius.circular(20),
                        bottomLeft: Radius.circular(20),
                        bottomRight: Radius.circular(20),
                      ),
                       image: DecorationImage(
                      image: AssetImage('assets/kartu.jpg'), fit: BoxFit.fill),
                         ),
                      
                      ) 
            );

                });
                
              }
               ),
          
          
            ]
            )
             ),
       
        //      Container(
        //       margin: EdgeInsets.only(top: 20),
        //        child: PrettyQr(
        //   image: AssetImage('assets/ramayana.jpg'),
        //   size: 215,
        //   data: '$_scanBarcode',
        //   errorCorrectLevel: QrErrorCorrectLevel.M,
        //   typeNumber: 7,
        //   roundEdges: false,
        // ),
        //      ),  
               
       
          ] 
          
         )
    );
  }
}