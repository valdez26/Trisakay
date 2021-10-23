import 'dart:async';

import 'package:trisakay/packages.dart';

// ignore: use_key_in_widget_constructors
class Loginview extends GetView<AuthController> {
  final _key = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepPurple,
        toolbarHeight: 0,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Container(
          color: Colors.deepPurple,
          width: size.width,
          height: size.height * 0.95,
          child: Column(
            children: [
              Expanded(
                flex: 1,
                child: SizedBox(
                  width: size.width,
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      CircleAvatar(
                          backgroundColor: Colors.transparent,
                          radius: 40,
                          child:
                              Image.asset('./assets/images/trisakaylogo2.png')),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Customtext.text(
                                  title: "Tri",
                                  size: 32,
                                  fontWeight: FontWeight.w700,
                                  color: Colors.deepOrange),
                              Customtext.text(
                                  title: "Sakay",
                                  size: 32,
                                  fontWeight: FontWeight.w700,
                                  color: Colors.white),
                            ],
                          ),
                          Customtext.text(
                              title: "Travel Safely Pay Appropriately",
                              size: 16,
                              fontWeight: FontWeight.w200,
                              color: Colors.white),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              Expanded(
                flex: 3,
                child: Container(
                  width: size.width,
                  decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(40),
                          topRight: Radius.circular(40))),
                  child: Column(
                    children: [
                      const SizedBox(height: 20),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(
                                top: 8.0, left: 20, bottom: 8.0, right: 20),
                            child: GetBuilder<AuthController>(
                                builder: (controller) {
                              return Customtext.text(
                                  title: controller.loginPageStatus.value
                                      ? "Login"
                                      : "Signup",
                                  size: 20,
                                  fontWeight: FontWeight.w600,
                                  color: Colors.deepPurple);
                            }),
                          ),
                          const SizedBox(width: 20),
                        ],
                      ),
                      const SizedBox(height: 20),
                      GetBuilder<AuthController>(builder: (controller) {
                        return SizedBox(
                          width: size.width * 0.85,
                          height: controller.loginPageStatus.isTrue
                              ? size.height * 0.22
                              : size.height * 0.37,
                          child: Form(
                              key: _key,
                              child: SingleChildScrollView(
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: GetBuilder<AuthController>(
                                      builder: (controller) {
                                    return controller.loginPageStatus.value
                                        ? getLoginForm()
                                        : getSigninForm();
                                  }),
                                ),
                              )),
                        );
                      }),
                      if (controller.loginPageStatus.isTrue)
                        GetBuilder<AuthController>(builder: (controller) {
                          return TextButton(
                            onPressed: () {
                              controller.changeLoginPageStatus();
                            },
                            child: Customtext.text(
                                title: "Forgot Password", size: 15),
                          );
                        }),
                      controller.loginPageStatus.isTrue
                          ? const SizedBox(height: 20)
                          : const SizedBox(height: 10),
                      GetBuilder<AuthController>(builder: (controller) {
                        return MaterialButton(
                          color: Colors.deepOrange,
                          minWidth: size.width * 0.85,
                          padding: const EdgeInsets.all(10),
                          onPressed: () {
                            if (_key.currentState!.validate()) {
                              if (controller.loginPageStatus.isFalse) {
                                controller.signin();
                              } else {
                                controller.loginUser();
                              }
                            }
                          },
                          child: Customtext.text(
                              title: controller.loginPageStatus.value
                                  ? "Login"
                                  : "Submit",
                              color: Colors.white,
                              size: 16),
                        );
                      }),
                      controller.loginPageStatus.isTrue
                          ? const SizedBox(height: 20)
                          : const SizedBox(height: 10),
                      GetBuilder<AuthController>(builder: (controller) {
                        return MaterialButton(
                          color: Colors.deepPurpleAccent,
                          minWidth: size.width * 0.85,
                          padding: const EdgeInsets.all(10),
                          onPressed: () {
                            controller.changeLoginPageStatus();
                            controller.clear();
                          },
                          child: Customtext.text(
                              title: controller.loginPageStatus.value
                                  ? "Signup"
                                  : "Cancel",
                              color: Colors.white,
                              size: 16),
                        );
                      }),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget getLoginForm() {
    return Column(
      children: [
        const SizedBox(height: 20),
        textFormEmail(),
        const SizedBox(height: 30),
        textFormPassword(),
        const SizedBox(height: 20),
      ],
    );
  }

  Widget getSigninForm() {
    return Column(
      children: [
        textformName(),
        const SizedBox(height: 20),
        textFormEmail(),
        const SizedBox(height: 20),
        textFormPassword(),
        const SizedBox(height: 20),
        textFormConfirmPassword()
      ],
    );
  }

  Widget textformName() {
    return Container(
        padding: const EdgeInsets.only(top: 2),
        decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.all(Radius.circular(5)),
            boxShadow: [
              BoxShadow(color: Colors.black26, spreadRadius: 1, blurRadius: 2)
            ]),
        child: TextFormField(
          controller: controller.name,
          decoration: const InputDecoration(
              hintText: "Full name",
              prefixIcon: Icon(Icons.person),
              border: InputBorder.none),
          validator: (value) {
            if (value!.isEmpty) {
              return "Please specify name address";
            }
          },
        ));
  }

  Widget textFormEmail() {
    return Container(
        padding: const EdgeInsets.only(top: 2),
        decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.all(Radius.circular(5)),
            boxShadow: [
              BoxShadow(color: Colors.black26, spreadRadius: 1, blurRadius: 2)
            ]),
        child: TextFormField(
          controller: controller.email,
          decoration: const InputDecoration(
              hintText: "Email",
              prefixIcon: Icon(Icons.email),
              border: InputBorder.none),
          validator: (value) {
            if (value!.isEmpty) {
              return "Please specify email address";
            }
          },
        ));
  }

  Widget textFormPassword() {
    return GetBuilder<AuthController>(builder: (controller) {
      return Container(
        padding: const EdgeInsets.only(top: 2),
        decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.all(Radius.circular(5)),
            boxShadow: [
              BoxShadow(color: Colors.black26, spreadRadius: 1, blurRadius: 2)
            ]),
        child: TextFormField(
          controller: controller.password,
          obscureText: controller.passwordPrefixStatus.value,
          decoration: InputDecoration(
              hintText: "Password",
              prefixIcon: const Icon(Icons.email),
              border: InputBorder.none,
              suffixIcon: IconButton(
                  onPressed: () {
                    controller.prefixPassword();
                  },
                  icon: controller.passwordPrefixStatus.value
                      ? const Icon(Icons.visibility_off)
                      : const Icon(Icons.visibility))),
          validator: (value) {
            if (value!.isEmpty) {
              return "Please specify the password";
            }
          },
        ),
      );
    });
  }

  Widget textFormConfirmPassword() {
    return GetBuilder<AuthController>(builder: (controller) {
      return Container(
        padding: const EdgeInsets.only(top: 2),
        decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.all(Radius.circular(5)),
            boxShadow: [
              BoxShadow(color: Colors.black26, spreadRadius: 1, blurRadius: 3)
            ]),
        child: TextFormField(
          controller: controller.confirmpassword,
          obscureText: controller.confirmpassPrefixStatus.value,
          decoration: InputDecoration(
              hintText: "Confirm Password",
              prefixIcon: const Icon(Icons.email),
              border: InputBorder.none,
              suffixIcon: IconButton(
                  onPressed: () {
                    controller.prefixConfirmPassword();
                  },
                  icon: controller.confirmpassPrefixStatus.value
                      ? const Icon(Icons.visibility_off)
                      : const Icon(Icons.visibility))),
          validator: (value) {
            if (value!.isEmpty) {
              return "Confirmation password is empty";
            }
            if (value != controller.password.text) {
              return "Password do not match";
            }
          },
        ),
      );
    });
  }
}
