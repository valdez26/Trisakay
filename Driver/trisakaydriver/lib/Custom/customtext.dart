import 'package:trisakaydriver/packages.dart';
import 'package:google_fonts/google_fonts.dart';

class Customtext {
  static Widget text(
      {String title = 'unknown',
      double size = 12,
      FontWeight fontWeight = FontWeight.w500,
      Color color = Colors.black45}) {
    return Text(
      title,
      style: GoogleFonts.lato(
        fontSize: size,
        fontWeight: fontWeight,
        color: color,
      ),
    );
  }
}
