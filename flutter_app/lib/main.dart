import 'package:circle_nav_bar/circle_nav_bar.dart';
import 'package:flutter/material.dart';
import 'package:namer_app/colors.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  //application root
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
          useMaterial3: true,
          
        ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> with SingleTickerProviderStateMixin {
  int _tabIndex = 1;
  int get tabIndex => _tabIndex;
  set tabIndex(int v) {
    _tabIndex = v;
    setState(() {});
  }

  late PageController pageController;

  @override
  void initState() {
    super.initState();
    pageController = PageController(initialPage: _tabIndex);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      bottomNavigationBar: CircleNavBar(
        activeIcons:  [
          Icon(Icons.person,color: AppColors.tertiaryColor,),
          Icon(Icons.home, color: AppColors.tertiaryColor),
          Icon(Icons.favorite, color: AppColors.tertiaryColor),
        ],
        inactiveIcons: [
          Text(
            "Page1",
            style: TextStyle(
              color: AppColors.tertiaryColor,
              fontSize: 25,
              fontWeight: FontWeight.bold
            ),
          ),
          Text(
            "Page2",
            style: TextStyle(
              color: AppColors.tertiaryColor,
              fontSize: 25,
              fontWeight: FontWeight.bold
            ),
          ),
          Text(
            "Page3",
            style: TextStyle(
              color: AppColors.tertiaryColor,
              fontSize: 25,
              fontWeight: FontWeight.bold
            ),
          ),
        ],
        color: AppColors.primaryColor,
        height: 60,
        circleWidth: 60,
        activeIndex: tabIndex,
        onTap: (index) {
          tabIndex = index;
          pageController.jumpToPage(tabIndex);
        },
        padding: const EdgeInsets.only(left: 16, right: 16, bottom: 20),
        cornerRadius: const BorderRadius.only(
          topLeft: Radius.circular(8),
          topRight: Radius.circular(8),
          bottomRight: Radius.circular(24),
          bottomLeft: Radius.circular(24),
        ),
        shadowColor: AppColors.tertiaryColor,
        elevation: 10,
      ),
      body: PageView(
        controller: pageController,
        onPageChanged: (v) {
          tabIndex = v;
        },
        children: [
          Container(width: double.infinity, height: double.infinity, color: AppColors.white),
          Container(width: double.infinity, height: double.infinity, color: AppColors.white),
          Container(width: double.infinity, height: double.infinity, color: AppColors.white),
        ],
      ),
    );
  }
}