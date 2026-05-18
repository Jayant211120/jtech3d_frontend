//import some libraries and files
import "dart:ui";
import "package:flutter/material.dart";
import "package:frontend/controllers/auth/send_otp_controller.dart";
import "package:frontend/widgets/text_field.dart";
import "../storage/colors.dart";
import "../widgets/button.dart";
import "../widgets/container.dart";
import "../widgets/icon.dart";
import "../widgets/text.dart";
import 'package:flip_card/flip_card.dart';

//create stateful widget
class SignIn extends StatefulWidget {
  const SignIn({super.key});

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  //create controllers
  TextEditingController emailController=TextEditingController();
  TextEditingController passwordController=TextEditingController();
  final GlobalKey<FlipCardState> cardKey = GlobalKey<FlipCardState>();

  //create variable
  final bool emailVerification=false;
  final bool sendOtp=false;
  final String role='user';

  @override
  Widget build(BuildContext context) {
    //create variable
    final isMobile=MediaQuery.of(context).size.width < 890;

    return Scaffold(
      backgroundColor: const Color(0xff070B14),
      body: CustomContainerWithImage(
        width: double.infinity,
        height: double.infinity,
        image: "https://img.magnific.com/premium-photo/3d-rendering-3d-printer-neon-light-black-background_1015980-448128.jpg",
        child: Stack(
          children: [
            /// DARK OVERLAY
            CustomContainerWithGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  AppColor.black.withOpacity(0.5),
                  AppColor.black.withOpacity(0.2),
                ]
            ),

            // GLOW EFFECT
            Positioned(
                top: -100,
                right: -100,
                child: CustomContainer(
                  height: 300,
                  width: 300,
                  shape: BoxShape.circle,
                  color: AppColor.blue.withOpacity(0.25),
                )
            ),

            Positioned(
                bottom: -120,
                left: -120,
                child: CustomContainer(
                  height: 300,
                  width: 300,
                  shape: BoxShape.circle,
                  color: AppColor.purple.withOpacity(0.25),
                )
            ),

            /// MAIN CONTENT
            Center(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal:10,vertical:10),
                child:isMobile ?
                    FlipCard(
                      key:cardKey,
                      flipOnTouch:false,
                      direction:FlipDirection.HORIZONTAL,
                      front:Center(
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(30),

                          child: BackdropFilter(
                            filter: ImageFilter.blur(
                              sigmaX: 15,
                              sigmaY: 15,
                            ),

                            child: Container(
                              width: 450,
                              padding: const EdgeInsets.all(35),

                              decoration: BoxDecoration(
                                color: Colors.white.withOpacity((0.06)
                                ),

                                borderRadius: BorderRadius.circular(30),

                                border: Border.all(
                                  color: Colors.white.withOpacity(0.15),
                                ),

                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.blue.withOpacity(0.25),
                                    blurRadius: 30,
                                    spreadRadius: 5,
                                  )
                                ],
                              ),

                              child:SingleChildScrollView(
                                child: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    /// LOGO
                                    Container(
                                      height: 60,
                                      width: 60,

                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(18),
                                        gradient: const LinearGradient(
                                          colors: [
                                            Colors.cyan,
                                            Colors.purple,
                                          ],
                                        ),
                                      ),

                                      child: const Icon(
                                        Icons.print_rounded,
                                        color: Colors.white,
                                        size: 30,
                                      ),
                                    ),

                                    const SizedBox(height: 25),

                                    const CustomText(
                                      text: "Welcome back 👋",
                                      color: Colors.white,
                                      fontSize: 32,
                                      fontWeight: FontWeight.bold,
                                    ),

                                    const SizedBox(height: 10),

                                    const CustomText(
                                      text: "Sign in to continue to your account",
                                      color: Colors.grey,
                                      fontSize: 16,
                                    ),

                                    const SizedBox(height: 35),

                                    /// EMAIL
                                    const CustomText(
                                      text: "Email Address",
                                      color: Colors.white,
                                      fontWeight: FontWeight.w500,
                                    ),

                                    const SizedBox(height: 10),

                                    CustomTextField(
                                      controller: emailController,
                                      prefixIcon: Icons.mail_outline,
                                      prefixIconColor: AppColor.cyan,
                                      text: "Enter your email",
                                      fillColor: AppColor.white,
                                      textStyle: TextStyle(color: AppColor.white),
                                    ),

                                    const SizedBox(height: 25),

                                    /// PASSWORD
                                    CustomText(
                                      text: "Password",
                                      color: Colors.white,
                                      fontWeight: FontWeight.w500,
                                    ),

                                    const SizedBox(height: 10),

                                    CustomTextFieldWithObscureText(
                                      controller: passwordController,
                                      text: "Enter your password",
                                      fillColor: AppColor.white,
                                      textStyle: TextStyle(color: AppColor.white),
                                      prefixIcon: Icons.lock_outline,
                                      prefixIconColor: AppColor.cyan,
                                    ),

                                    const SizedBox(height: 15),

                                    Align(
                                        alignment: Alignment.centerRight,
                                        child: CustomTextButton(
                                          text: "Forgot Password?",
                                          containerColor: AppColor.transparent,
                                          textColor: Colors.cyan,
                                        )
                                    ),

                                    const SizedBox(height: 10),

                                    /// BUTTON
                                    Container(
                                      width: double.infinity,
                                      height: 60,

                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(18),

                                        gradient: const LinearGradient(
                                          colors: [
                                            Colors.cyan,
                                            Colors.purple,
                                          ],
                                        ),

                                        boxShadow: [
                                          BoxShadow(
                                            color: Colors.cyan.withOpacity(0.4),
                                            blurRadius: 20,
                                          )
                                        ],
                                      ),
                                      child: ElevatedButton(
                                        onPressed: () {cardKey.currentState?.toggleCard();},
                                        style: ElevatedButton.styleFrom(
                                          backgroundColor: Colors.transparent,
                                          shadowColor: Colors.transparent,
                                          shape: RoundedRectangleBorder(
                                            borderRadius: BorderRadius.circular(
                                                18),
                                          ),
                                        ),
                                        child: const Text(
                                          "Sign In",
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 18,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      ),
                                    ),

                                    SizedBox(height:10),
                                    /// DIVIDER
                                    Row(
                                      children: [

                                        Expanded(
                                          child: Divider(
                                            color: Colors.white.withOpacity(0.2),
                                          ),
                                        ),

                                        Padding(
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 15),
                                          child: CustomText(
                                            text: "or continue with",
                                            color: AppColor.grey,
                                          ),
                                        ),

                                        Expanded(
                                          child: Divider(
                                            color: Colors.white.withOpacity(0.2),
                                          ),
                                        ),
                                      ],
                                    ),

                                    const SizedBox(height: 25),

                                    /// SOCIAL
                                    Row(
                                      mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,

                                      children: [
                                        // socialButton(Icons.g_mobiledata),
                                        // socialButton(Icons.apple),
                                        // socialButton(Icons.discord),
                                      ],
                                    ),

                                    /// SIGNUP
                                   Row(
                                     mainAxisAlignment:MainAxisAlignment.center,
                                     children: [
                                       CustomText(
                                         text:"Don't have an account?",
                                         color:AppColor.grey,
                                       ),
                                       CustomTextButton(
                                           text:"Sign Up",
                                           containerColor:AppColor.transparent,
                                           textColor:AppColor.cyan,
                                         function:(){cardKey.currentState?.toggleCard();},
                                       )
                                     ],
                                   )
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                      back:emailVerification ?
                      Center(
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(30),
                          child: BackdropFilter(
                            filter: ImageFilter.blur(
                              sigmaX: 15,
                              sigmaY: 15,
                            ),

                            child: Container(
                              width: 450,
                              padding: const EdgeInsets.all(35),

                              decoration: BoxDecoration(
                                color: Colors.white.withOpacity((0.06)
                                ),

                                borderRadius: BorderRadius.circular(30),

                                border: Border.all(
                                  color: Colors.white.withOpacity(0.15),
                                ),

                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.blue.withOpacity(0.25),
                                    blurRadius: 30,
                                    spreadRadius: 5,
                                  )
                                ],
                              ),

                              child:SingleChildScrollView(
                                child: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    /// LOGO
                                    Center(
                                      child:CustomIcon(
                                        icon:Icons.face,
                                        color:AppColor.blue,
                                        size: 40,
                                      ),
                                    ),

                                    const SizedBox(height: 25),

                                    const CustomText(
                                      text: "Create your account",
                                      color: Colors.white,
                                      fontSize: 32,
                                      fontWeight: FontWeight.bold,
                                    ),

                                    const SizedBox(height: 10),

                                    const CustomText(
                                      text: "Join thousands of makers and\nbring your ideas to life.",
                                      color: Colors.grey,
                                      fontSize: 16,
                                    ),

                                    const SizedBox(height: 35),

                                    ///NAME
                                    const CustomText(
                                      text: "Name",
                                      color: Colors.white,
                                      fontWeight: FontWeight.w500,
                                    ),

                                    const SizedBox(height: 10),

                                    CustomTextField(
                                      controller: emailController,
                                      prefixIcon: Icons.mail_outline,
                                      prefixIconColor: AppColor.cyan,
                                      text: "Enter your name",
                                      fillColor: AppColor.white,
                                      textStyle: TextStyle(color: AppColor.white),
                                    ),
                                    const SizedBox(height: 25),

                                    /// EMAIL
                                    const CustomText(
                                      text: "Email Address",
                                      color: Colors.white,
                                      fontWeight: FontWeight.w500,
                                    ),

                                    const SizedBox(height: 10),

                                    CustomTextField(
                                      controller: emailController,
                                      prefixIcon: Icons.mail_outline,
                                      prefixIconColor: AppColor.cyan,
                                      text: "Enter your email",
                                      fillColor: AppColor.white,
                                      textStyle: TextStyle(color: AppColor.white),
                                    ),

                                    const SizedBox(height: 25),

                                    ///MOBILE NUMBER
                                    CustomText(
                                      text: "Mobile",
                                      color: Colors.white,
                                      fontWeight: FontWeight.w500,
                                    ),

                                    const SizedBox(height: 10),

                                    CustomTextFieldWithObscureText(
                                      controller: passwordController,
                                      text: "Enter your mobile number",
                                      fillColor: AppColor.white,
                                      textStyle: TextStyle(color: AppColor.white),
                                      prefixIcon: Icons.lock_outline,
                                      prefixIconColor: AppColor.cyan,
                                    ),

                                    const SizedBox(height: 25),

                                    CustomText(
                                      text: "Gender",
                                      color: Colors.white,
                                      fontWeight: FontWeight.w500,
                                    ),

                                    SizedBox(height:10),

                                    CustomTextFieldWithObscureText(
                                      controller: passwordController,
                                      text: "Gender",
                                      fillColor: AppColor.white,
                                      textStyle: TextStyle(color: AppColor.white),
                                      prefixIcon: Icons.lock_outline,
                                      prefixIconColor: AppColor.cyan,
                                    ),

                                    const SizedBox(height: 25),

                                    CustomText(
                                      text: "Password",
                                      color: Colors.white,
                                      fontWeight: FontWeight.w500,
                                    ),

                                    SizedBox(height:10),

                                    CustomTextFieldWithObscureText(
                                      controller: passwordController,
                                      text: "New Password",
                                      fillColor: AppColor.white,
                                      textStyle: TextStyle(color: AppColor.white),
                                      prefixIcon: Icons.lock_outline,
                                      prefixIconColor: AppColor.cyan,
                                    ),

                                    const SizedBox(height: 25),

                                    CustomText(
                                      text: "Role",
                                      color: Colors.white,
                                      fontWeight: FontWeight.w500,
                                    ),

                                    SizedBox(height:10),

                                    // CustomTextFieldWithObscureText(
                                    //   controller: passwordController,
                                    //   text: "Role",
                                    //   fillColor: AppColor.white,
                                    //   textStyle: TextStyle(color: AppColor.white),
                                    //   prefixIcon: Icons.lock_outline,
                                    //   prefixIconColor: AppColor.cyan,
                                    // ),
                                    CustomDropDownMenu(
                                      dropDownEntry: [
                                        DropdownMenuEntry(value:"user", label:"User"),
                                        DropdownMenuEntry(value:"admin", label:"Admin"),
                                      ],
                                      initialValue:'user',
                                    ),

                                    const SizedBox(height: 25),

                                    if(role == 'admin')
                                    CustomText(
                                      text: "Code",
                                      color: Colors.white,
                                      fontWeight: FontWeight.w500,
                                    ),

                                    SizedBox(height:10),

                                    if(role == 'admin')
                                    CustomTextFieldWithObscureText(
                                      controller: passwordController,
                                      text: "Code",
                                      fillColor: AppColor.white,
                                      textStyle: TextStyle(color: AppColor.white),
                                      prefixIcon: Icons.lock_outline,
                                      prefixIconColor: AppColor.cyan,
                                    ),

                                    const SizedBox(height: 25),


                                    /// BUTTON
                                    Container(
                                      width: double.infinity,
                                      height: 60,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(18),
                                        gradient: const LinearGradient(
                                          colors: [
                                            Colors.cyan,
                                            Colors.purple,
                                          ],
                                        ),
                                        boxShadow: [
                                          BoxShadow(
                                            color: Colors.cyan.withOpacity(0.4),
                                            blurRadius: 20,
                                          )
                                        ],
                                      ),
                                      child: ElevatedButton(
                                        onPressed: () {},
                                        style: ElevatedButton.styleFrom(
                                          backgroundColor: Colors.transparent,
                                          shadowColor: Colors.transparent,
                                          shape: RoundedRectangleBorder(
                                            borderRadius: BorderRadius.circular(
                                                18),
                                          ),
                                        ),
                                        child: const Text(
                                          "Sign Up",
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 18,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      ),
                                    ),

                                    const SizedBox(height: 30),

                                    /// DIVIDER
                                    Row(
                                      children: [
                                        Expanded(
                                          child: Divider(
                                            color: Colors.white.withOpacity(0.2),
                                          ),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 15),
                                          child: CustomText(
                                            text: "or continue with",
                                            color: AppColor.grey,
                                          ),
                                        ),
                                        Expanded(
                                          child: Divider(
                                            color: Colors.white.withOpacity(0.2),
                                          ),
                                        ),
                                      ],
                                    ),

                                    const SizedBox(height: 25),

                                    /// SOCIAL
                                    Row(
                                      mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,

                                      children: [
                                        // socialButton(Icons.g_mobiledata),
                                        // socialButton(Icons.apple),
                                        // socialButton(Icons.discord),
                                      ],
                                    ),

                                    /// SIGNUP
                                    Row(
                                      mainAxisAlignment:MainAxisAlignment.center,
                                      children: [
                                        CustomText(
                                          text:"already have and account?",
                                          color:AppColor.grey,
                                        ),
                                        CustomTextButton(
                                            text:"Sign in",
                                            containerColor:AppColor.transparent,
                                            textColor:AppColor.cyan,
                                            function:(){cardKey.currentState?.toggleCard();},
                                        )
                                      ],
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                      )

                      :Center(
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(30),
                          child: BackdropFilter(
                            filter: ImageFilter.blur(
                              sigmaX: 15,
                              sigmaY: 15,
                            ),

                            child: Container(
                              width: 450,
                              padding: const EdgeInsets.all(35),

                              decoration: BoxDecoration(
                                color: Colors.white.withOpacity((0.06)
                                ),

                                borderRadius: BorderRadius.circular(30),

                                border: Border.all(
                                  color: Colors.white.withOpacity(0.15),
                                ),

                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.blue.withOpacity(0.25),
                                    blurRadius: 30,
                                    spreadRadius: 5,
                                  )
                                ],
                              ),

                              child:SingleChildScrollView(
                                child: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    /// LOGO
                                    Center(
                                      child: CustomContainer(
                                        shape:BoxShape.circle,
                                        color:AppColor.transparent,
                                        child:CustomIcon(
                                          icon:Icons.swipe_right,
                                          color:AppColor.greenAccent,
                                          size:40,
                                        ),
                                      ),
                                    ),

                                    const SizedBox(height: 25),

                                    Center(
                                      child: const CustomText(
                                        text: "Verify your email",
                                        color: Colors.white,
                                        fontSize: 32,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),

                                    const SizedBox(height: 10),

                                    Center(
                                      child: const CustomText(
                                        text: "We've send a verification link link to",
                                        color: Colors.grey,
                                        fontSize: 16,
                                      ),
                                    ),
                                    Center(
                                      child: const CustomText(
                                        text: "user_mail@gmail.com",
                                        color: Colors.cyan,
                                        fontSize: 16,
                                      ),
                                    ),

                                    const SizedBox(height: 35),

                                    /// EMAIL
                                    const CustomText(
                                      text: "Email Address",
                                      color: Colors.white,
                                      fontWeight: FontWeight.w500,
                                    ),

                                    const SizedBox(height: 10),

                                    CustomTextField(
                                      controller: emailController,
                                      prefixIcon: Icons.mail_outline,
                                      prefixIconColor: AppColor.cyan,
                                      text: "Enter your email",
                                      fillColor: AppColor.white,
                                      textStyle: TextStyle(color: AppColor.white),
                                    ),

                                    const SizedBox(height: 25),

                                    /// PASSWORD
                                    if(sendOtp == true)
                                    const CustomText(
                                      text: "OTP",
                                      color: Colors.white,
                                      fontWeight: FontWeight.w500,
                                    ),

                                    const SizedBox(height: 10),

                                    if(sendOtp == true)
                                    CustomTextField(
                                      controller: emailController,
                                      prefixIcon: Icons.mail_outline,
                                      prefixIconColor: AppColor.cyan,
                                      text: "Enter OTP",
                                      fillColor: AppColor.white,
                                      textStyle: TextStyle(color: AppColor.white),
                                    ),

                                    const SizedBox(height: 25),

                                    Row(
                                      mainAxisAlignment:MainAxisAlignment.spaceAround,
                                        children:[
                                         sendOtp ?
                                          CustomTextButton(
                                            text: "Resend OTP",
                                            containerColor: AppColor.transparent,
                                            textColor: Colors.cyan,
                                          )
                                          :CustomTextButton(
                                            function:(){sendOtpControllerFunction(emailController, context, sendOtp,setState);},
                                            text: "Send OTP",
                                            containerColor: AppColor.transparent,
                                            textColor: Colors.cyan,
                                          )
                                      ]
                                    ),

                                    const SizedBox(height: 10),

                                    /// BUTTON
                                    if(sendOtp)
                                    Container(
                                      width: double.infinity,
                                      height: 60,

                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(18),

                                        gradient: const LinearGradient(
                                          colors: [
                                            Colors.cyan,
                                            Colors.purple,
                                          ],
                                        ),

                                        boxShadow: [
                                          BoxShadow(
                                            color: Colors.cyan.withOpacity(0.4),
                                            blurRadius: 20,
                                          )
                                        ],
                                      ),
                                      child: ElevatedButton(
                                        onPressed: () {},

                                        style: ElevatedButton.styleFrom(
                                          backgroundColor: Colors.transparent,
                                          shadowColor: Colors.transparent,
                                          shape: RoundedRectangleBorder(
                                            borderRadius: BorderRadius.circular(
                                                18),
                                          ),
                                        ),
                                        child: const Text(
                                          "Verify Email",
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 18,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    )

                    :Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    /// LEFT SECTION
                    Expanded(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          CustomText(
                            text: "From",
                            color: AppColor.white,
                            fontSize: 65,
                            fontWeight: FontWeight.bold,
                            height: 1,
                          ),
                          CustomText(
                            text: "Concept to",
                            color: AppColor.white,
                            fontSize: 65,
                            fontWeight: FontWeight.bold,
                            height: 1,
                          ),

                          ShaderMask(
                            shaderCallback: (bounds) {
                              return LinearGradient(
                                colors: [
                                  AppColor.cyan,
                                  AppColor.purple,
                                ],
                              ).createShader(bounds);
                            },
                            child: CustomText(
                              text: "Creation",
                              color: AppColor.white,
                              fontSize: 70,
                              fontWeight: FontWeight.bold,
                              height: 1,
                            ),
                          ),

                          const SizedBox(height: 25),

                          CustomText(
                            text: "The all-in-one platform for\nmodern 3D printing.",
                            color: AppColor.grey,
                            fontSize: 18,
                            height: 1.5,
                          ),

                          const SizedBox(height: 40),

                          Row(
                            children: [
                              CustomIcon(
                                  icon: Icons.upload, color: AppColor.cyan),
                              const SizedBox(width: 8),
                              CustomText(
                                text: "Upload",
                                color: AppColor.white,
                              ),

                              const SizedBox(width: 30),

                              CustomIcon(
                                  icon: Icons.layers, color: Colors.cyan),
                              const SizedBox(width: 8),
                              CustomText(
                                text: "Slice",
                                color: AppColor.white,
                              ),

                              const SizedBox(width: 30),

                              CustomIcon(icon: Icons.print, color: Colors.cyan),
                              const SizedBox(width: 8),
                              CustomText(
                                text: "Print",
                                color: AppColor.white,
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                    const SizedBox(width: 50),

                    /// RIGHT SECTION
                    FlipCard(
                      key:cardKey,
                      flipOnTouch:false,
                      direction:FlipDirection.HORIZONTAL,
                      front:Center(
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(30),

                          child: BackdropFilter(
                            filter: ImageFilter.blur(
                              sigmaX: 15,
                              sigmaY: 15,
                            ),

                            child: Container(
                              width: 450,
                              padding: const EdgeInsets.all(35),

                              decoration: BoxDecoration(
                                color: Colors.white.withOpacity((0.06)
                                ),

                                borderRadius: BorderRadius.circular(30),

                                border: Border.all(
                                  color: Colors.white.withOpacity(0.15),
                                ),

                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.blue.withOpacity(0.25),
                                    blurRadius: 30,
                                    spreadRadius: 5,
                                  )
                                ],
                              ),

                              child:SingleChildScrollView(
                                child: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    /// LOGO
                                    Container(
                                      height: 60,
                                      width: 60,

                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(18),
                                        gradient: const LinearGradient(
                                          colors: [
                                            Colors.cyan,
                                            Colors.purple,
                                          ],
                                        ),
                                      ),

                                      child: const Icon(
                                        Icons.print_rounded,
                                        color: Colors.white,
                                        size: 30,
                                      ),
                                    ),

                                    const SizedBox(height: 25),

                                    const CustomText(
                                      text: "Welcome back 👋",
                                      color: Colors.white,
                                      fontSize: 32,
                                      fontWeight: FontWeight.bold,
                                    ),

                                    const SizedBox(height: 10),

                                    const CustomText(
                                      text: "Sign in to continue to your account",
                                      color: Colors.grey,
                                      fontSize: 16,
                                    ),

                                    const SizedBox(height: 35),

                                    /// EMAIL
                                    const CustomText(
                                      text: "Email Address",
                                      color: Colors.white,
                                      fontWeight: FontWeight.w500,
                                    ),

                                    const SizedBox(height: 10),

                                    CustomTextField(
                                      controller: emailController,
                                      prefixIcon: Icons.mail_outline,
                                      prefixIconColor: AppColor.cyan,
                                      text: "Enter your email",
                                      fillColor: AppColor.white,
                                      textStyle: TextStyle(color: AppColor.white),
                                    ),

                                    const SizedBox(height: 25),

                                    /// PASSWORD
                                    CustomText(
                                      text: "Password",
                                      color: Colors.white,
                                      fontWeight: FontWeight.w500,
                                    ),

                                    const SizedBox(height: 10),

                                    CustomTextFieldWithObscureText(
                                      controller: passwordController,
                                      text: "Enter your password",
                                      fillColor: AppColor.white,
                                      textStyle: TextStyle(color: AppColor.white),
                                      prefixIcon: Icons.lock_outline,
                                      prefixIconColor: AppColor.cyan,
                                    ),

                                    const SizedBox(height: 15),

                                    Align(
                                        alignment: Alignment.centerRight,
                                        child: CustomTextButton(
                                          text: "Forgot Password?",
                                          containerColor: AppColor.transparent,
                                          textColor: Colors.cyan,
                                        )
                                    ),

                                    const SizedBox(height: 10),

                                    /// BUTTON
                                    Container(
                                      width: double.infinity,
                                      height: 60,

                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(18),

                                        gradient: const LinearGradient(
                                          colors: [
                                            Colors.cyan,
                                            Colors.purple,
                                          ],
                                        ),

                                        boxShadow: [
                                          BoxShadow(
                                            color: Colors.cyan.withOpacity(0.4),
                                            blurRadius: 20,
                                          )
                                        ],
                                      ),
                                      child: ElevatedButton(
                                        onPressed: () {cardKey.currentState?.toggleCard();},
                                        style: ElevatedButton.styleFrom(
                                          backgroundColor: Colors.transparent,
                                          shadowColor: Colors.transparent,
                                          shape: RoundedRectangleBorder(
                                            borderRadius: BorderRadius.circular(
                                                18),
                                          ),
                                        ),
                                        child: const Text(
                                          "Sign In",
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 18,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      ),
                                    ),

                                    SizedBox(height:10),
                                    /// DIVIDER
                                    Row(
                                      children: [

                                        Expanded(
                                          child: Divider(
                                            color: Colors.white.withOpacity(0.2),
                                          ),
                                        ),

                                        Padding(
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 15),
                                          child: CustomText(
                                            text: "or continue with",
                                            color: AppColor.grey,
                                          ),
                                        ),

                                        Expanded(
                                          child: Divider(
                                            color: Colors.white.withOpacity(0.2),
                                          ),
                                        ),
                                      ],
                                    ),

                                    const SizedBox(height: 25),

                                    /// SOCIAL
                                    Row(
                                      mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,

                                      children: [
                                        // socialButton(Icons.g_mobiledata),
                                        // socialButton(Icons.apple),
                                        // socialButton(Icons.discord),
                                      ],
                                    ),

                                    /// SIGNUP
                                    Row(
                                      mainAxisAlignment:MainAxisAlignment.center,
                                      children: [
                                        CustomText(
                                          text:"Don't have an account?",
                                          color:AppColor.grey,
                                        ),
                                        CustomTextButton(
                                          text:"Sign Up",
                                          containerColor:AppColor.transparent,
                                          textColor:AppColor.cyan,
                                          function:(){cardKey.currentState?.toggleCard();},
                                        )
                                      ],
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                      back:emailVerification ?
                      Center(
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(30),
                          child: BackdropFilter(
                            filter: ImageFilter.blur(
                              sigmaX: 15,
                              sigmaY: 15,
                            ),

                            child: Container(
                              width: 450,
                              padding: const EdgeInsets.all(35),

                              decoration: BoxDecoration(
                                color: Colors.white.withOpacity((0.06)
                                ),

                                borderRadius: BorderRadius.circular(30),

                                border: Border.all(
                                  color: Colors.white.withOpacity(0.15),
                                ),

                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.blue.withOpacity(0.25),
                                    blurRadius: 30,
                                    spreadRadius: 5,
                                  )
                                ],
                              ),

                              child:SingleChildScrollView(
                                child: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    /// LOGO
                                    Center(
                                      child:CustomIcon(
                                        icon:Icons.face,
                                        color:AppColor.blue,
                                        size: 40,
                                      ),
                                    ),

                                    const SizedBox(height: 25),

                                    const CustomText(
                                      text: "Create your account",
                                      color: Colors.white,
                                      fontSize: 32,
                                      fontWeight: FontWeight.bold,
                                    ),

                                    const SizedBox(height: 10),

                                    const CustomText(
                                      text: "Join thousands of makers and\nbring your ideas to life.",
                                      color: Colors.grey,
                                      fontSize: 16,
                                    ),

                                    const SizedBox(height: 35),

                                    ///NAME
                                    const CustomText(
                                      text: "Name",
                                      color: Colors.white,
                                      fontWeight: FontWeight.w500,
                                    ),

                                    const SizedBox(height: 10),

                                    CustomTextField(
                                      controller: emailController,
                                      prefixIcon: Icons.mail_outline,
                                      prefixIconColor: AppColor.cyan,
                                      text: "Enter your name",
                                      fillColor: AppColor.white,
                                      textStyle: TextStyle(color: AppColor.white),
                                    ),
                                    const SizedBox(height: 25),

                                    /// EMAIL
                                    const CustomText(
                                      text: "Email Address",
                                      color: Colors.white,
                                      fontWeight: FontWeight.w500,
                                    ),

                                    const SizedBox(height: 10),

                                    CustomTextField(
                                      controller: emailController,
                                      prefixIcon: Icons.mail_outline,
                                      prefixIconColor: AppColor.cyan,
                                      text: "Enter your email",
                                      fillColor: AppColor.white,
                                      textStyle: TextStyle(color: AppColor.white),
                                    ),

                                    const SizedBox(height: 25),

                                    ///MOBILE NUMBER
                                    CustomText(
                                      text: "Mobile",
                                      color: Colors.white,
                                      fontWeight: FontWeight.w500,
                                    ),

                                    const SizedBox(height: 10),

                                    CustomTextFieldWithObscureText(
                                      controller: passwordController,
                                      text: "Enter your mobile number",
                                      fillColor: AppColor.white,
                                      textStyle: TextStyle(color: AppColor.white),
                                      prefixIcon: Icons.lock_outline,
                                      prefixIconColor: AppColor.cyan,
                                    ),

                                    const SizedBox(height: 25),

                                    CustomText(
                                      text: "Gender",
                                      color: Colors.white,
                                      fontWeight: FontWeight.w500,
                                    ),

                                    SizedBox(height:10),

                                    CustomTextFieldWithObscureText(
                                      controller: passwordController,
                                      text: "Gender",
                                      fillColor: AppColor.white,
                                      textStyle: TextStyle(color: AppColor.white),
                                      prefixIcon: Icons.lock_outline,
                                      prefixIconColor: AppColor.cyan,
                                    ),

                                    const SizedBox(height: 25),

                                    CustomText(
                                      text: "Password",
                                      color: Colors.white,
                                      fontWeight: FontWeight.w500,
                                    ),

                                    SizedBox(height:10),

                                    CustomTextFieldWithObscureText(
                                      controller: passwordController,
                                      text: "New Password",
                                      fillColor: AppColor.white,
                                      textStyle: TextStyle(color: AppColor.white),
                                      prefixIcon: Icons.lock_outline,
                                      prefixIconColor: AppColor.cyan,
                                    ),

                                    const SizedBox(height: 25),

                                    CustomText(
                                      text: "Role",
                                      color: Colors.white,
                                      fontWeight: FontWeight.w500,
                                    ),

                                    SizedBox(height:10),

                                    // CustomTextFieldWithObscureText(
                                    //   controller: passwordController,
                                    //   text: "Role",
                                    //   fillColor: AppColor.white,
                                    //   textStyle: TextStyle(color: AppColor.white),
                                    //   prefixIcon: Icons.lock_outline,
                                    //   prefixIconColor: AppColor.cyan,
                                    // ),
                                    CustomDropDownMenu(
                                      dropDownEntry: [
                                        DropdownMenuEntry(value:"user", label:"User"),
                                        DropdownMenuEntry(value:"admin", label:"Admin"),
                                      ],
                                      initialValue:'user',
                                    ),

                                    const SizedBox(height: 25),

                                    if(role == 'admin')
                                      CustomText(
                                        text: "Code",
                                        color: Colors.white,
                                        fontWeight: FontWeight.w500,
                                      ),

                                    SizedBox(height:10),

                                    if(role == 'admin')
                                      CustomTextFieldWithObscureText(
                                        controller: passwordController,
                                        text: "Code",
                                        fillColor: AppColor.white,
                                        textStyle: TextStyle(color: AppColor.white),
                                        prefixIcon: Icons.lock_outline,
                                        prefixIconColor: AppColor.cyan,
                                      ),

                                    const SizedBox(height: 25),


                                    /// BUTTON
                                    Container(
                                      width: double.infinity,
                                      height: 60,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(18),
                                        gradient: const LinearGradient(
                                          colors: [
                                            Colors.cyan,
                                            Colors.purple,
                                          ],
                                        ),
                                        boxShadow: [
                                          BoxShadow(
                                            color: Colors.cyan.withOpacity(0.4),
                                            blurRadius: 20,
                                          )
                                        ],
                                      ),
                                      child: ElevatedButton(
                                        onPressed: () {},
                                        style: ElevatedButton.styleFrom(
                                          backgroundColor: Colors.transparent,
                                          shadowColor: Colors.transparent,
                                          shape: RoundedRectangleBorder(
                                            borderRadius: BorderRadius.circular(
                                                18),
                                          ),
                                        ),
                                        child: const Text(
                                          "Sign Up",
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 18,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      ),
                                    ),

                                    const SizedBox(height: 30),

                                    /// DIVIDER
                                    Row(
                                      children: [
                                        Expanded(
                                          child: Divider(
                                            color: Colors.white.withOpacity(0.2),
                                          ),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 15),
                                          child: CustomText(
                                            text: "or continue with",
                                            color: AppColor.grey,
                                          ),
                                        ),
                                        Expanded(
                                          child: Divider(
                                            color: Colors.white.withOpacity(0.2),
                                          ),
                                        ),
                                      ],
                                    ),

                                    const SizedBox(height: 25),

                                    /// SOCIAL
                                    Row(
                                      mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,

                                      children: [
                                        // socialButton(Icons.g_mobiledata),
                                        // socialButton(Icons.apple),
                                        // socialButton(Icons.discord),
                                      ],
                                    ),

                                    /// SIGNUP
                                    Row(
                                      mainAxisAlignment:MainAxisAlignment.center,
                                      children: [
                                        CustomText(
                                          text:"already have and account?",
                                          color:AppColor.grey,
                                        ),
                                        CustomTextButton(
                                          text:"Sign in",
                                          containerColor:AppColor.transparent,
                                          textColor:AppColor.cyan,
                                          function:(){cardKey.currentState?.toggleCard();},
                                        )
                                      ],
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                      )

                          :Center(
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(30),
                              child: BackdropFilter(
                                filter: ImageFilter.blur(
                                  sigmaX: 15,
                                  sigmaY: 15,
                                ),

                                child: Container(
                                  width: 450,
                                  padding: const EdgeInsets.all(35),

                                  decoration: BoxDecoration(
                                    color: Colors.white.withOpacity((0.06)
                                    ),

                                    borderRadius: BorderRadius.circular(30),

                                    border: Border.all(
                                      color: Colors.white.withOpacity(0.15),
                                    ),

                                    boxShadow: [
                                      BoxShadow(
                                        color: Colors.blue.withOpacity(0.25),
                                        blurRadius: 30,
                                        spreadRadius: 5,
                                      )
                                    ],
                                  ),

                                  child:SingleChildScrollView(
                                    child: Column(
                                      mainAxisSize: MainAxisSize.min,
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        /// LOGO
                                        Center(
                                          child: CustomContainer(
                                            shape:BoxShape.circle,
                                            color:AppColor.transparent,
                                            child:CustomIcon(
                                              icon:Icons.swipe_right,
                                              color:AppColor.greenAccent,
                                              size:40,
                                            ),
                                          ),
                                        ),

                                        const SizedBox(height: 25),

                                        Center(
                                          child: const CustomText(
                                            text: "Verify your email",
                                            color: Colors.white,
                                            fontSize: 32,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),

                                        const SizedBox(height: 10),

                                        Center(
                                          child: const CustomText(
                                            text: "We've send a verification link link to",
                                            color: Colors.grey,
                                            fontSize: 16,
                                          ),
                                        ),
                                        Center(
                                          child: const CustomText(
                                            text: "user_mail@gmail.com",
                                            color: Colors.cyan,
                                            fontSize: 16,
                                          ),
                                        ),

                                        const SizedBox(height: 35),

                                        /// EMAIL
                                        const CustomText(
                                          text: "Email Address",
                                          color: Colors.white,
                                          fontWeight: FontWeight.w500,
                                        ),

                                        const SizedBox(height: 10),

                                        CustomTextField(
                                          controller: emailController,
                                          prefixIcon: Icons.mail_outline,
                                          prefixIconColor: AppColor.cyan,
                                          text: "Enter your email",
                                          fillColor: AppColor.white,
                                          textStyle: TextStyle(color: AppColor.white),
                                        ),

                                        const SizedBox(height: 25),

                                        /// PASSWORD
                                        if(sendOtp == true)
                                          const CustomText(
                                            text: "OTP",
                                            color: Colors.white,
                                            fontWeight: FontWeight.w500,
                                          ),

                                        const SizedBox(height: 10),

                                        if(sendOtp == true)
                                          CustomTextField(
                                            controller: emailController,
                                            prefixIcon: Icons.mail_outline,
                                            prefixIconColor: AppColor.cyan,
                                            text: "Enter OTP",
                                            fillColor: AppColor.white,
                                            textStyle: TextStyle(color: AppColor.white),
                                          ),

                                        const SizedBox(height: 25),

                                        Row(
                                            mainAxisAlignment:MainAxisAlignment.spaceAround,
                                            children:[
                                              sendOtp ?
                                              CustomTextButton(
                                                text: "Resend OTP",
                                                containerColor: AppColor.transparent,
                                                textColor: Colors.cyan,
                                              )
                                                  :CustomTextButton(
                                                text: "Send OTP",
                                                containerColor: AppColor.transparent,
                                                textColor: Colors.cyan,
                                              ),
                                            ]
                                        ),

                                        const SizedBox(height: 10),

                                        /// BUTTON
                                        if(sendOtp)
                                          Container(
                                            width: double.infinity,
                                            height: 60,

                                            decoration: BoxDecoration(
                                              borderRadius: BorderRadius.circular(18),

                                              gradient: const LinearGradient(
                                                colors: [
                                                  Colors.cyan,
                                                  Colors.purple,
                                                ],
                                              ),

                                              boxShadow: [
                                                BoxShadow(
                                                  color: Colors.cyan.withOpacity(0.4),
                                                  blurRadius: 20,
                                                )
                                              ],
                                            ),
                                            child: ElevatedButton(
                                              onPressed: () {},

                                              style: ElevatedButton.styleFrom(
                                                backgroundColor: Colors.transparent,
                                                shadowColor: Colors.transparent,
                                                shape: RoundedRectangleBorder(
                                                  borderRadius: BorderRadius.circular(
                                                      18),
                                                ),
                                              ),
                                              child: const Text(
                                                "Verify Email",
                                                style: TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 18,
                                                  fontWeight: FontWeight.bold,
                                                ),
                                              ),
                                            ),
                                          ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}