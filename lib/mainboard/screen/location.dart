import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:hospitel/component/custom_app_bar.dart';
import 'package:hospitel/component/loading.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:webview_flutter/webview_flutter.dart';

class Location extends StatefulWidget {
  @override
  _LocationState createState() => _LocationState();
}

class _LocationState extends State<Location> {
  Position userLocation;
  GoogleMapController mapController;

  Set<Marker> _markers = {};
  BitmapDescriptor mapMarker;

  Future<void> getPermission() async {
    PermissionStatus permission = await PermissionHandler()
        .checkPermissionStatus(PermissionGroup.location);

    if (permission == PermissionStatus.denied) {
      await PermissionHandler()
          .requestPermissions([PermissionGroup.locationAlways]);
    }

    var geolocator = Geolocator();

    GeolocationStatus geolocationStatus =
        await geolocator.checkGeolocationPermissionStatus();
    switch (geolocationStatus) {
      case GeolocationStatus.denied:
        _getLocation();
        break;
      case GeolocationStatus.disabled:
        // showDialog(
        //   context: context,
        //   builder: (_) => AlertMessage("แจ้งเตือน", "ตำแหน่งถูกปิดอยู่", null),
        // );
        Navigator.pop(context);
        break;
      case GeolocationStatus.restricted:
        // showDialog(
        //   context: context,
        //   builder: (_) => AlertMessage("แจ้งเตือน", "การอนุญาติถูกจำกัด", null),
        // );
        Navigator.pop(context);
        break;
      case GeolocationStatus.unknown:
        // showDialog(
        //   context: context,
        //   builder: (_) => AlertMessage("แจ้งเตือน", "ไม่พบตำแหน่ง", null),
        // );
        Navigator.pop(context);
        break;
      case GeolocationStatus.granted:
        _getLocation();
        break;
    }
  }

  Future<Position> _getLocation() async {
    try {
      userLocation = await Geolocator()
          .getCurrentPosition(desiredAccuracy: LocationAccuracy.best);
    } catch (e) {
      userLocation = null;
    }
    return userLocation;
  }

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: CustomAppBar(),
      body: FutureBuilder(
        future: _getLocation(),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if (snapshot.hasData) {
            return WebView(
              javascriptMode: JavascriptMode.unrestricted,
              // initialUrl:
              //     'https://www.google.co.th/maps/search/${snapshot.data.latitude},+${snapshot.data.longitude}/@${snapshot.data.latitude},${snapshot.data.longitude},18z?hl=th',
              initialUrl:
                  'https://www.google.com/maps/dir/13.8123046,100.5858792/%E0%B8%AB%E0%B8%A5%E0%B8%87%E0%B9%84%E0%B8%97%E0%B9%88%E0%B8%84%E0%B8%A5%E0%B8%B4%E0%B8%99%E0%B8%B4%E0%B8%84+(%E0%B8%AA%E0%B8%B2%E0%B8%82%E0%B8%B22)+14%2F88+%E0%B8%96.+%E0%B8%A5%E0%B8%B2%E0%B8%94%E0%B8%9E%E0%B8%A3%E0%B9%89%E0%B8%B2%E0%B8%A7%E0%B8%A7%E0%B8%B1%E0%B8%87%E0%B8%AB%E0%B8%B4%E0%B8%99+%E0%B9%81%E0%B8%82%E0%B8%A7%E0%B8%87%E0%B8%A5%E0%B8%B2%E0%B8%94%E0%B8%9E%E0%B8%A3%E0%B9%89%E0%B8%B2%E0%B8%A7+%E0%B9%80%E0%B8%82%E0%B8%95%E0%B8%A5%E0%B8%B2%E0%B8%94%E0%B8%9E%E0%B8%A3%E0%B9%89%E0%B8%B2%E0%B8%A7+%E0%B8%81%E0%B8%A3%E0%B8%B8%E0%B8%87%E0%B9%80%E0%B8%97%E0%B8%9E%E0%B8%A1%E0%B8%AB%E0%B8%B2%E0%B8%99%E0%B8%84%E0%B8%A3+10230/@13.8116755,100.5831586,16z/data=!3m1!4b1!4m9!4m8!1m1!4e1!1m5!1m1!1s0x30e29da4a915340b:0x7d6bfa887b31d383!2m2!1d100.5912061!2d13.8125115',
            );
          } else {
            return Center(
              child: LoadingFoldingCube(),
            );
          }
        },
      ),
    );
  }
}
