import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:happy/app/modules/home/home_controller.dart';
import 'package:happy/app/modules/register/register.dart';
import 'package:happy/utils/nav.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final homecontroller = Modular.get<HomeController>();

  Completer<GoogleMapController> _controller = Completer();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: Text("Happy"),
      // ),
      body: Observer(
        builder: (_) {
          if (homecontroller.orphanages.error != null) {
            return Center(
              child: Text("error"),
            );
          }

          if (homecontroller.orphanages.error == null) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }

          var list = homecontroller.orphanages.value;

          return ListView.builder(
            itemCount: list.length,
            itemBuilder: (BuildContext context, int index) {
              return Container(
                child: Stack(
                  children: [
                    GoogleMap(
                      mapType: MapType.normal,
                      initialCameraPosition: CameraPosition(
                          target: LatLng(
                              list[index].latitude, list[index].longitude),
                          zoom: 15.0),
                      zoomControlsEnabled: false,
                      myLocationButtonEnabled: true,
                      compassEnabled: true,
                      mapToolbarEnabled: false,
                      onMapCreated: (GoogleMapController controller) {
                        _controller.complete(controller);
                      },
                    ),
                    Positioned(
                      bottom: 50.0,
                      right: 15.0,
                      left: 15.0,
                      child: Container(
                        height: 50.0,
                        width: double.infinity,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: Colors.white,
                          boxShadow: [
                            BoxShadow(
                                color: Colors.grey,
                                offset: Offset(1.0, 5.0),
                                blurRadius: 10,
                                spreadRadius: 3)
                          ],
                        ),
                        child: Stack(
                          children: [
                            TextFormField(
                              cursorColor: Colors.black,
                              decoration: InputDecoration(
                                icon: Container(
                                  margin: EdgeInsets.only(left: 20, top: 5),
                                  width: 10,
                                  height: 10,
                                ),
                                border: InputBorder.none,
                                suffixIcon: IconButton(
                                  icon: Icon(Icons.add),
                                  color: Colors.blue,
                                  onPressed: () {
                                    push(context, Register());
                                  },
                                ),
                                contentPadding: EdgeInsets.only(top: 16.0),
                              ),
                            ),
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              );
            },
          );
        },
      ),
    );
  }
}
