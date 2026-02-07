import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:sunuTask/core/constants/app_colors.dart';
import 'package:sunuTask/core/constants/app_strings.dart';
import 'package:sunuTask/services/storage_service.dart';

import '../../models/OnboardinItem.dart';
import '../home/home_screen.dart';

/*
Ceci définit OnboardingScreen comme un StatefulWidget.
On choisit un StatefulWidget car l'écran doit se souvenir
de l'état actuel et le modifier, par exemple,
pour savoir sur quelle page l'utilisateur se trouve.
Un StatelessWidget ne pourrait pas gérer ce changement
d'état interne.
 */
class OnboardingScreen extends StatefulWidget{
  const OnboardingScreen({super.key});
  @override
  State<StatefulWidget> createState() => _OnboardingScreenState();
}
/*
Ceci définit _OnboardingScreenState comme un état
de OnboardingScreen.
La classe State est le "cerveau" vivant et mutable. C'est elle qui
gère les changements d'état et les interactions avec l'utilisateur.
Conserve les données qui peuvent changer, comme l'état actuel de la page.
Contient la logique pour modifier ces données, comme les interactions
avec l'utilisateur.
Déclenche la reconstruction de l'interface et Gère le cycle de vie.
 */
class _OnboardingScreenState extends State<OnboardingScreen>{
  PageController pageController = PageController(initialPage: 0);
  int currentPage = 0;
  bool isLastPage = false;

  OnboardinItem item1 = OnboardinItem(title: AppStrings.onboardingTitle1, description: AppStrings.onboardingDesc1, icon: Icon(Icons.task_alt), color: AppColors.background);
  OnboardinItem item2 = OnboardinItem(title: AppStrings.onboardingTitle2, description: AppStrings.onboardingDesc2, icon: Icon(Icons.task_alt), color: AppColors.background);
  OnboardinItem item3 = OnboardinItem(title: AppStrings.onboardingTitle3, description: AppStrings.onboardingDesc3, icon: Icon(Icons.task_alt), color: AppColors.background);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.background,
       title: Padding(
         padding: EdgeInsets.all(20),
         child: Row (
           mainAxisAlignment: MainAxisAlignment.end,
           children: !isLastPage ? [
             TextButton(
               style: TextButton.styleFrom(
                 backgroundColor: AppColors.primary,
                 padding: EdgeInsets.symmetric(horizontal: 20, vertical: 8),
                 side: BorderSide(color: AppColors.primary, width: 2),
                 shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
               ),
               onPressed: () {
                  StorageService.instance.isOnboardingComplete = true;
                  Navigator.pushReplacement(
                      context,
                      PageRouteBuilder(
                          pageBuilder: (context, animation, secondaryAnimation) => const HomeScreen(),
                          transitionsBuilder: (context, animation, secondaryAnimation, child) {
                            return FadeTransition(
                              opacity: animation,
                              child: child,
                            );
                          },
                          transitionDuration: Duration(milliseconds: 300)
                      )
                  );
               },
               child: Text('Skip',style: TextStyle(fontSize: 18,color: AppColors.white)),
             )
           ] : [],
         ),
       ),
      ),

      body: Column(
        children: [
          Expanded(
            child: PageView(
            controller: pageController,
            onPageChanged: (value) {
              setState(() {
                currentPage = value;
                isLastPage = currentPage == 2;
              });
            },
            children: [
              //page 1
              Container(
                color: item1.color,
                child: Column(
                  children: [
                    Padding(padding: EdgeInsets.all(30),),
                    Center(
                      child: Text(
                        item1.title,
                        style: TextStyle(fontSize: 35,fontWeight: FontWeight.bold),
                      ),
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    Center(
                      child: Text(
                        item1.description,
                        textAlign: TextAlign.center,
                        style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold),
                      ),
                    ),
                  ],
                ),
              ),
              //page 2
              Container(
                color: item2.color,
                child: Column(
                  children: [
                    Padding(
                      padding: EdgeInsets.all(30),
                    ),
                    Center(
                      child: Text(
                        item2.title,
                        style: TextStyle(fontSize: 35,fontWeight: FontWeight.bold),
                      ),
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    Center(
                      child: Text(
                        item2.description,
                        textAlign: TextAlign.center,
                        style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold),
                      ),
                    ),
                  ],
                ),
              ),
              //page 3
              Container(
                color: item3.color,
                child: Column(
                  children: [
                    Padding(
                      padding: EdgeInsets.all(30),
                    ),
                    Center(

                      child: Text(

                        item3.title,
                        style: TextStyle(fontSize: 35,fontWeight: FontWeight.bold),
                      ),
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    Center(
                      child: Text(
                        item3.description,
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
              mainAxisAlignment: isLastPage ? MainAxisAlignment.center : MainAxisAlignment.spaceBetween,
              children: isLastPage ? [
                TextButton(
                  style: TextButton.styleFrom(
                    backgroundColor: AppColors.primary,
                    padding: EdgeInsets.symmetric(horizontal: 20, vertical: 8),
                    side: BorderSide(color: AppColors.primary, width: 2),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
                  ),
                  onPressed: () {
                    StorageService.instance.isOnboardingComplete = true;
                    Navigator.pushReplacement(
                        context,
                        PageRouteBuilder(
                            pageBuilder: (context, animation, secondaryAnimation) => const HomeScreen(),
                            transitionsBuilder: (context, animation, secondaryAnimation, child) {
                              return FadeTransition(
                                opacity: animation,
                                child: child,
                              );
                            },
                            transitionDuration: Duration(milliseconds: 300)
                        )
                    );
                  },
                  child: Text('Done',style: TextStyle(fontSize: 18,color: AppColors.white)),
                ),
              ] : [
                TextButton(
                  style: TextButton.styleFrom(
                    backgroundColor: currentPage == 0 ? AppColors.background : AppColors.primary,
                    padding: EdgeInsets.symmetric(horizontal:  20, vertical:  8),
                    side: BorderSide(color: currentPage == 0 ? AppColors.background : AppColors.primary, width:  2),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular( 5)),
                  ),
                  onPressed: () {
                    pageController.previousPage(
                      duration: Duration(milliseconds: 500),
                      curve: Curves.linear,
                    );
                  },
                  child: Text(currentPage == 0 ? '' : 'Back',style: TextStyle(fontSize: 18,color: AppColors.white)),
                ),
                SmoothPageIndicator(
                  controller: pageController,
                  count: 3,
                  effect: WormEffect(
                    dotHeight: 8,
                    dotWidth: 8,
                    activeDotColor: AppColors.primary,
                  )
                ),
                TextButton(
                  style: TextButton.styleFrom(
                    backgroundColor: AppColors.primary,
                    padding: EdgeInsets.symmetric(horizontal: 20, vertical: 8),
                    side: BorderSide(color: AppColors.primary, width: 2),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
                  ),
                  onPressed: () {
                    pageController.nextPage(
                      duration: Duration(milliseconds: 500),
                      curve: Curves.ease,
                    );
                  },
                  child: Text('Next',style: TextStyle(fontSize: 18,color: AppColors.white)),
                ),
              ],
            ),
          ),
        ],
      )
    );
  }

}