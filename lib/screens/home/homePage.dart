import 'package:flutter/material.dart';
import 'package:placement/resources/strings.dart';
import 'package:placement/screens/home/applyPage.dart';
import 'package:placement/screens/home/candidatePage.dart';
import 'package:placement/screens/home/resultPage.dart';

class HomePage extends StatefulWidget {
  HomePage({Key key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with SingleTickerProviderStateMixin {

  TabController _tabController;
  
  final List<Tab> _bottomTab = <Tab>[
      Tab(
        icon: Icon(Icons.check_circle),
        text: 'Apply',
      ),
      Tab(
        icon: Icon(Icons.insert_drive_file),
        text: 'Results',
      ),
      Tab(
        icon: Icon(Icons.perm_contact_calendar),
        text: 'Calendar',
      ),
      Tab(
        icon: Icon(Icons.person),
        text: 'Profile',
      )
  ];

  @override
  void initState() {
    super.initState();
    _tabController = TabController(
      vsync: this,
      length: 4
    );
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return _homePageStack(context);
  }

  Widget _homePageStack(BuildContext contaxt) {
    return Stack(
      children: <Widget>[
        _homePageScaffold(context),
        SafeArea(
          child: Align(
            alignment: Alignment.topRight,
            child: Container(
              child: GestureDetector(
                onTap: () {
                  print("tapped!!");
                },
                child: Padding(
                  padding: EdgeInsets.fromLTRB(0.0, 10.0, 10, 0.0),
                  child: Material(
                    color: Colors.transparent,
                    child: IconButton(
                      icon: Icon(
                        Icons.notifications,
                        size: 30,
                        color: Colors.white,
                      ),
                      onPressed: () {
                        Navigator.of(context).pushNamed('/notifs');
                      },
                    )
                  )  
                ),
              )
            ),
          )
        )
      ],
    );
  }

  Widget _homePageScaffold(BuildContext context) {
    return Scaffold(
      body: TabBarView(
        controller: _tabController,
        children: _tabSelector(),
      ),
      bottomNavigationBar: 
      Container(
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.3),
              blurRadius: 10.0,
              spreadRadius: 2.0,
              offset: Offset(0,-5),
            ),
          ]
        ),
        child: TabBar(
          controller: _tabController,
          tabs: _bottomTab,
          indicatorPadding: EdgeInsets.all(5.0),
          indicatorColor: Colors.blueAccent,
          labelColor: Colors.blueAccent,
          unselectedLabelColor: Colors.grey,
        )
      )
    );
  }

  List<Widget> _tabSelector() {
    return <Widget>[
      Container(
        child: ApplyPage()
      ),
      Container(
        child: ResultPage()
      ),
      Container(
        child: Text("Under Construction")
      ),
      Container(
        child: CandidatePage()
      ),
    ];
  }
}