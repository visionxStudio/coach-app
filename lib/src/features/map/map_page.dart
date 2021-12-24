import 'dart:async';

import 'package:digicoach/src/common/constants/asset_image_link.dart';
import 'package:digicoach/src/common/constants/constants.dart';
import 'package:digicoach/src/common/utils/app_size_utils.dart';
import 'package:digicoach/src/common/widgets/size/custom_size_widget.dart';
import 'package:digicoach/src/common/widgets/text/custom_normal_text_widget.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapPage extends StatefulWidget {
  const MapPage({Key? key}) : super(key: key);

  @override
  State<MapPage> createState() => _MapPageState();
}

class _MapPageState extends State<MapPage> {
  Position? position;
  double lat = 0.0;
  double longt = 0.0;

  GoogleMapController? mapController;
  BitmapDescriptor? customIcon;
  BitmapDescriptor? userIcon;
  List<BitmapDescriptor> mapicons = [];
  Set<Marker>? markers;
  List bloodicons = [ImageAsset.exercise];

  double pinPillPosition = -190;

  @override
  void initState() {
    super.initState();
    // markers = Set.from([]);
    requrestPermission();
  }

//get the current position from location
  getPosition() async {
    await Geolocator.getCurrentPosition().then((location) {
      lat = location.latitude;
      longt = location.longitude;
      setState(() {});
    });
  }

//asking permission using location
  Future<bool> requrestPermission() async {
    LocationPermission permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.always ||
        permission == LocationPermission.whileInUse) {
      getPosition();
      return true;
    } else {
      LocationPermission permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.whileInUse ||
          permission == LocationPermission.always) {
        getPosition();
        return true;
      } else {
        return false;
      }
    }
  }

  createMarker(context, image) {
    ImageConfiguration config =
        createLocalImageConfiguration(context, size: const Size(10, 10));
    BitmapDescriptor.fromAssetImage(
      config,
      image,
    ).then((icon) {
      setState(() {
        customIcon = icon;
      });
    });
  }

  createIcon(context, image) {
    ImageConfiguration config =
        createLocalImageConfiguration(context, size: const Size(10, 10));
    BitmapDescriptor.fromAssetImage(
      config,
      image,
    ).then((icon) {
      setState(() {
        mapicons.add(icon);
      });
    });
  }

  userMarker(context, image) {
    ImageConfiguration config =
        createLocalImageConfiguration(context, size: const Size(10, 10));

    BitmapDescriptor.fromAssetImage(
      config,
      image,
    ).then((icon) {
      setState(() {
        userIcon = icon;
      });
    });
  }

  addMarker() {
    markers!.clear();

    markers!.add(Marker(
      //    icon: mapicons[ImageAsset.heart],
      markerId: const MarkerId('002'),
      position: LatLng(lat, longt),
      consumeTapEvents: true,
      infoWindow: const InfoWindow(title: 'ok', snippet: "okk"),
      onTap: () {
        mapController!.animateCamera(CameraUpdate.newCameraPosition(
            CameraPosition(zoom: 20, target: LatLng(lat, longt))));
        setState(() {
          pinPillPosition = 0;
        });
      },
    ));
  }

  Completer<GoogleMapController> controller = Completer();

  //static const LatLng center = LatLng(45.521563, -122.677433);

  void _onMapCreated(GoogleMapController controller) {
    addMarker();
    setState(() {
      mapController = controller;
    });

    controller.animateCamera(CameraUpdate.newCameraPosition(
        CameraPosition(zoom: 2, target: LatLng(lat, longt))));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
      children: [
        GoogleMap(
          zoomControlsEnabled: false,
          myLocationButtonEnabled: false,
          mapType: MapType.normal,
          initialCameraPosition:
              CameraPosition(zoom: 1.0, target: LatLng(lat, longt)),
          onTap: (pos) {},
          onMapCreated: _onMapCreated,
        ),
        Positioned(
            bottom: 10,
            child: SizedBox(
              width: SizeConfig.screenWidth,
              height: height(200),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                      child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: 5,
                          itemBuilder: (context, index) {
                            return const CoachMapItemWidget();
                          })),
                  Container(
                    width: width(90),
                    padding: const EdgeInsets.all(5),
                    margin: const EdgeInsets.symmetric(
                        horizontal: 10, vertical: 10),
                    decoration: const BoxDecoration(
                      color: kWhiteColor,
                    ),
                    child: Row(
                      children: const [
                        Icon(
                          Icons.place_outlined,
                        ),
                        NormalText("2 Km")
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          child: InkWell(
                            onTap: () {},
                            child: Container(
                              padding: const EdgeInsets.all(10),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: kPrimaryColor,
                              ),
                              child: const NormalText(
                                "Home",
                                isCentered: true,
                                color: kWhiteColor,
                                fontSize: kDefaultFontSize - 5,
                              ),
                            ),
                          ),
                        ),
                        const WidthWidget(200),
                        Expanded(
                          child: InkWell(
                            onTap: () {},
                            child: Container(
                              padding: const EdgeInsets.all(10),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: kPrimaryColor,
                              ),
                              child: const NormalText(
                                "Filter",
                                color: kWhiteColor,
                                isCentered: true,
                                fontSize: kDefaultFontSize - 5,
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  )
                ],
              ),
            ))
      ],
    ));
  }
}

class CoachMapItemWidget extends StatelessWidget {
  const CoachMapItemWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(kDefaultmargin / 1.6),
      margin: const EdgeInsets.symmetric(horizontal: kDefaultmargin / 1.2),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: kBlackColor),
          color: kWhiteColor),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: Image.asset(
              ImageAsset.testprofile,
              height: height(75),
              fit: BoxFit.fitHeight,
            ),
          ),
          const WidthWidget(20),
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
              NormalText(
                "Pierre Ramot",
                fontSize: kDefaultFontSize + 2,
                color: kMaptitleText,
              ),
              HeightWidget(10),
              NormalText(
                "Vu il y a 20 min",
                fontSize: kDefaultFontSize - 4,
                isBold: true,
              ),
            ],
          )
        ],
      ),
    );
  }
}
