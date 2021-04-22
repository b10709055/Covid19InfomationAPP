import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'detail.dart';

class Covid19App extends StatefulWidget {
  @override
  _Covid19AppState createState() => _Covid19AppState();
}

class _Covid19AppState extends State<Covid19App> {
  final Dio dio = new Dio();
  Map allData = new Map();

  getData() async {
    try {
      Response res = await dio.get('https://corona.lmao.ninja/v3/covid-19/all');
      if (res.statusCode == 200 && res.data != null) {
        allData = res.data;
      }
    } on DioError catch (e) {
      print('dio error: $e');
    }
    if (mounted) setState(() {});
  }

  Future<Response> getCountryData() async {
    Response res;
    try {
      res = await dio.get(
          'https://corona.lmao.ninja/v3/covid-19/countries/taiwan,china,japan,s.%20korea,hong%20kong,Malaysia,usa');
      if (res.statusCode == 200 && res.data != null) {
        return res;
      }
    } on DioError catch (e) {
      print('dio error: $e');
    }
    return res;
  }

  @override
  void initState() {
    super.initState();
    getData();
  }

  @override
  void dispose() {
    allData = null;
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    getData();
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xff3f3f3f),
        elevation: 0,
        title: Text(
          'Covid19',
          style: TextStyle(
              fontWeight: FontWeight.w900,
              fontSize: 32.0,
              fontFamily: 'Open_Sans',
              color: Colors.white),
        ),
      ),
      body: Container(
        decoration: BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
              Color(0xff3f3f3f),
              Color(0xff9a9a9a),
              Color(0xff3f3f3f),
            ])),
        child: Column(
          children: <Widget>[
            Container(
                width: size.width / 2,
                child: GlobalInfo('All Cases', allData['cases'])),
            SizedBox(height: 5.0),
            Row(
              children: <Widget>[
                Container(
                    width: size.width / 2,
                    child: GlobalInfo('Deaths', allData['deaths'])),
                Container(
                    width: size.width / 2,
                    child: GlobalInfo('Recovered', allData['recovered'])),
              ],
            ),
            Divider(height: 10.0, color: Colors.white70),
            Text(
              'Countries Information',
              style: TextStyle(
                fontSize: 18.0,
                fontFamily: 'Open_Sans',
              ),
              textAlign: TextAlign.center,
            ),
            Expanded(
                child: FutureBuilder(
                    future: getCountryData(),
                    builder: (BuildContext context, AsyncSnapshot snap) {
                      if (snap.hasData) {
                        Response res = snap.data;
                        return ListView.builder(
                          itemCount: res.data.length,
                          itemBuilder: (BuildContext context, int index) {
                            Map<String, dynamic> data = res.data[index];
                            return InkWell(
                                onTap: () {
                                  return Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => Detail(),
                                          settings:
                                              RouteSettings(arguments: data)));
                                },
                                child: Padding(
                                  padding: EdgeInsets.all(10.0),
                                  child: Container(
                                    alignment: Alignment.centerLeft,
                                    decoration: BoxDecoration(
                                      color: Color(0xff9a9a9a),
                                      borderRadius: BorderRadius.circular(10.0),
                                      boxShadow: [
                                        BoxShadow(
                                          color: Colors.black12,
                                          blurRadius: 6.0,
                                          offset: Offset(0, 2),
                                        ),
                                      ],
                                    ),
                                    height: 80.0,
                                    child: ListTile(
                                      leading: ConstrainedBox(
                                          constraints: BoxConstraints(
                                            minWidth: 44,
                                            minHeight: 44,
                                            maxWidth: 64,
                                            maxHeight: 64,
                                          ),
                                          child: Image.network(
                                              '${data['countryInfo']['flag']}')),
                                      title: Row(
                                        children: <Widget>[
                                          Expanded(
                                              child: Text('${data['country']}',
                                                  style: TextStyle(
                                                      color: Colors.black87,
                                                      fontSize: 30.0,
                                                      fontFamily: 'Open_Sans',
                                                      fontWeight:
                                                          FontWeight.bold))),
                                          Text('${data['cases']}',
                                              style: TextStyle(
                                                color: Colors.white70,
                                                fontSize: 25.0,
                                                fontFamily: 'Open_Sans',
                                                fontWeight: FontWeight.w900,
                                              )),
                                        ],
                                      ),
                                    ),
                                  ),
                                ));
                          },
                        );
                      } else {
                        return Center(child: CircularProgressIndicator());
                      }
                    })),
          ],
        ),
      ),
    );
  }
}

class GlobalInfo extends StatelessWidget {
  final int textGray = 0xff9394A2;
  final int textWhite = 0xffffffff;
  final int textRed = 0xffFF3232;
  final String title;
  final int val;

  GlobalInfo(this.title, this.val);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(5.0),
      child: Container(
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
          ],
        ),
        child: Column(
          children: [
            Text('$title',
                style: TextStyle(
                    color: Colors.black87,
                    fontSize: 30.0,
                    fontFamily: 'Open_Sans',
                    fontWeight: FontWeight.bold)),
            Text('$val',
                style: TextStyle(
                  color: Colors.white70,
                  fontSize: 25.0,
                  fontWeight: FontWeight.w900,
                  fontFamily: 'Open_Sans',
                  // shadows: [
                  //   Shadow(color: Colors.black, offset: Offset(1.0, 1.0))
                  // ]
                )),
          ],
        ),
      ),
    );
  }
}
