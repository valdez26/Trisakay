import 'package:flutter/cupertino.dart';
import 'package:trisakaydriver/packages.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

// ignore: must_be_immutable, use_key_in_widget_constructors
class HomeView extends GetView<MapController> {
  GoogleMapController? googleMapController;

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
        appBar: AppBar(
          elevation: 0,
          toolbarHeight: 0,
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            controller.getWaitList();
            Get.toNamed('/list');
          },
          child: const Icon(
            Icons.search,
            size: 34,
          ),
        ),
        body: Stack(
          children: [
            Positioned.fill(
                child: GetBuilder<MapController>(builder: (controller) {
              return GoogleMap(
                  myLocationButtonEnabled: false,
                  zoomControlsEnabled: false,
                  initialCameraPosition: controller.initialCameraPosition,
                  markers: {
                    if (controller.origin != null) controller.origin!,
                    if (controller.destination != null) controller.destination!
                  },
                  polylines: {
                    if (controller.info != null)
                      Polyline(
                        polylineId: const PolylineId('overview_polyline'),
                        color: Colors.red,
                        width: 5,
                        points: controller.info!.polylinePoints!
                            .map((e) => LatLng(e.latitude, e.longitude))
                            .toList(),
                      ),
                  },
                  onMapCreated: (controller) =>
                      googleMapController = controller);
            })),
            Positioned(
                top: 10,
                left: 10,
                child: SizedBox(
                  width: size.width,
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        CircleAvatar(
                          backgroundColor: Colors.white,
                          child: IconButton(
                              onPressed: () {
                                Get.toNamed('/setting');
                              },
                              icon: const Icon(
                                Icons.dehaze_rounded,
                                color: Colors.deepPurple,
                              )),
                        ),
                        Row(
                          children: [
                            Customtext.text(
                                title: "Tri",
                                color: Colors.deepOrange,
                                size: 24,
                                fontWeight: FontWeight.w800),
                            Customtext.text(
                                title: "Sakay",
                                color: Colors.deepPurple,
                                size: 24,
                                fontWeight: FontWeight.w800),
                            CircleAvatar(
                                backgroundColor: Colors.white,
                                child: Image.asset(
                                    './assets/images/trisakaylogo1.png'))
                          ],
                        ),
                        const SizedBox(width: 26)
                      ]),
                )),
            Positioned(
                top: 80,
                left: size.width * 0.1,
                child: Container(
                  width: size.width * 0.8,
                  height: 60,
                  decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.all(Radius.circular(50))),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 10.0),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            CircleAvatar(
                                backgroundImage:
                                    const AssetImage('./assets/myprofile.png'),
                                child: Container()),
                            const SizedBox(width: 10),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                GetBuilder<AuthController>(
                                    init: Get.find<AuthController>(),
                                    builder: (controller) {
                                      return Customtext.text(
                                          title: controller.users, size: 16);
                                    }),
                                GetBuilder<MapController>(
                                    builder: (controller) {
                                  return Customtext.text(
                                      title: controller.info == null
                                          ? "Distance: 0km"
                                          : "Distance:" +
                                              controller.info!.totalDistance!);
                                }),
                              ],
                            )
                          ],
                        ),
                      ),
                      Padding(
                          padding: const EdgeInsets.only(right: 10.0),
                          child: Container(
                            width: 100,
                            height: 40,
                            decoration: const BoxDecoration(
                                color: Colors.deepPurple,
                                borderRadius:
                                    BorderRadius.all(Radius.circular(30))),
                            child: Row(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(left: 8.0),
                                  child: Customtext.text(
                                      title: "₱",
                                      size: 20,
                                      color: Colors.white),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(2.0),
                                  child: Container(
                                    width: 70,
                                    height: 50,
                                    decoration: const BoxDecoration(
                                        color: Colors.white,
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(27))),
                                    child: Center(
                                      child: GetBuilder<MapController>(
                                          builder: (controller) {
                                        return Customtext.text(
                                            title: controller
                                                .getPrice()
                                                .toString(),
                                            size: 20,
                                            color: Colors.orange,
                                            fontWeight: FontWeight.w700);
                                      }),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          )),
                    ],
                  ),
                )),
            // Positioned(
            //   bottom: 20,
            //   left: size.width * 0.055,
            //   child: Container(
            //     width: size.width * 0.9,
            //     height: size.height * 0.1,
            //     decoration: const BoxDecoration(
            //         color: Colors.white,
            //         borderRadius: BorderRadius.all(Radius.circular(10))),
            //     child: Row(
            //       mainAxisAlignment: MainAxisAlignment.center,
            //       children: [
            //         Padding(
            //           padding: const EdgeInsets.only(right: 0.8),
            //           child: Customtext.text(
            //               title: "Destination :",
            //               color: Colors.deepOrange,
            //               size: 16),
            //         ),
            //         // ignore: prefer_const_literals_to_create_immutables
            //         Container(
            //           width: size.width * 0.5,
            //           height: 70,
            //           child: const Padding(
            //             padding: EdgeInsets.only(top: 15.0),
            //             child: Divider(color: Colors.deepOrange),
            //           ),
            //         ),
            //       ],
            //     ),
            //   ),
            // )
          ],
        ));
  }
}
