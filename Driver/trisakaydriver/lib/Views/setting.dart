import 'package:flutter/rendering.dart';
import 'package:trisakaydriver/packages.dart';

class SettingView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(elevation: 0),
      body: SizedBox(
          width: size.width,
          height: size.height,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                      width: size.width,
                      height: size.height * 0.25,
                      decoration: const BoxDecoration(
                          image: DecorationImage(
                              fit: BoxFit.fill,
                              image: AssetImage('./assets/background.jpg')))),
                  Column(
                    children: [
                      Container(
                        decoration: const BoxDecoration(
                          color: Colors.white,
                        ),
                        child: Row(
                          children: [
                            const Icon(Icons.person, color: Colors.black38),
                            TextButton(
                                onPressed: () {
                                  Get.toNamed('/myaccount');
                                },
                                child: Customtext.text(
                                    title: "My Account",
                                    size: 16,
                                    fontWeight: FontWeight.w700)),
                          ],
                        ),
                      ),
                      const Divider(),
                      Container(
                        decoration: const BoxDecoration(
                          color: Colors.white,
                        ),
                        child: Row(
                          children: [
                            const Icon(Icons.person, color: Colors.black38),
                            TextButton(
                                onPressed: () {
                                  Get.toNamed('/history');
                                },
                                child: Customtext.text(
                                    title: "History",
                                    size: 16,
                                    fontWeight: FontWeight.w700)),
                          ],
                        ),
                      ),
                      const Divider(),
                      Container(
                        decoration: const BoxDecoration(
                          color: Colors.white,
                        ),
                        child: Row(
                          children: [
                            const Icon(Icons.read_more_rounded,
                                color: Colors.black38),
                            TextButton(
                                onPressed: () {
                                  Get.toNamed('/aboutus');
                                },
                                child: Customtext.text(
                                    title: "About",
                                    size: 16,
                                    fontWeight: FontWeight.w700)),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 20.0),
                child: Center(
                    child: GetBuilder<AuthController>(builder: (controller) {
                  return MaterialButton(
                      minWidth: size.width * 0.8,
                      color: Colors.deepOrange,
                      onPressed: () {
                        controller.signout();
                      },
                      child: Customtext.text(
                          title: "Logout",
                          size: 16,
                          fontWeight: FontWeight.w800,
                          color: Colors.white));
                })),
              )
            ],
          )),
    );
  }
}
