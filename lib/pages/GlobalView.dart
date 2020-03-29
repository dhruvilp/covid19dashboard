import 'package:coronavirus_dashboard/defaults.dart';
import 'package:coronavirus_dashboard/models/models.dart';
import 'package:coronavirus_dashboard/services.dart';
import 'package:flutter/material.dart';

class GlobalView extends StatefulWidget {
  @override
  _GlobalViewState createState() => _GlobalViewState();
}

class _GlobalViewState extends State<GlobalView> {
  GlobalData globalData;
  List<CountryData> countryData;

  @override
  void initState() {
    super.initState();
    _fetchGlobalData();
    _fetchCountryData();
  }

  Future<void> _fetchGlobalData() async {
    try {
      globalData = await fetchGlobalData();
      setState(() { globalData = this.globalData; });
    } catch (e) { print("ERROR from fetchGlobalData: $e"); }
  }

  Future<void> _fetchCountryData() async {
    try {
      countryData = await fetchCountryData();
      setState(() { countryData = this.countryData; });
    } catch (e) { print("ERROR from fetchCountryData: $e"); }
  }

  @override
  Widget build(BuildContext context) {
    return (globalData != null && countryData != null) ? isWeb(context)
        ? Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Flexible(
              flex: 2,
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    GlobalDataCard(
                      title: "Confirmed Cases",
                      data: "${globalData?.cases}",
                      textColor: Colors.red[900],
                    ),
                    GlobalDataCard(
                      title: "Confirmed Deaths",
                      data: "${globalData?.deaths}",
                      textColor: Theme.of(context).primaryColorDark,
                    ),
                    GlobalDataCard(
                      title: "Recovered Cases",
                      data: "${globalData?.recovered}",
                      textColor: Colors.green[500],
                    ),
                    GlobalDataCard(
                      title: "Active Cases",
                      data: "${globalData?.active}",
                      textColor: Colors.deepOrangeAccent,
                    ),
                  ],
                ),
              ),
            ),
            Flexible(
              flex: 4,
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: ListView.builder(
                  shrinkWrap: true,
                  scrollDirection: Axis.vertical,
                  itemCount: countryData.isEmpty ? 1 : countryData.length,
                  itemBuilder: (BuildContext context, int index) {
                    return CountryDataCard(countryData: countryData[index],);
                  },
                ),
              ),
            ),
          ],
        )
        : Padding(
          padding: const EdgeInsets.all(10.0),
          child: ListView(
            shrinkWrap: true,
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  GlobalDataCard(
                    title: "Confirmed Cases",
                    data: "${globalData?.cases}",
                    textColor: Colors.red[800],
                  ),
                  GlobalDataCard(
                    title: "Confirmed Deaths",
                    data: "${globalData?.deaths}",
                    textColor: Theme.of(context).primaryColorDark,
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  GlobalDataCard(
                    title: "Recovered Cases",
                    data: "${globalData?.recovered}",
                    textColor: Colors.green[500],
                  ),
                  GlobalDataCard(
                    title: "Active Cases",
                    data: "${globalData?.active}",
                    textColor: Colors.deepOrangeAccent,
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: ListView.builder(
                  shrinkWrap: true,
                  scrollDirection: Axis.vertical,
                  itemCount: countryData.isEmpty ? 1 : countryData.length,
                  itemBuilder: (BuildContext context, int index) {
                    return CountryDataCard(countryData: countryData[index],);
                  },
                ),
              ),
            ],
          ),
        ) : Center(child: CircularProgressIndicator());

  }
}

class GlobalDataCard extends StatelessWidget {
  final String title;
  final String data;
  final Color textColor;
  const GlobalDataCard({Key key, this.title, this.data, this.textColor}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10.0),
      child: Container(
        width: 200.0,
        child: Card(
          elevation: 0.5,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15.0),
          ),
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                SelectableText(
                  title,
                  style: Theme.of(context).textTheme.subhead,
                ),
                SelectableText(
                  data,
                  style: TextStyle(fontSize: 25.0, color: textColor, fontWeight: FontWeight.w700,),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class CountryDataCard extends StatelessWidget {
  final CountryData countryData;
  const CountryDataCard({Key key, this.countryData}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 0.0,
      color: Colors.blueGrey.shade50,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15.0),
      ),
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: isWeb(context)
          ? Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Expanded(
              flex: 1,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Container(
                    child: Image.network(countryData.countryInfo?.flag, height: 80.0,),
                  ),
                  SelectableText(
                    countryData?.country,
                    style: Theme.of(context).textTheme.subhead,
                  ),
                ],
              ),
            ),
            Expanded(
              flex: 5,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  SelectableText(
                    "Last Updated: ${DateTime.parse(DateTime.fromMicrosecondsSinceEpoch(countryData.updated * 1000).toLocal().toIso8601String())}",
                    style: Theme.of(context).textTheme.body1,
                  ),
                  ThreeColumnLayout(
                    item1Title: "Confirmed Cases",
                    item1value: countryData?.cases,
                    item2Title: "Today Cases",
                    item2value: countryData?.todayCases,
                    item3Title: "Critical Cases",
                    item3value: countryData?.critical,
                    mainItemColor: Colors.red[800],
                  ),
                  ThreeColumnLayout(
                    item1Title: "Confirmed Deaths",
                    item1value: countryData?.deaths,
                    item2Title: "Today Deaths",
                    item2value: countryData?.todayDeaths,
                    item3Title: "Cases/Million",
                    item3value: countryData?.casesPerOneMillion,
                    mainItemColor: Theme.of(context).primaryColorDark,
                  ),
                  ThreeColumnLayout(
                    item1Title: "Recovered Cases",
                    item1value: countryData?.recovered,
                    item2Title: "Active Cases",
                    item2value: countryData?.active,
                    item3Title: "Deaths/Million",
                    item3value: countryData?.deathsPerOneMillion,
                    mainItemColor: Colors.green,
                  ),
                ],
              ),
            ),
          ],
        ) : Column(
          children: <Widget>[
            ListTile(
              leading: CircleAvatar(
                backgroundColor: Colors.transparent,
                child: Image.network(countryData.countryInfo?.flag),
                maxRadius: 15.0,
              ),
              title: SelectableText(
                countryData?.country,
                style: Theme.of(context).textTheme.subhead,
              ),
              subtitle: SelectableText(
                "Last Updated: ${DateTime.parse(DateTime.fromMicrosecondsSinceEpoch(countryData.updated).toLocal().toIso8601String())}",
                style: Theme.of(context).textTheme.body1,
              ),
            ),
            ThreeColumnLayout(
              item1Title: "Confirmed Cases",
              item1value: countryData?.cases,
              item2Title: "Today Cases",
              item2value: countryData?.todayCases,
              item3Title: "Critical Cases",
              item3value: countryData?.critical,
              mainItemColor: Colors.red[800],
            ),
            ThreeColumnLayout(
              item1Title: "Confirmed Deaths",
              item1value: countryData?.deaths,
              item2Title: "Today Deaths",
              item2value: countryData?.todayDeaths,
              item3Title: "Cases/Million",
              item3value: countryData?.casesPerOneMillion,
              mainItemColor: Theme.of(context).primaryColorDark,
            ),
            ThreeColumnLayout(
              item1Title: "Recovered Cases",
              item1value: countryData?.recovered,
              item2Title: "Active Cases",
              item2value: countryData?.active,
              item3Title: "Deaths/Million",
              item3value: countryData?.deathsPerOneMillion,
              mainItemColor: Colors.green,
            ),
          ],
        ),
      ),
    );
  }
}

class ThreeColumnLayout extends StatelessWidget {
  final String item1Title;
  final String item2Title;
  final String item3Title;
  final double item1value;
  final double item2value;
  final double item3value;
  final Color mainItemColor;
  const ThreeColumnLayout({Key key, this.item1Title, this.item2Title, this.item3Title, this.item1value, this.item2value, this.item3value, this.mainItemColor}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return isWeb(context) ? Row(
      children: <Widget>[
        Expanded(
          flex: 2,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              SelectableText(
                item1Title,
                style: Theme.of(context).textTheme.subhead,
              ),
              SelectableText(
                "$item1value",
                style: TextStyle(fontSize: 20.0, color: mainItemColor, fontWeight: FontWeight.w700,),
              ),
            ],
          ),
        ),
        Expanded(
          flex: 2,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              SelectableText(
                item2Title,
                style: Theme.of(context).textTheme.subhead,
              ),
              SelectableText(
                "$item2value",
                style: Theme.of(context).textTheme.title,
              ),
            ],
          ),
        ),
        Expanded(
          flex: 2,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              SelectableText(
                item3Title,
                style: Theme.of(context).textTheme.subhead,
              ),
              SelectableText(
                "$item3value",
                style: Theme.of(context).textTheme.title,
              ),
            ],
          ),
        ),
      ],
    ) : Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        ListTile(
          title: SelectableText(
            item1Title,
            style: Theme.of(context).textTheme.subhead,
          ),
          trailing: SelectableText(
            "$item1value",
            style: Theme.of(context).textTheme.title,
          ),
        ),
        ListTile(
          title: SelectableText(
            item2Title,
            style: Theme.of(context).textTheme.subhead,
          ),
          trailing: SelectableText(
            "$item2value",
            style: Theme.of(context).textTheme.title,
          ),
        ),
        ListTile(
          title: SelectableText(
            item3Title,
            style: Theme.of(context).textTheme.subhead,
          ),
          trailing: SelectableText(
            "$item3value",
            style: Theme.of(context).textTheme.title,
          ),
        ),
      ],
    );
  }
}



