import 'dart:async';

import 'package:trisakaydriver/packages.dart';

class WaitlistView extends GetView<MapController> {
  int passenger = 0;
  Size? size;
  @override
  Widget build(BuildContext context) {
    size = MediaQuery.of(context).size;
    return Scaffold(
        appBar: AppBar(
          title: Customtext.text(
              title: "Passenger List",
              size: 18,
              fontWeight: FontWeight.w800,
              color: Colors.white),
        ),
        body: GetBuilder<MapController>(builder: (controller) {
          return controller.progressCircularStatus.value
              ? progressIndicator()
              : SizedBox(
                  width: size!.width,
                  height: size!.height,
                  child: GetBuilder<MapController>(builder: (controller) {
                    return ListView.builder(
                        itemCount: controller.waitlistrecord!.length,
                        itemBuilder: (_, index) {
                          return customCard(controller.waitlistrecord![index]);
                        });
                  }));
        }));
  }

  Widget customCard(WaitingList waitingList) {
    passenger++;

    return Padding(
      padding: const EdgeInsets.all(4.0),
      child: Container(
          width: size!.width * 0.9,
          height: 70,
          decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.all(Radius.circular(5)),
              boxShadow: [
                BoxShadow(blurRadius: 1, spreadRadius: 2, color: Colors.black26)
              ]),
          child: Container(
            width: size!.width * 0.9,
            height: 70,
            decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.all(Radius.circular(5)),
            ),
            child: Padding(
              padding: const EdgeInsets.all(10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Customtext.text(
                      title: "Passenger " + passenger.toString(),
                      size: 16,
                      color: Colors.deepPurple),
                  TextButton(
                      onPressed: () {
                        controller.addMarker(waitingList);
                        Get.back();
                      },
                      child: Customtext.text(
                          title: "ACCEPT", size: 16, color: Colors.lightGreen))
                ],
              ),
            ),
          )),
    );
  }

  Widget progressIndicator() {
    Timer(
        const Duration(seconds: 1),
        () => {
              controller.progressCircularStatus.value = false,
              controller.refresh(),
            });
    return const Center(
      child: SizedBox(
          width: 50,
          height: 50,
          child: CircularProgressIndicator(
            color: Colors.deepPurple,
          )),
    );
  }
}
