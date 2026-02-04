import 'package:flutter/material.dart';
import 'package:sunuTask/core/constants/app_colors.dart';
import 'package:sunuTask/core/constants/app_strings.dart';

class OnboardingScreen extends StatefulWidget{
  const OnboardingScreen({super.key});
  @override
  State<StatefulWidget> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen>{
  PageController pageController = PageController(initialPage: 0);

  int currentPosition = 0;

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: Column(

        children: [

          Expanded(
            child: PageView(
            controller: pageController,
            children: [

              Container(
                color: AppColors.white,
                child: Column(
                  children: [
                    Padding(
                      padding: EdgeInsets.all(20),
                      child: Row (
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          TextButton(
                            onPressed: () {},
                            child: Text('Skip'),
                          )
                        ],
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.all(30),
                      child: Image.asset("assets/images/onboarding/Sandy_Bus-09_Single-11.jpg"),
                    ),
                    Center(
                      child: Text(
                        "Text 1",
                        style: TextStyle(fontSize: 35,fontWeight: FontWeight.bold),
                      ),
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    Center(
                      child: Text(
                        "lorem ipsum dolor sit" * 10,
                        textAlign: TextAlign.center,
                        style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold),
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                color: AppColors.white,
                child: Column(
                  children: [
                    Padding(
                      padding: EdgeInsets.all(20),
                      child: Row (
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          TextButton(
                            onPressed: () {},
                            child: Text('Skip'),
                          )
                        ],
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.all(30),
                      child: Image.asset("assets/images/onboarding/Sandy_Bus-09_Single-11.jpg"),
                    ),
                    Center(
                      child: Text(
                        "Text 1",
                        style: TextStyle(fontSize: 35,fontWeight: FontWeight.bold),
                      ),
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    Center(
                      child: Text(
                        "lorem ipsum dolor sit" * 10,
                        textAlign: TextAlign.center,
                        style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold),
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                color: AppColors.white,
                child: Column(
                  children: [
                    Padding(
                      padding: EdgeInsets.all(20),
                      child: Row (
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          TextButton(
                            onPressed: () {},
                            child: Text('Skip'),
                          )
                        ],
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.all(30),
                      child: Image.asset("assets/images/onboarding/Sandy_Bus-09_Single-11.jpg"),
                    ),
                    Center(
                      child: Text(
                        "Text 1",
                        style: TextStyle(fontSize: 35,fontWeight: FontWeight.bold),
                      ),
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    Center(
                      child: Text(
                        "lorem ipsum dolor sit" * 10,
                        textAlign: TextAlign.center,
                        style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold),
                      ),
                    ),
                  ],
                ),
              ),
            ],
           ),
          ),
          Padding(
              padding: EdgeInsets.all(20),
            child: Row (
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                TextButton(
                    onPressed: () {
                      pageController.previousPage(
                          duration: Duration(milliseconds: 500),
                          curve: Curves.linear,
                      );
                    },
                    child: Text('Back'),
                ),
                TextButton(
                  onPressed: () {
                    pageController.nextPage(
                      duration: Duration(milliseconds: 500),
                      curve: Curves.ease,
                    );
                  },
                  child: Text('Next'),
                ),
              ],
            ),
          ),

        ],
      )
    );
  }

}