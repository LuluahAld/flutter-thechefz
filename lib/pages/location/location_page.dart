import 'dart:async';

import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:map_pin_picker/map_pin_picker.dart';
import 'package:thechefz/constants.dart';
import 'package:thechefz/models/Address.dart';
import 'package:thechefz/models/User.dart';
import 'package:thechefz/pages/home/main_page.dart';

class LocationPage extends StatefulWidget {
  const LocationPage({Key? key}) : super(key: key);

  @override
  _LocationPageState createState() => _LocationPageState();
}

class _LocationPageState extends State<LocationPage> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController descController = TextEditingController();
  bool onSaved = false;
  final _controller = Completer<GoogleMapController>();
  MapPickerController mapPickerController = MapPickerController();

  CameraPosition cameraPosition = const CameraPosition(
    target: LatLng(24.853899, 46.712258),
    zoom: 17,
  );

  var textController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    Widget child;
    if (!onSaved) {
      child = SizedBox(
        height: 50,
        child: TextButton(
          onPressed: () {
            onSaved = true;
            setState(() {});
          },
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all<Color>(purple),
            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
              RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15.0),
              ),
            ),
          ),
          child: const Text(
            'Deliver Here',
            style: TextStyle(
              fontWeight: FontWeight.w400,
              fontStyle: FontStyle.normal,
              color: Color(0xFFFFFFFF),
              fontSize: 19,
              // height: 19/19,
            ),
          ),
        ),
      );
    } else {
      child = SizedBox(
          height: 270,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Address name*',
                      style: TextStyle(fontSize: 16),
                    ),
                    TextField(
                      controller: nameController,
                      decoration: const InputDecoration(
                        border: InputBorder.none,
                      ),
                    ),
                    const Divider(
                      height: 30,
                      thickness: 1,
                    ),
                    const Text(
                      'Place description*',
                      style: TextStyle(fontSize: 16),
                    ),
                    TextField(
                      controller: descController,
                      decoration: const InputDecoration(
                        border: InputBorder.none,
                      ),
                    )
                  ],
                ),
              ),
              const SizedBox(
                height: 16,
              ),
              TextButton(
                onPressed: () {
                  var index = Addresses.length;
                  Addresses.add(Address(
                      addressLocation: '${cameraPosition.target.latitude} ${cameraPosition.target.longitude}',
                      addressText: textController.text,
                      id: index.toString(),
                      name: nameController.text,
                      desc: descController.text,
                      user_id: userNow[0].id));
                  Navigator.pushReplacement<void, void>(
                    context,
                    MaterialPageRoute<void>(
                      builder: (BuildContext context) => const MainPage(),
                    ),
                  );
                },
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all<Color>(purple),
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15.0),
                    ),
                  ),
                ),
                child: const Padding(
                  padding: EdgeInsets.fromLTRB(0, 8, 0, 8),
                  child: Text(
                    'Done',
                    style: TextStyle(
                      fontWeight: FontWeight.w400,
                      fontStyle: FontStyle.normal,
                      color: Color(0xFFFFFFFF),
                      fontSize: 19,
                      // height: 19/19,
                    ),
                  ),
                ),
              ),
            ],
          ));
    }
    return Scaffold(
      body: Stack(
        alignment: Alignment.topCenter,
        children: [
          MapPicker(
            iconWidget: Icon(
              Icons.location_on,
              size: 48,
              color: orange,
            ),
            mapPickerController: mapPickerController,
            child: GoogleMap(
              myLocationEnabled: true,
              zoomControlsEnabled: false,
              myLocationButtonEnabled: false,
              mapType: MapType.normal,
              initialCameraPosition: cameraPosition,
              onMapCreated: (GoogleMapController controller) {
                _controller.complete(controller);
              },
              onCameraMoveStarted: () {
                // notify map is moving
                mapPickerController.mapMoving!();
                textController.text = "Loading ...";
              },
              onCameraMove: (cameraPosition) {
                this.cameraPosition = cameraPosition;
              },
              onCameraIdle: () async {
                // notify map stopped moving
                mapPickerController.mapFinishedMoving!();
                //get address name from camera position
                List<Placemark> placemarks = await placemarkFromCoordinates(
                  cameraPosition.target.latitude,
                  cameraPosition.target.longitude,
                );

                // update the ui with the address
                textController.text =
                    '${placemarks.first.street}, ${placemarks.first.administrativeArea}, ${placemarks.first.postalCode},${placemarks.first.country}';
              },
            ),
          ),
          Positioned(
            top: MediaQuery.of(context).viewPadding.top + 20,
            width: MediaQuery.of(context).size.width - 50,
            height: 50,
            child: TextFormField(
              maxLines: 3,
              textAlign: TextAlign.center,
              readOnly: true,
              decoration: const InputDecoration(contentPadding: EdgeInsets.zero, border: InputBorder.none),
              controller: textController,
            ),
          ),
          Positioned(
            bottom: 40,
            left: 24,
            right: 24,
            child: child,
          )
        ],
      ),
    );
  }
}
