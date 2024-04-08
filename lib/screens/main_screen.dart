import 'package:flutter/material.dart';

import '../tab_pages/home_tab.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> with SingleTickerProviderStateMixin {

  TabController? tabController;
  int selectedIndex=0;
  onItemClicked(int index) {
    setState(() {
      selectedIndex=index;
      tabController!.index = selectedIndex;
    });
  }


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    tabController = TabController(length: 4, vsync: this);
  }


  @override
  Widget build(BuildContext context) {

    bool darkTheme= MediaQuery.of(context).platformBrightness ==Brightness.dark;
    return Scaffold(


      body: TabBarView(
        physics: NeverScrollableScrollPhysics(),
        controller: tabController,
        children: [
           HomeTabPage(),
          // EarningsTabPage(),
          // RatingTabPage(),
          // ProfileTabPage(),

        ],
      ),

      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home),label: "Home"),
          BottomNavigationBarItem(icon: Icon(Icons.credit_card),label: "Earnings"),
          BottomNavigationBarItem(icon: Icon(Icons.star),label: "Rating"),
          BottomNavigationBarItem(icon: Icon(Icons.person),label: "Account"),
        ],
        unselectedItemColor: darkTheme ? Colors.black45 : Colors.white,
        selectedItemColor: darkTheme ? Colors.black :Colors.white,
        backgroundColor: darkTheme ? Colors.lightBlueAccent : Colors.lightBlue,
        type: BottomNavigationBarType.fixed,
        selectedLabelStyle: TextStyle(fontSize: 14),
        showUnselectedLabels: true,
        currentIndex: selectedIndex,
        onTap: onItemClicked,
      ),
    );
  }
}
