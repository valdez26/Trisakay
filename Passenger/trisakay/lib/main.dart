import 'package:trisakay/packages.dart';
import 'package:firebase_core/firebase_core.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp()
      .then((value) => {Get.put(AuthController()), Get.put(MapController())});
  runApp(const MyApp());
}

class MyApp extends GetView<AuthController> {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'TriSakay',
      theme: ThemeData(
        primarySwatch: Colors.deepPurple,
      ),
      home: controller.users == null ? Loginview() : HomeView(),
      initialBinding: Allbindings(),
      initialRoute: '/',
      getPages: [
        GetPage(name: '/', page: () => Loginview()),
        GetPage(name: '/home', page: () => HomeView()),
        GetPage(name: '/setting', page: () => SettingView()),
      ],
    );
  }
}
