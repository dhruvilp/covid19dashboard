import 'package:coronavirus_dashboard/defaults.dart';
import 'package:coronavirus_dashboard/models/models.dart';
import 'package:coronavirus_dashboard/services.dart';
import 'package:flutter/material.dart';

class StateView extends StatefulWidget {
  @override
  _StateViewState createState() => _StateViewState();
}

class _StateViewState extends State<StateView> {
  List<StateData> stateData;

  @override
  void initState() {
    super.initState();
    _fetchStateData();
  }

  Future<void> _fetchStateData() async {
    try {
      stateData = await fetchStateData();
      setState(() {
        stateData = this.stateData;
      });
    } catch (e) {
      print("ERROR from fetchStateData: $e");
    }
  }

  @override
  Widget build(BuildContext context) {
    return stateData != null
        ? Padding(
            padding: const EdgeInsets.all(10.0),
            child: ListView.builder(
              shrinkWrap: true,
              scrollDirection: Axis.vertical,
              itemCount: stateData.isEmpty ? 1 : stateData.length,
              itemBuilder: (BuildContext context, int index) {
                return StateDataCard(
                  stateData: stateData[index],
                );
              },
            ),
          )
        : Center(child: CircularProgressIndicator());
  }
}

class StateDataCard extends StatelessWidget {
  final StateData stateData;
  const StateDataCard({Key key, this.stateData}) : super(key: key);
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
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10.0),
              child: SelectableText(
                stateData?.state,
                style: Theme.of(context).textTheme.headline5,
                maxLines: null,
              ),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                FiveColLayout(
                  item1Title: "Confirmed Cases",
                  item1value: stateData?.cases,
                  item1Color: Colors.red[800],
                  item2Title: "Confirmed Deaths",
                  item2value: stateData?.deaths,
                  item2Color: Theme.of(context).primaryColorDark,
                  item3Title: "Active Cases",
                  item3value: stateData?.active,
                  item3Color: Colors.deepOrange,
                  item4Title: "Today Cases",
                  item4value: stateData?.todayCases,
                  item4Color: Theme.of(context).primaryColor,
                  item5Title: "Today Deaths",
                  item5value: stateData?.todayDeaths,
                  item5Color: Colors.deepPurpleAccent,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class FiveColLayout extends StatelessWidget {
  final String item1Title;
  final String item2Title;
  final String item3Title;
  final String item4Title;
  final String item5Title;
  final double item1value;
  final double item2value;
  final double item3value;
  final double item4value;
  final double item5value;
  final Color item1Color;
  final Color item2Color;
  final Color item3Color;
  final Color item4Color;
  final Color item5Color;
  const FiveColLayout(
      {Key key,
      this.item1Title,
      this.item2Title,
      this.item3Title,
      this.item1value,
      this.item2value,
      this.item3value,
      this.item1Color,
      this.item2Color,
      this.item3Color,
      this.item4Title,
      this.item5Title,
      this.item4value,
      this.item5value,
      this.item4Color,
      this.item5Color})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return isWeb(context)
        ? Row(
            children: <Widget>[
              Expanded(
                flex: 1,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    SelectableText(
                      item1Title,
                      style: Theme.of(context).textTheme.subtitle1,
                    ),
                    SelectableText(
                      "$item1value",
                      style: TextStyle(
                        fontSize: 20.0,
                        color: item1Color,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                flex: 1,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    SelectableText(
                      item2Title,
                      style: Theme.of(context).textTheme.subtitle1,
                    ),
                    SelectableText(
                      "$item2value",
                      style: TextStyle(
                        fontSize: 20.0,
                        color: item2Color,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                flex: 1,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    SelectableText(
                      item3Title,
                      style: Theme.of(context).textTheme.subtitle1,
                    ),
                    SelectableText(
                      "$item3value",
                      style: TextStyle(
                        fontSize: 20.0,
                        color: item3Color,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                flex: 1,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    SelectableText(
                      item4Title,
                      style: Theme.of(context).textTheme.subtitle1,
                    ),
                    SelectableText(
                      "$item4value",
                      style: TextStyle(
                        fontSize: 20.0,
                        color: item4Color,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                flex: 1,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    SelectableText(
                      item5Title,
                      style: Theme.of(context).textTheme.subtitle1,
                    ),
                    SelectableText(
                      "$item5value",
                      style: TextStyle(
                        fontSize: 20.0,
                        color: item5Color,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          )
        : Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              ListTile(
                title: SelectableText(
                  item1Title,
                  style: Theme.of(context).textTheme.subtitle1,
                ),
                trailing: SelectableText(
                  "$item1value",
                  style: TextStyle(
                    fontSize: 20.0,
                    color: item1Color,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
              ListTile(
                title: SelectableText(
                  item2Title,
                  style: Theme.of(context).textTheme.subtitle1,
                ),
                trailing: SelectableText(
                  "$item2value",
                  style: TextStyle(
                    fontSize: 20.0,
                    color: item2Color,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
              ListTile(
                title: SelectableText(
                  item3Title,
                  style: Theme.of(context).textTheme.subtitle1,
                ),
                trailing: SelectableText(
                  "$item3value",
                  style: TextStyle(
                    fontSize: 20.0,
                    color: item3Color,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
              ListTile(
                title: SelectableText(
                  item4Title,
                  style: Theme.of(context).textTheme.subtitle1,
                ),
                trailing: SelectableText(
                  "$item4value",
                  style: TextStyle(
                    fontSize: 20.0,
                    color: item4Color,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
              ListTile(
                title: SelectableText(
                  item5Title,
                  style: Theme.of(context).textTheme.subtitle1,
                ),
                trailing: SelectableText(
                  "$item5value",
                  style: TextStyle(
                    fontSize: 20.0,
                    color: item5Color,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
            ],
          );
  }
}
