import 'package:coronavirus_dashboard/defaults.dart';
import 'package:coronavirus_dashboard/pages/GlobalView.dart';
import 'package:coronavirus_dashboard/pages/StateView.dart';
import 'package:coronavirus_dashboard/style.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class Dashboard extends StatefulWidget {
  @override
  _DashboardState createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  int _currentIndex = 0;

  launchURL(String url) async {
    if (await canLaunch(url)) {
      await launch(url, forceWebView: false);
    } else {
      throw 'Could not launch $url';
    }
  }

  @override
  Widget build(BuildContext context) {
    final _kPages = <Widget>[
      GlobalView(),
      StateView(),
    ];
    final _kBottomNavBarItems = <BottomNavigationBarItem>[
      BottomNavigationBarItem(icon: Icon(Icons.map, color: _currentIndex == 0 ? blueLight : grey,), title: Text('Global', style: TextStyle(color: _currentIndex == 0 ? blueLight : grey, fontWeight: FontWeight.w700),)),
      BottomNavigationBarItem(icon: Icon(Icons.dashboard, color: _currentIndex == 1 ? blueLight : grey,), title: Text('States', style: TextStyle(color: _currentIndex == 1 ? blueLight : grey, fontWeight: FontWeight.w700),)),
    ];
    assert(_kPages.length == _kBottomNavBarItems.length);
    final _bottomNavBar = BottomNavigationBar(
      backgroundColor: Colors.grey[850],
      items: _kBottomNavBarItems,
      currentIndex: _currentIndex,
      type: BottomNavigationBarType.fixed,
      onTap: (int index) {
        setState(() {
          _currentIndex = index;
        });
      },
    );

    return Scaffold(
      appBar: AppBar(
        title: SelectableText("COVID-19 Live Dashboard", style: Theme.of(context).textTheme.subhead,),
        backgroundColor: Theme.of(context).backgroundColor,
        elevation: 0.0,
        actions: <Widget>[
          FlatButton(
            child: Text("JHU Data", style: Theme.of(context).textTheme.body2,),
            onPressed: (){
              isWeb(context)
                  ? launchURL(JHU_WEB_URL)
                  : launchURL(JHU_MOBILE_URL);
            },
          ),
          FlatButton(
            child: Text("NJ Data", style: Theme.of(context).textTheme.body2,),
            onPressed: (){
              isWeb(context)
                ? launchURL(NJ_WEB_URL)
                : launchURL(NJ_MOBILE_URL);
            },
          ),
        ],
      ),
      body: _kPages[_currentIndex],
      bottomNavigationBar: _bottomNavBar,
    );
  }
}
