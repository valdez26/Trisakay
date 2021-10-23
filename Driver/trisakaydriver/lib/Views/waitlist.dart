import 'package:trisakaydriver/packages.dart';

class WaitlistView extends GetView<MapController> {
  int passenger = 0;

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
        appBar: AppBar(
          title: Customtext.text(
              title: "Passenger List", size: 18, fontWeight: FontWeight.w800),
        ),
        body: Container(
            // width: size.width,
            // height: size.height,
            // child: GetBuilder<MapController>(builder: (controller) {
            //   if (controller.waitlist != null &&
            //       controller.waitlistrecord != null) {
            //     return ListView.builder(
            //         itemCount: controller.waitlistrecord.length,
            //         itemBuilder: (_, index) {
            //           return customCard();
            //         });
            //   } else {
            //     return Container();
            //   }
            // })
            ));
  }

  Widget customCard() {
    passenger++;
    return Card(
        child: Padding(
      padding: const EdgeInsets.all(10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Customtext.text(title: "Passenger " + passenger.toString(), size: 16),
          TextButton(
              onPressed: () {},
              child: Customtext.text(
                  title: "ACCEPT", size: 16, color: Colors.green))
        ],
      ),
    ));
  }
}
