import 'package:flutter/cupertino.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:trisakay/packages.dart';

class AboutView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: Customtext.text(
            title: "About US",
            size: 18,
            color: Colors.white,
            fontWeight: FontWeight.w800),
      ),
      body: SizedBox(
        width: size.width,
        height: size.height,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
                flex: 1,
                child: SizedBox(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Customtext.text(
                          title: 'TriSakay',
                          size: 20,
                          fontWeight: FontWeight.w800),
                      const Divider(indent: 100, endIndent: 100),
                      Customtext.text(
                          title: 'FAIR MONITORING SYSTEM',
                          size: 10,
                          fontWeight: FontWeight.w300)
                    ],
                  ),
                )),
            Expanded(
              flex: 5,
              child: SizedBox(
                child: Text(
                    "TriSakay is a Monitoring System to help passenger "
                    "have a considerable price \nfor fairs."
                    "by using this Trisakay \napplication the app will"
                    "give the \nexact amount of price of fair base on \nthe"
                    " destination of Passenger.\n\n"
                    "The application will only help in giving \nexact payment,"
                    "searching for possible \npassengers in area,"
                    "to help passenger \nin their exact destination"
                    "and \nto have a secure travel",
                    textAlign: TextAlign.center,
                    style: GoogleFonts.lato(
                        fontSize: 10,
                        fontWeight: FontWeight.w300,
                        letterSpacing: 3)),
              ),
            ),
            Expanded(
                flex: 1,
                child: Container(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      const Text('DEVELOPERS',
                          style: TextStyle(
                              fontSize: 10,
                              fontWeight: FontWeight.w400,
                              letterSpacing: 10)),
                      SizedBox(height: size.height * 0.01),
                      const Text(
                          'Mark Valdez | Reynan Labadlabad | Robert Anulhasim',
                          style: TextStyle(
                              fontSize: 8,
                              fontWeight: FontWeight.w300,
                              letterSpacing: 3)),
                      SizedBox(height: size.height * 0.02),
                    ],
                  ),
                ))
          ],
        ),
      ),
    );
  }
}
