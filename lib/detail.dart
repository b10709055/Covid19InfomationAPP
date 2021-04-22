import 'package:flutter/material.dart';

class Detail extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Map detail = ModalRoute.of(context).settings.arguments;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xff3f3f3f),
        elevation: 0,
        title: Text(
          '${detail['country']}',
          style: TextStyle(
              fontWeight: FontWeight.w900,
              fontSize: 32.0,
              fontFamily: 'Open_Sans',
              color: Colors.white),
        ),
      ),
      body: Stack(children: [
        Container(
            height: double.infinity,
            width: double.infinity,
            decoration: BoxDecoration(
                gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                  Color(0xff3f3f3f),
                  Color(0xff9a9a9a),
                  Color(0xff3f3f3f),
                ])),
            child: Column(children: [
              SizedBox(
                height: 10.0,
              ),
              Container(
                alignment: Alignment.center,
                decoration: BoxDecoration(
                    color: Color(0xff9a9a9a),
                    borderRadius: BorderRadius.circular(10.0),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black12,
                        blurRadius: 6.0,
                        offset: Offset(0, 2),
                      ),
                    ]),
                width: 300.0,
                height: 200.0,
                child: Image.network(
                  '${detail['countryInfo']['flag']}',
                ),
              ),
              SizedBox(
                height: 10.0,
              ),
              Column(
                children: [
                  //DetailInfo('Cases', detail['cases']),
                  DetailInfo('TodayCases', detail['todayCases']),
                  DetailInfo('Deaths', detail['deaths']),
                  DetailInfo('TodayDeaths', detail['todayDeaths']),
                  DetailInfo('Recovered', detail['recovered']),
                  DetailInfo('TodayRecovered', detail['todayRecovered']),
                ],
              ),
            ])),
      ]),
    );
  }
}

class DetailInfo extends StatelessWidget {
  final String title;
  final int val;

  DetailInfo(this.title, this.val);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(8.0),
      child: Container(
          decoration: BoxDecoration(
              color: Color(0xff9a9a9a),
              borderRadius: BorderRadius.circular(10.0),
              boxShadow: [
                BoxShadow(
                  color: Colors.black12,
                  blurRadius: 6.0,
                  offset: Offset(0, 2),
                ),
              ]),
          height: 80.0,
          child: Padding(
            padding: EdgeInsets.all(10.0),
            child: Row(
              children: [
                Expanded(
                    child: Text('$title',
                        style: TextStyle(
                            color: Colors.black87,
                            fontSize: 30.0,
                            fontFamily: 'Open_Sans',
                            fontWeight: FontWeight.bold))),
                Text('$val',
                    style: TextStyle(
                        color: Colors.white70,
                        fontSize: 30.0,
                        fontFamily: 'Open_Sans',
                        fontWeight: FontWeight.bold))
              ],
            ),
          )),
    );
  }
}
