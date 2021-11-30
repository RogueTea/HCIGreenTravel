import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_application/chart_container.dart';
import 'chart/weekly_bar_chart.dart';
import 'chart/learn_page_bar_chart.dart';
import 'chart/home_page_line_chart.dart';
import 'chart/weekly_transport_pie_chart.dart';
import 'chart/weekly_co2_pie_chart.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    initialRoute: '/login',
    routes: {
      '/login': (context) => LoginPage(),
      '/register': (context) => RegisterPage(),
      '/edit-profile': (context) => EditProfilePage(),
      '/register-success': (context) => RegisterSuccessPage(),
      '/home': (context) => HomePage(token: '', email: '', password: ''),
      '/new-journey': (context) => NewJourneyPage(),
      '/new-journey/confirm': (context) => NewJourneyConfirmPage(),
      '/new-journey/save': (context) => NewJourneySavePage(),
      '/new-journey/score': (context) => NewJourneyScoredPage(),
      '/edit-journey': (context) => EditJourneyPage(),
      '/scoreboard': (context) => ScoreboardPage(),
      '/weekly-report': (context) => WeeklyReportPage(),
      '/learn': (context) => LearnPage()
    },
  ));
}

class TextBoxInput extends StatelessWidget {
  final String _title;
  final TextEditingController _controller;
  TextBoxInput(this._title, this._controller);

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.fromLTRB(15.0, 0.0, 10.0, 0.0),
        margin: EdgeInsets.fromLTRB(10, 10, 10, 10),
        decoration: BoxDecoration(
          color: Color(0xffE3E3E3),
          borderRadius: BorderRadius.circular(30),
        ),
        child: TextField(
            controller: _controller,
            autofocus: true,
            obscureText: false,
            style: TextStyle(
              color: Color(0xff424242),
              fontWeight: FontWeight.bold,
              fontSize: 14,
              letterSpacing: 1.2,
            ),
            decoration: InputDecoration(
              border: InputBorder.none,
              hintText: _title,
              hintStyle: TextStyle(
                  color: Color(0xff424242),
                  fontWeight: FontWeight.bold,
                  fontSize: 14,
                  letterSpacing: 1.2),
            )));
  }
}

class LoginPage extends StatefulWidget {
  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  String token = "";
  String email = "";
  String password = "";

  Future<http.Response> login(email, password) async {
    var url = Uri.parse('http://127.0.0.1:8000/login');
    var tes = jsonEncode({
      "email": email,
      "password": password,
    });
    final http.Response response = await http.post(url,
        headers: <String, String>{
          'Content-Type': 'application/json',
          'Charset': 'utf-8'
        },
        body: tes);
    print(tes);

    if (response.statusCode != null) {
      token = jsonDecode(response.body)["token"];
      email = jsonDecode(response.body)["email"];
      password = jsonDecode(response.body)["password"];
      if (token != null) {
        print(token);
        Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) =>
                  HomePage(token: token, email: email, password: password)),
        );
      } else
        print(jsonDecode(response.body));
      return response;
    }
    return response;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color(0xffDDDFDE),
        body: SingleChildScrollView(
            child: Stack(
          children: [
            Positioned(
                top: 150,
                left: 80,
                height: 60,
                width: 120,
                child: Container(
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      color: Color(0xff7DA4A8),
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: TextButton(
                      child: Text("Login",
                          style: TextStyle(
                            color: Color(0xff232122),
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          )),
                      onPressed: () {},
                    ))),
            Positioned(
                top: 150,
                right: 80,
                height: 60,
                width: 120,
                child: Container(
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      color: Color(0xffDDDFDE),
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: TextButton(
                      child: Text("Register",
                          style: TextStyle(
                            color: Color(0xff232122),
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          )),
                      onPressed: () {
                        Navigator.pushNamed(context, '/register');
                      },
                    ))),
            Container(
                margin: EdgeInsets.fromLTRB(50, 200, 50, 200),
                padding: EdgeInsets.fromLTRB(10.0, 30, 10, 30),
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: Color(0xffCBCBCB),
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Column(
                  children: <Widget>[
                    TextBoxInput("email", emailController),
                    TextBoxInput("password", passwordController),
                    Container(
                      padding: EdgeInsets.fromLTRB(0, 10, 0, 0),
                      child: ElevatedButton(
                        child: Text("Login",
                            style: TextStyle(
                                fontSize: 16,
                                color: Color(0xff232122),
                                fontWeight: FontWeight.bold)),
                        style: ElevatedButton.styleFrom(
                            padding: EdgeInsets.fromLTRB(30, 10, 30, 10),
                            primary: Color(0xff7DA4A8),
                            shadowColor: Colors.black,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20),
                            )),
                        onPressed: () {
                          login(emailController.text, passwordController.text);
                          Navigator.pushNamed(context, '/home');
                        },
                      ),
                    )
                  ],
                ))
          ],
        )));
  }
}

class RegisterPage extends StatefulWidget {
  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final usernameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  Future<http.Response> register(username, password, email) async {
    var url = Uri.parse('http://127.0.0.1:8000/addUser/');
    var tes = jsonEncode({
      "username": username,
      "email": email,
      "password": password,
    });
    final http.Response response = await http.post(url,
        headers: <String, String>{
          'Content-Type': 'application/json',
          'Charset': 'utf-8'
        },
        body: tes);
    print(tes);

    if (response.statusCode != null) {
      //print(jsonDecode(response.body));
      print(response.body);
      return response;
    }
    return response;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color(0xffDDDFDE),
        body: SingleChildScrollView(
            child: Stack(
          children: [
            Positioned(
                top: 150,
                left: 80,
                height: 60,
                width: 120,
                child: Container(
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      color: Color(0xffDDDFDE),
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: TextButton(
                      child: Text("Login",
                          style: TextStyle(
                            color: Color(0xff232122),
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          )),
                      onPressed: () {
                        Navigator.pushNamed(context, '/login');
                      },
                    ))),
            Positioned(
                top: 150,
                right: 80,
                height: 60,
                width: 120,
                child: Container(
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      color: Color(0xff7DA4A8),
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: TextButton(
                      child: Text("Register",
                          style: TextStyle(
                            color: Color(0xff232122),
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          )),
                      onPressed: () {},
                    ))),
            Container(
                margin: EdgeInsets.fromLTRB(50, 200, 50, 200),
                padding: EdgeInsets.fromLTRB(10.0, 30, 10, 30),
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: Color(0xffCBCBCB),
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Column(
                  children: <Widget>[
                    TextBoxInput("username", usernameController),
                    TextBoxInput("password", passwordController),
                    TextBoxInput("email", emailController),
                    Container(
                      padding: EdgeInsets.fromLTRB(0, 10, 0, 0),
                      child: ElevatedButton(
                        child: Text("Register",
                            style: TextStyle(
                                fontSize: 16,
                                color: Color(0xff232122),
                                fontWeight: FontWeight.bold)),
                        style: ElevatedButton.styleFrom(
                            padding: EdgeInsets.fromLTRB(30, 10, 30, 10),
                            primary: Color(0xff7DA4A8),
                            shadowColor: Colors.black,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20),
                            )),
                        onPressed: () {
                          register(usernameController.text,
                              passwordController.text, emailController.text);
                          Navigator.pushNamed(context, '/register-success');
                        },
                      ),
                    )
                  ],
                ))
          ],
        )));
  }
}

class RegisterSuccessPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color(0xffDDDFDE),
        body: Container(
            margin: EdgeInsets.fromLTRB(50, 200, 50, 300),
            padding: EdgeInsets.fromLTRB(10.0, 30, 10, 30),
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color: Color(0xffCBCBCB),
              borderRadius: BorderRadius.circular(15),
            ),
            child: Column(
              children: [
                Text("You're now registered!",
                    style: TextStyle(
                      color: Color(0xff232122),
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    )),
                SizedBox(height: 40),
                ElevatedButton(
                  child: Text("Login",
                      style: TextStyle(
                          fontSize: 16,
                          color: Color(0xff232122),
                          fontWeight: FontWeight.bold)),
                  style: ElevatedButton.styleFrom(
                      padding: EdgeInsets.fromLTRB(30, 10, 30, 10),
                      primary: Color(0xff7DA4A8),
                      shadowColor: Colors.black,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      )),
                  onPressed: () {
                    Navigator.pushNamed(context, '/login');
                  },
                )
              ],
            )));
  }
}

// Class for top oval shape
class CurvePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    var paint = Paint();
    paint.color = Color(0XFFA4BF5E);
    paint.style = PaintingStyle.fill;
    var path = Path();
    path.moveTo(0, size.height * 0.7);
    path.quadraticBezierTo(
        size.width / 2, size.height, size.width, size.height * 0.7);
    path.lineTo(size.width, 0);
    path.lineTo(0, 0);
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}

class JourneyDisplay extends StatelessWidget {
  final String _date;
  final String _time;
  final String _distance;
  final String _transport;
  JourneyDisplay(this._date, this._time, this._distance, this._transport);

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.fromLTRB(0, 5, 0, 2),
        padding: EdgeInsets.symmetric(horizontal: 15, vertical: 5),
        decoration: BoxDecoration(
          color: Color(0xffD5D6D6),
          borderRadius: BorderRadius.circular(10),
        ),
        child:
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
          Column(
            children: [
              Text(_date,
                  style: new TextStyle(
                    fontSize: 14,
                    color: Color(0xff232122),
                    //fontWeight: FontWeight.bold,
                  )),
              Text(_time,
                  style: new TextStyle(
                    fontSize: 14,
                    color: Color(0xff232122),
                    //fontWeight: FontWeight.bold,
                  )),
            ],
          ),
          Column(
            children: [
              Text(_distance,
                  style: new TextStyle(
                    fontSize: 14,
                    color: Color(0xff232122),
                    fontWeight: FontWeight.bold,
                  )),
              Text(_transport,
                  style: new TextStyle(
                    fontSize: 14,
                    color: Color(0xff232122),
                    fontWeight: FontWeight.bold,
                  )),
            ],
          ),
          ElevatedButton(
            child: Text("Edit",
                style: TextStyle(
                    fontSize: 16,
                    color: Color(0xff232122),
                    fontWeight: FontWeight.bold)),
            style: ElevatedButton.styleFrom(
                padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
                primary: Color(0xff7DA4A8),
                shadowColor: Colors.black,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                )),
            onPressed: () {
              Navigator.pushNamed(context, '/edit-journey');
            },
          )
        ]));
  }
}

// ignore: must_be_immutable
class HomePage extends StatefulWidget {
  String email, password, token;
  HomePage({required this.email, required this.password, required this.token});
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double tab_width = width / 3;
    String email = widget.email;
    String token = widget.token;
    String password = widget.password;
    print(token);
    //print(token);
    return Scaffold(
      backgroundColor: Color(0xffDDDFDE),
      bottomNavigationBar: BottomAppBar(
        color: Color(0xffCBCBCB),
        child: Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            Container(
              width: tab_width,
              color: Color(0xffDDDFDE),
              child: IconButton(
                icon: Icon(Icons.account_circle),
                onPressed: () {},
              ),
            ),
            Container(
              width: tab_width,
              color: Color(0xffCBCBCB),
              child: IconButton(
                icon: Icon(Icons.emoji_events),
                onPressed: () {
                  Navigator.pushNamed(context, '/scoreboard');
                },
              ),
            ),
            Container(
              width: tab_width,
              color: Color(0xffCBCBCB),
              child: IconButton(
                icon: Icon(Icons.school),
                onPressed: () {
                  Navigator.pushNamed(context, '/learn');
                },
              ),
            ),
          ],
        ),
      ),
      body: Stack(
        children: [
          Container(
            color: Colors.transparent,
            height: 355,
            width: width,
            child: CustomPaint(
              painter: CurvePainter(),
            ),
          ),
          SingleChildScrollView(
              child: Column(
            children: <Widget>[
              Container(
                  margin: EdgeInsets.fromLTRB(20, 10, 20, 0),
                  alignment: Alignment.topRight,
                  child: TextButton(
                    child: Text("Logout",
                        style: TextStyle(
                          color: Color(0xff232122),
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                        )),
                    onPressed: () {
                      Navigator.pushNamed(context, '/login');
                    },
                  )),
              Container(
                  margin: EdgeInsets.fromLTRB(50, 25, 50, 0),
                  alignment: Alignment.center,
                  child: Text("Hello, username",
                      style: TextStyle(
                          fontSize: 36,
                          color: Color(0xff232122),
                          fontWeight: FontWeight.bold))),
              Container(
                  margin: EdgeInsets.fromLTRB(50, 5, 50, 0),
                  alignment: Alignment.bottomRight,
                  child: TextButton(
                    child: Text("Edit Profile ->",
                        style: TextStyle(
                          color: Color(0xff232122),
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                        )),
                    onPressed: () {
                      Navigator.pushNamed(context, '/edit-profile');
                    },
                  )),
              Container(
                margin: EdgeInsets.fromLTRB(30, 5, 30, 20),
                padding: EdgeInsets.fromLTRB(15, 20, 15, 10),
                height: 230,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: Color(0xffEDEDED),
                  borderRadius: BorderRadius.circular(15),
                ),
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      Container(
                          padding: EdgeInsets.fromLTRB(0, 5, 0, 15),
                          alignment: Alignment.topLeft,
                          child: Text(
                            "    Journeys",
                            style: TextStyle(
                              color: Color(0xff232122),
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                            textAlign: TextAlign.left,
                          )),
                      JourneyDisplay("test", "test", "test", "test"),
                      JourneyDisplay("test", "test", "test", "test"),
                      JourneyDisplay("test", "test", "test", "test"),
                      JourneyDisplay("test", "test", "test", "test"),
                    ],
                  ),
                ),
              ),
              Container(
                  margin: EdgeInsets.fromLTRB(30, 0, 30, 0),
                  padding: EdgeInsets.fromLTRB(10.0, 0, 10, 0),
                  height: 60,
                  alignment: Alignment.centerRight,
                  decoration: BoxDecoration(
                    color: Color(0xffEDEDED),
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: TextButton(
                    child: Text("Your Weekly Report ->  ",
                        style: TextStyle(
                          color: Color(0xff232122),
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        )),
                    onPressed: () {
                      Navigator.pushNamed(context, '/weekly-report');
                    },
                  )),
              Row(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Container(
                      margin: EdgeInsets.fromLTRB(550, 20, 10, 0),
                      padding: EdgeInsets.fromLTRB(10.0, 10, 10, 10),
                      height: 110,
                      decoration: BoxDecoration(
                        color: Color(0xffEDEDED),
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: Column(
                        children: [
                          Text("Total CO2 Emission",
                              style: TextStyle(
                                color: Color(0xff232122),
                                fontSize: 14,
                                fontWeight: FontWeight.bold,
                              )),
                          Container(
                              padding: EdgeInsets.fromLTRB(0, 20, 0, 0),
                              child: Text("2800g",
                                  style: TextStyle(
                                    color: Color(0xff232122),
                                    fontSize: 36,
                                    fontWeight: FontWeight.bold,
                                  ))),
                        ],
                      )),
                  Container(
                      margin: EdgeInsets.fromLTRB(10, 20, 30, 0),
                      padding: EdgeInsets.fromLTRB(20, 10, 20, 10),
                      height: 300,
                      decoration: BoxDecoration(
                        color: Color(0xffEDEDED),
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: Row(children: [
                        RotatedBox(
                            quarterTurns: 3,
                            child: new Text("CO2 emission (g)",
                                style: TextStyle(
                                    fontSize: 16,
                                    color: Color(0xff232122),
                                    fontWeight: FontWeight.bold))),
                        ChartContainer(
                            title: 'CO2 saved each week',
                            color: Color(0xffE5E5E5),
                            chart: homePageLineChartContent(),
                            size: 0.3)
                      ]))
                ],
              )
            ],
          ))
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushNamed(context, '/new-journey');
        },
        child: const Icon(Icons.add, color: Color(0xff232122), size: 36),
        backgroundColor: Color(0xffEDEDED),
      ),
    );
  }
}

class NewJourneyPage extends StatefulWidget {
  const NewJourneyPage({Key? key}) : super(key: key);

  @override
  State<NewJourneyPage> createState() => _NewJourneyPageState();
}

class _NewJourneyPageState extends State<NewJourneyPage> {
  String savedJourney = '';
  String transport = 'Walk';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: Icon(
              Icons.arrow_back,
              color: Color(0xff232122),
              size: 40,
            ),
            onPressed: () => Navigator.pop(context, false),
          ),
          backgroundColor: Color(0xffDDDFDE),
          elevation: 0.0,
        ),
        backgroundColor: Color(0xffDDDFDE),
        body: SingleChildScrollView(
            child: Container(
                margin: EdgeInsets.fromLTRB(30, 0, 30, 20),
                padding: EdgeInsets.fromLTRB(30, 20, 30, 40),
                //height: 500,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: Color(0xffCBCBCB),
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Container(
                        margin: EdgeInsets.fromLTRB(0, 20, 0, 30),
                        child: const Text("Add New Journey",
                            style: TextStyle(
                              color: Color(0xff232122),
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                            ))),
                    Text("Please enter distance travelled (Km）",
                        style:
                            TextStyle(color: Color(0xff232122), fontSize: 16)),
                    Container(
                        margin: EdgeInsets.symmetric(vertical: 10),
                        padding: EdgeInsets.symmetric(horizontal: 20),
                        decoration: BoxDecoration(
                          color: Color(0xffE5E5E5),
                          borderRadius: BorderRadius.circular(15),
                        ),
                        child: TextField(
                            decoration:
                                InputDecoration(border: InputBorder.none))),
                    Container(
                        //margin: EdgeInsets.all(10),
                        width: 40.0,
                        height: 40.0,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          color: Color(0xffC4C4C4),
                          shape: BoxShape.circle,
                        ),
                        child: Text('or',
                            style: TextStyle(
                                color: Color(0xff232122), fontSize: 16))),
                    Text("Choose a previously saved journey",
                        style:
                            TextStyle(color: Color(0xff232122), fontSize: 16)),
                    Container(
                      margin: EdgeInsets.symmetric(vertical: 10),
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        color: Color(0xffE5E5E5),
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: DropdownButton<String>(
                        value: savedJourney,
                        underline: Container(),
                        icon: const Icon(Icons.arrow_downward),
                        iconSize: 24,
                        //elevation: 16,
                        style: const TextStyle(color: Color(0xff232122)),
                        onChanged: (String? newValue) {
                          setState(() {
                            savedJourney = newValue!;
                          });
                        },
                        items: <String>[
                          '',
                          'work',
                          'home',
                        ].map<DropdownMenuItem<String>>((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(value),
                          );
                        }).toList(),
                      ),
                    ),
                    SizedBox(
                      height: 50,
                    ),
                    Text("Please select transport",
                        style:
                            TextStyle(color: Color(0xff232122), fontSize: 16)),
                    Container(
                      margin: EdgeInsets.symmetric(vertical: 10),
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        color: Color(0xffE5E5E5),
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: DropdownButton<String>(
                        value: transport,
                        icon: const Icon(Icons.arrow_downward),
                        iconSize: 24,
                        underline: Container(),
                        style: const TextStyle(color: Color(0xff232122)),
                        onChanged: (String? newValue) {
                          setState(() {
                            transport = newValue!;
                          });
                        },
                        items: <String>[
                          'Walk',
                          'Train',
                          'Car (electric)',
                          'Bus',
                          'Car (petrol)',
                          'Car (diesel)'
                        ].map<DropdownMenuItem<String>>((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(value),
                          );
                        }).toList(),
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Container(
                        margin: EdgeInsets.symmetric(horizontal: 70),
                        child: ElevatedButton(
                          child: Text("Save Journey",
                              style: TextStyle(
                                  fontSize: 16,
                                  color: Color(0xff232122),
                                  fontWeight: FontWeight.bold)),
                          style: ElevatedButton.styleFrom(
                              padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
                              primary: Color(0xff7DA4A8),
                              shadowColor: Colors.black,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20),
                              )),
                          onPressed: () {
                            Navigator.pushNamed(
                                context, '/new-journey/confirm');
                          },
                        ))
                  ],
                ))));
  }
}

class NewJourneyConfirmPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: Icon(
              Icons.arrow_back,
              color: Color(0xff232122),
              size: 40,
            ),
            onPressed: () => Navigator.pop(context, false),
          ),
          backgroundColor: Color(0xffDDDFDE),
          elevation: 0.0,
        ),
        backgroundColor: Color(0xffDDDFDE),
        body: Center(
            child: Container(
                margin: EdgeInsets.fromLTRB(50, 100, 50, 300),
                padding: EdgeInsets.fromLTRB(10.0, 30, 10, 30),
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: Color(0xffCBCBCB),
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Text("Save this journey?",
                        style: TextStyle(
                          color: Color(0xff232122),
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                        )),
                    SizedBox(height: 40),
                    Container(
                        margin: EdgeInsets.symmetric(horizontal: 20),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            ElevatedButton(
                              child: Text("Yes",
                                  style: TextStyle(
                                      fontSize: 16,
                                      color: Color(0xff232122),
                                      fontWeight: FontWeight.bold)),
                              style: ElevatedButton.styleFrom(
                                  padding: EdgeInsets.fromLTRB(30, 10, 30, 10),
                                  primary: Color(0xff7DA4A8),
                                  shadowColor: Colors.black,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(20),
                                  )),
                              onPressed: () {
                                Navigator.pushNamed(
                                    context, '/new-journey/save');
                              },
                            ),
                            ElevatedButton(
                              child: Text("No",
                                  style: TextStyle(
                                      fontSize: 16,
                                      color: Color(0xff232122),
                                      fontWeight: FontWeight.bold)),
                              style: ElevatedButton.styleFrom(
                                  padding: EdgeInsets.fromLTRB(30, 10, 30, 10),
                                  primary: Color(0xff7DA4A8),
                                  shadowColor: Colors.black,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(20),
                                  )),
                              onPressed: () {
                                Navigator.pushNamed(
                                    context, '/new-journey/score');
                              },
                            )
                          ],
                        ))
                  ],
                ))));
  }
}

class NewJourneySavePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: Icon(
              Icons.arrow_back,
              color: Color(0xff232122),
              size: 40,
            ),
            onPressed: () => Navigator.pop(context, false),
          ),
          backgroundColor: Color(0xffDDDFDE),
          elevation: 0.0,
        ),
        backgroundColor: Color(0xffDDDFDE),
        body: SingleChildScrollView(
            child: Container(
                margin: EdgeInsets.fromLTRB(50, 100, 50, 300),
                padding: EdgeInsets.fromLTRB(30, 30, 30, 30),
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: Color(0xffCBCBCB),
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Text("Save as",
                          style: TextStyle(
                            color: Color(0xff232122),
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                          )),
                      Container(
                          margin: EdgeInsets.symmetric(vertical: 10),
                          padding: EdgeInsets.symmetric(horizontal: 20),
                          decoration: BoxDecoration(
                            color: Color(0xffE5E5E5),
                            borderRadius: BorderRadius.circular(15),
                          ),
                          child: TextField(
                              decoration:
                                  InputDecoration(border: InputBorder.none))),
                      SizedBox(height: 40),
                      ElevatedButton(
                        child: Text("Confirm",
                            style: TextStyle(
                                fontSize: 16,
                                color: Color(0xff232122),
                                fontWeight: FontWeight.bold)),
                        style: ElevatedButton.styleFrom(
                            padding: EdgeInsets.fromLTRB(30, 10, 30, 10),
                            primary: Color(0xff7DA4A8),
                            shadowColor: Colors.black,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20),
                            )),
                        onPressed: () {
                          Navigator.pushNamed(context, '/new-journey/score');
                        },
                      ),
                    ]))));
  }
}

class NewJourneyScoredPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color(0xffDDDFDE),
        body: Center(
            child: Container(
                margin: EdgeInsets.fromLTRB(50, 100, 50, 180),
                padding: EdgeInsets.fromLTRB(10.0, 30, 10, 30),
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: Color(0xffA4BF5E),
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Column(
                  //mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    SizedBox(height: 20),
                    Container(
                      child: Image.asset('assets/earth1.png'),
                      height: 150,
                    ),
                    SizedBox(height: 20),
                    Text("You've scored",
                        style: TextStyle(
                          color: Color(0xff232122),
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        )),
                    Text("14 points!",
                        style: TextStyle(
                          color: Color(0xff232122),
                          fontSize: 34,
                          fontWeight: FontWeight.bold,
                        )),
                    SizedBox(height: 40),
                    Container(
                      margin: EdgeInsets.symmetric(horizontal: 20),
                      child: ElevatedButton(
                        child: Text("Confirm",
                            style: TextStyle(
                                fontSize: 16,
                                color: Color(0xff232122),
                                fontWeight: FontWeight.bold)),
                        style: ElevatedButton.styleFrom(
                            padding: EdgeInsets.fromLTRB(30, 10, 30, 10),
                            primary: Color(0xffB4D069),
                            shadowColor: Colors.black,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20),
                            )),
                        onPressed: () {
                          Navigator.pushNamed(context, '/home');
                        },
                      ),
                    )
                  ],
                ))));
  }
}

class EditJourneyPage extends StatefulWidget {
  const EditJourneyPage({Key? key}) : super(key: key);

  @override
  State<EditJourneyPage> createState() => _EditJourneyPageState();
}

class _EditJourneyPageState extends State<EditJourneyPage> {
  String transport = 'Walk';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: Icon(
              Icons.arrow_back,
              color: Color(0xff232122),
              size: 40,
            ),
            onPressed: () => Navigator.pop(context, false),
          ),
          backgroundColor: Color(0xffDDDFDE),
          elevation: 0.0,
        ),
        backgroundColor: Color(0xffDDDFDE),
        body: SingleChildScrollView(
            child: Container(
                margin: EdgeInsets.fromLTRB(50, 80, 50, 200),
                padding: EdgeInsets.fromLTRB(10.0, 30, 10, 30),
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: Color(0xffCBCBCB),
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Column(
                  children: <Widget>[
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Text("Edit Journey",
                            style: TextStyle(
                              color: Color(0xff232122),
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                            )),
                        ElevatedButton(
                          child: Text("Delete",
                              style: TextStyle(
                                  fontSize: 16,
                                  color: Color(0xff232122),
                                  fontWeight: FontWeight.bold)),
                          style: ElevatedButton.styleFrom(
                              padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
                              primary: Color(0xff7DA4A8),
                              shadowColor: Colors.black,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20),
                              )),
                          onPressed: () {
                            Navigator.pushNamed(context, '/home');
                          },
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Text("Distance travelled (Km）",
                        style:
                            TextStyle(color: Color(0xff232122), fontSize: 16)),
                    Container(
                        margin: EdgeInsets.symmetric(vertical: 10),
                        padding: EdgeInsets.symmetric(horizontal: 20),
                        decoration: BoxDecoration(
                          color: Color(0xffE5E5E5),
                          borderRadius: BorderRadius.circular(15),
                        ),
                        child: TextField(
                            decoration:
                                InputDecoration(border: InputBorder.none))),
                    SizedBox(
                      height: 20,
                    ),
                    Text("Transport",
                        style:
                            TextStyle(color: Color(0xff232122), fontSize: 16)),
                    Container(
                      margin: EdgeInsets.symmetric(vertical: 10),
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        color: Color(0xffE5E5E5),
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: DropdownButton<String>(
                        value: transport,
                        icon: const Icon(Icons.arrow_downward),
                        iconSize: 24,
                        underline: Container(),
                        style: const TextStyle(color: Color(0xff232122)),
                        onChanged: (String? newValue) {
                          setState(() {
                            transport = newValue!;
                          });
                        },
                        items: <String>[
                          'Walk',
                          'Train',
                          'Car (electric)',
                          'Bus',
                          'Car (petrol)',
                          'Car (diesel)'
                        ].map<DropdownMenuItem<String>>((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(value),
                          );
                        }).toList(),
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Container(
                      padding: EdgeInsets.fromLTRB(0, 10, 0, 0),
                      child: ElevatedButton(
                        child: Text("Update",
                            style: TextStyle(
                                fontSize: 16,
                                color: Color(0xff232122),
                                fontWeight: FontWeight.bold)),
                        style: ElevatedButton.styleFrom(
                            padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
                            primary: Color(0xff7DA4A8),
                            shadowColor: Colors.black,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20),
                            )),
                        onPressed: () {
                          Navigator.pushNamed(context, '/home');
                        },
                      ),
                    )
                  ],
                ))));
  }
}

class ScoreDisplay extends StatelessWidget {
  final int _rank;
  final String _username;
  final int _emission;
  final int _maxEmission;
  //final Object _controller;
  ScoreDisplay(this._rank, this._username, this._emission, this._maxEmission);
  @override
  Widget build(BuildContext context) {
    double height = 40;
    return Container(
        margin: EdgeInsets.symmetric(vertical: 3),
        width: MediaQuery.of(context).size.width * 0.75,
        child: Row(
          children: [
            Container(
                height: height,
                width: MediaQuery.of(context).size.width * 0.1,
                alignment: Alignment.center,
                //padding: EdgeInsets.symmetric(horizontal: 12),
                decoration: BoxDecoration(
                  color: Color(0xffDDDFDE),
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(10.0),
                    bottomLeft: Radius.circular(10.0),
                  ),
                ),
                child: Text(_rank.toString(),
                    style: TextStyle(
                      color: Color(0xff232122),
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                    ))),
            Container(
                height: height,
                width: MediaQuery.of(context).size.width * 0.65,
                decoration: BoxDecoration(
                  color: Color(0xffDDDFDE),
                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(10.0),
                    bottomRight: Radius.circular(10.0),
                  ),
                ),
                child: Stack(
                  children: [
                    Container(
                      height: height,
                      width: MediaQuery.of(context).size.width *
                          (_emission / _maxEmission * 0.6),
                      decoration: BoxDecoration(
                        color: Color(0xffB0B0B0),
                      ),
                    ),
                    Container(
                        padding: EdgeInsets.fromLTRB(0, 0, 20, 0),
                        alignment: Alignment.centerRight,
                        child: Text(_emission.toString() + "g",
                            style: TextStyle(
                              color: Color(0xff232122),
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                            ))),
                    Container(
                      padding: EdgeInsets.fromLTRB(20, 0, 0, 0),
                      alignment: Alignment.centerLeft,
                      child: Text(_username,
                          style: TextStyle(
                            color: Color(0xff232122),
                            fontSize: 14,
                          )),
                    ),
                  ],
                ))
          ],
        ));
  }
}

class UserScoreDisplay extends StatelessWidget {
  final int _rank;
  final String _username;
  final int _emission;
  final int _maxEmission;
  //final Object _controller;
  UserScoreDisplay(
      this._rank, this._username, this._emission, this._maxEmission);
  @override
  Widget build(BuildContext context) {
    double height = 40;
    return Container(
        width: MediaQuery.of(context).size.width * 0.75,
        child: Row(
          children: [
            Container(
                height: height,
                width: MediaQuery.of(context).size.width * 0.1,
                alignment: Alignment.center,
                //padding: EdgeInsets.symmetric(horizontal: 12),
                decoration: BoxDecoration(
                    color: Color(0xffDDDFDE),
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(10.0),
                      bottomLeft: Radius.circular(10.0),
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.5), //color of shadow
                        spreadRadius: 3, //spread radius
                        blurRadius: 7, // blur radius
                        offset: Offset(3, 2), // changes position of shadow
                      ),
                    ]),
                child: Text(_rank.toString(),
                    style: TextStyle(
                      color: Color(0xff232122),
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                    ))),
            Container(
                height: height,
                width: MediaQuery.of(context).size.width * 0.65,
                decoration: BoxDecoration(
                    color: Color(0xffDDDFDE),
                    borderRadius: BorderRadius.only(
                      topRight: Radius.circular(10.0),
                      bottomRight: Radius.circular(10.0),
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.5), //color of shadow
                        spreadRadius: 3, //spread radius
                        blurRadius: 7, // blur radius
                        offset: Offset(3, 2), // changes position of shadow
                        //first paramerter of offset is left-right
                        //second parameter is top to down
                      ),
                    ]),
                child: Stack(
                  children: [
                    Container(
                      height: height,
                      width: MediaQuery.of(context).size.width *
                          (_emission / _maxEmission * 0.6),
                      decoration: BoxDecoration(
                        color: Color(0xffB0B0B0),
                      ),
                    ),
                    Container(
                        padding: EdgeInsets.fromLTRB(0, 0, 20, 0),
                        alignment: Alignment.centerRight,
                        child: Text(_emission.toString() + "g",
                            style: TextStyle(
                              color: Color(0xff232122),
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                            ))),
                    Container(
                      padding: EdgeInsets.fromLTRB(20, 0, 0, 0),
                      alignment: Alignment.centerLeft,
                      child: Text(_username,
                          style: TextStyle(
                            color: Color(0xff232122),
                            fontSize: 14,
                          )),
                    ),
                  ],
                ))
          ],
        ));
  }
}

class ScoreboardPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double tab_width = MediaQuery.of(context).size.width / 3;
    return Scaffold(
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.pushNamed(context, '/new-journey');
          },
          child: const Icon(Icons.add, color: Color(0xff232122), size: 36),
          backgroundColor: Color(0xffEDEDED),
        ),
        backgroundColor: Color(0xffDDDFDE),
        bottomNavigationBar: BottomAppBar(
          child: Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              Container(
                width: tab_width,
                color: Color(0xffCBCBCB),
                child: IconButton(
                  icon: Icon(Icons.account_circle),
                  onPressed: () {
                    Navigator.pushNamed(context, '/home');
                  },
                ),
              ),
              Container(
                width: tab_width,
                color: Color(0xffCDDDFDE),
                child: IconButton(
                  icon: Icon(Icons.emoji_events),
                  onPressed: () {},
                ),
              ),
              Container(
                width: tab_width,
                color: Color(0xffCBCBCB),
                child: IconButton(
                  icon: Icon(Icons.school),
                  onPressed: () {
                    Navigator.pushNamed(context, '/learn');
                  },
                ),
              ),
            ],
          ),
          color: Color(0xffCBCBCB),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
                margin: EdgeInsets.fromLTRB(20, 10, 20, 0),
                alignment: Alignment.topRight,
                child: TextButton(
                  child: Text("Logout",
                      style: TextStyle(
                        color: Color(0xff232122),
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                      )),
                  onPressed: () {
                    Navigator.pushNamed(context, '/login');
                  },
                )),
            Container(
              padding: EdgeInsets.fromLTRB(50, 25, 30, 10),
              alignment: Alignment.centerLeft,
              child: Text("Scoreboard",
                  style: TextStyle(
                      fontSize: 36,
                      color: Color(0xff232122),
                      fontWeight: FontWeight.bold)),
            ),
            SizedBox(height: 10),
            Container(
              alignment: Alignment.centerRight,
              width: MediaQuery.of(context).size.width * 0.8,
              margin: EdgeInsets.fromLTRB(10, 0, 10, 0),
              padding: EdgeInsets.fromLTRB(30, 20, 30, 20),
              decoration: BoxDecoration(
                color: Color(0xffA4BF5E),
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(20.0),
                  topLeft: Radius.circular(20.0),
                ),
              ),
              child: Text("2/11 ~9/11",
                  style: TextStyle(
                      fontSize: 14,
                      color: Color(0xff232122),
                      fontWeight: FontWeight.bold)),
            ),
            Container(
                alignment: Alignment.center,
                width: MediaQuery.of(context).size.width * 0.8,
                margin: EdgeInsets.fromLTRB(10, 0, 10, 0),
                padding: EdgeInsets.fromLTRB(0, 10, 0, 10),
                decoration: BoxDecoration(
                  color: Color(0xffEDEDED),
                ),
                child: Column(
                  children: [
                    UserScoreDisplay(32, "user1", 2020, 3000),
                    Container(
                        alignment: Alignment.centerRight,
                        child: TextButton(
                          child: Text("jump to your rank ->     ",
                              style: TextStyle(
                                color: Color(0xff232122),
                                fontSize: 14,
                                fontWeight: FontWeight.bold,
                              )),
                          onPressed: () {},
                        ))
                  ],
                )),
            Container(
              alignment: Alignment.center,
              width: MediaQuery.of(context).size.width * 0.8,
              height: MediaQuery.of(context).size.height * 0.4,
              margin: EdgeInsets.fromLTRB(30, 0, 30, 0),
              //padding: EdgeInsets.fromLTRB(30, 20, 30, 20),
              decoration: BoxDecoration(
                color: Color(0xffEDEDED),
                borderRadius: BorderRadius.only(
                  bottomRight: Radius.circular(20.0),
                  bottomLeft: Radius.circular(20.0),
                ),
              ),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    ScoreDisplay(1, "user2", 20, 3000),
                    ScoreDisplay(2, "user3", 120, 3000),
                    ScoreDisplay(3, "user4", 220, 3000),
                    ScoreDisplay(4, "user5", 320, 3000),
                    ScoreDisplay(5, "user6", 420, 3000),
                    ScoreDisplay(6, "user7", 520, 3000),
                    ScoreDisplay(7, "user8", 620, 3000),
                    ScoreDisplay(8, "user8", 720, 3000),
                  ],
                ),
              ),
            ),
          ],
        ));
  }
}

class WeeklyReportPage extends StatefulWidget {
  const WeeklyReportPage({Key? key}) : super(key: key);

  @override
  State<WeeklyReportPage> createState() => WeeklyPageState();
}

class WeeklyPageState extends State<WeeklyReportPage> {
  String transport = 'Car (petrol)';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
            color: Color(0xff232122),
            size: 40,
          ),
          onPressed: () => Navigator.pop(context, false),
        ),
        backgroundColor: Color(0xffA4BF5E),
        elevation: 0.0,
      ),
      backgroundColor: Color(0xffDDDFDE),
      body: SingleChildScrollView(
        child: Container(
          child: Stack(
            children: [
              Container(
                color: Colors.transparent,
                height: 155,
                width: MediaQuery.of(context).size.width,
                child: CustomPaint(
                  painter: CurvePainter(),
                ),
              ),
              Container(
                  alignment: Alignment.center,
                  child: Column(
                    children: [
                      Text("weekly report",
                          style: TextStyle(
                              fontSize: 36,
                              color: Color(0xff232122),
                              fontWeight: FontWeight.bold)),
                      SizedBox(height: 10),
                      Text("2/11~9/11", style: TextStyle(fontSize: 14)),
                      SizedBox(height: 10),
                      Container(
                          alignment: Alignment.center,
                          width: MediaQuery.of(context).size.width * 0.7,
                          margin: EdgeInsets.fromLTRB(0, 50, 0, 0),
                          padding: EdgeInsets.all(10),
                          decoration: BoxDecoration(
                            color: Colors.transparent,
                            borderRadius: BorderRadius.circular(15),
                          )),
                      SizedBox(height: 20),
                      ChartContainer(
                        title: 'Distance travelled by each transport',
                        color: Color(0xffD5D6D6),
                        chart: WeeklyTransportPieChartContent(),
                        size: 0.2,
                      ),
                      Text('\n'),
                      ChartContainer(
                        title: 'CO2 emitted by each transport',
                        color: Color(0xffD5D6D6),
                        chart: WeeklyCO2PieChartContent(),
                        size: 0.2,
                      ),
                      Text('\n'),
                      Container(
                          decoration: BoxDecoration(
                            color: Color(0xffD5D6D6),
                            borderRadius: BorderRadius.circular(15),
                          ),
                          width: MediaQuery.of(context).size.width * 0.2,
                          margin: EdgeInsets.fromLTRB(20, 5, 20, 0),
                          padding: EdgeInsets.symmetric(horizontal: 10),
                          child: Column(
                            children: [
                              DropdownButton<String>(
                                value: transport,
                                icon: const Icon(Icons.arrow_downward),
                                iconSize: 24,
                                underline: Container(),
                                style:
                                    const TextStyle(color: Color(0xff232122)),
                                onChanged: (String? newValue) {
                                  setState(() {
                                    transport = newValue!;
                                  });
                                },
                                items: <String>[
                                  'Walk',
                                  'Train',
                                  'Car (electric)',
                                  'Bus',
                                  'Car (petrol)',
                                  'Car (diesel)'
                                ].map<DropdownMenuItem<String>>((String value) {
                                  return DropdownMenuItem<String>(
                                    value: value,
                                    child: Text(value),
                                  );
                                }).toList(),
                              ),
                              ChartContainer(
                                title: 'default mode of transport',
                                color: Color(0xffD5D6D6),
                                chart: WeeklyBarChartContent(),
                                size: 0.2,
                              )
                            ],
                          )),
                      Text('\n'),
                    ],
                  ))
            ],
          ),
        ),
      ),
    );
  }
}

class EditProfilePage extends StatelessWidget {
  final usernameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: Icon(
              Icons.arrow_back,
              color: Color(0xff232122),
              size: 40,
            ),
            onPressed: () => Navigator.pop(context, false),
          ),
          backgroundColor: Color(0xffDDDFDE),
          elevation: 0.0,
        ),
        backgroundColor: Color(0xffDDDFDE),
        body: SingleChildScrollView(
            child: Container(
                margin: EdgeInsets.fromLTRB(50, 80, 50, 200),
                padding: EdgeInsets.fromLTRB(10.0, 30, 10, 30),
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: Color(0xffCBCBCB),
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Column(
                  children: <Widget>[
                    Text("Edit Profile",
                        style: TextStyle(
                          color: Color(0xff232122),
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                        )),
                    SizedBox(
                      height: 20,
                    ),
                    TextBoxInput("username", usernameController),
                    TextBoxInput("email", emailController),
                    TextBoxInput("password", passwordController),
                    SizedBox(
                      height: 20,
                    ),
                    Container(
                      padding: EdgeInsets.fromLTRB(0, 10, 0, 0),
                      child: ElevatedButton(
                        child: Text("Update",
                            style: TextStyle(
                                fontSize: 16,
                                color: Color(0xff232122),
                                fontWeight: FontWeight.bold)),
                        style: ElevatedButton.styleFrom(
                            padding: EdgeInsets.fromLTRB(30, 10, 30, 10),
                            primary: Color(0xff7DA4A8),
                            shadowColor: Colors.black,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20),
                            )),
                        onPressed: () {
                          Navigator.pushNamed(context, '/home');
                        },
                      ),
                    )
                  ],
                ))));
  }
}

class LearnPage extends StatefulWidget {
  const LearnPage({Key? key}) : super(key: key);

  @override
  State<LearnPage> createState() => LearnPageState();
}

class LearnPageState extends State<LearnPage> {
  String transport = 'Car (petrol)';
  static var distanceInput = TextEditingController(text: "5.7");

  @override
  Widget build(BuildContext context) {
    double tab_width = MediaQuery.of(context).size.width / 3;
    return Scaffold(
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.pushNamed(context, '/new-journey');
          },
          child: const Icon(Icons.add, color: Color(0xff232122), size: 36),
          backgroundColor: Color(0xffEDEDED),
        ),
        backgroundColor: Color(0xffDDDFDE),
        bottomNavigationBar: BottomAppBar(
          child: Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              Container(
                width: tab_width,
                color: Color(0xffCBCBCB),
                child: IconButton(
                  icon: Icon(Icons.account_circle),
                  onPressed: () {
                    Navigator.pushNamed(context, '/home');
                  },
                ),
              ),
              Container(
                width: tab_width,
                color: Color(0xffCBCBCB),
                child: IconButton(
                  icon: Icon(Icons.emoji_events),
                  onPressed: () {
                    Navigator.pushNamed(context, '/scoreboard');
                  },
                ),
              ),
              Container(
                width: tab_width,
                color: Color(0xffDDDFDE),
                child: IconButton(
                  icon: Icon(Icons.school),
                  onPressed: () {},
                ),
              ),
            ],
          ),
          color: Color(0xffCBCBCB),
        ),
        body: Column(
          children: [
            Container(
                margin: EdgeInsets.fromLTRB(20, 10, 20, 0),
                alignment: Alignment.topRight,
                child: TextButton(
                  child: Text("Logout",
                      style: TextStyle(
                        color: Color(0xff232122),
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                      )),
                  onPressed: () {
                    Navigator.pushNamed(context, '/login');
                  },
                )),
            Container(
              padding: EdgeInsets.fromLTRB(35, 5, 30, 5),
              child: Text("CO2 emissions compared",
                  style: TextStyle(
                      fontSize: 36,
                      color: Color(0xff232122),
                      fontWeight: FontWeight.bold)),
            ),
            Container(
              //width: MediaQuery.of(context).size.width * 0.8,
              margin: EdgeInsets.fromLTRB(35, 20, 35, 20),
              padding: EdgeInsets.fromLTRB(10, 15, 10, 0),
              decoration: BoxDecoration(
                color: Color(0xffEDEDED),
                borderRadius: BorderRadius.circular(15),
              ),
              child: Column(
                children: [
                  //SizedBox(height: 30),
                  Container(
                      child: Row(
                    children: [
                      Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              margin: EdgeInsets.fromLTRB(20, 10, 20, 0),
                              padding: EdgeInsets.symmetric(horizontal: 20),
                              child: Text("Distance Travelled (km):"),
                            ),
                            Container(
                                width: MediaQuery.of(context).size.width * 0.5,
                                margin: EdgeInsets.fromLTRB(20, 5, 20, 0),
                                padding: EdgeInsets.symmetric(horizontal: 20),
                                decoration: BoxDecoration(
                                  color: Color(0xffE5E5E5),
                                  borderRadius: BorderRadius.circular(15),
                                ),
                                child: TextFormField(
                                  controller: distanceInput,
                                  decoration:
                                      InputDecoration(border: InputBorder.none),
                                  keyboardType: TextInputType.number,
                                  inputFormatters: [
                                    FilteringTextInputFormatter.allow(
                                        RegExp('[0-9.,]+')),
                                  ],
                                )),
                            Container(
                              margin: EdgeInsets.fromLTRB(20, 10, 20, 0),
                              padding: EdgeInsets.symmetric(horizontal: 20),
                              child: Text("Transport:"),
                            ),
                            Container(
                              alignment: Alignment.center,
                              width: MediaQuery.of(context).size.width * 0.5,
                              margin: EdgeInsets.fromLTRB(20, 5, 20, 0),
                              padding: EdgeInsets.symmetric(horizontal: 20),
                              decoration: BoxDecoration(
                                color: Color(0xffE5E5E5),
                                borderRadius: BorderRadius.circular(15),
                              ),
                              child: DropdownButton<String>(
                                value: transport,
                                icon: const Icon(Icons.arrow_downward),
                                iconSize: 24,
                                underline: Container(),
                                style:
                                    const TextStyle(color: Color(0xff232122)),
                                onChanged: (String? newValue) {
                                  setState(() {
                                    transport = newValue!;
                                  });
                                },
                                items: <String>[
                                  'Walk',
                                  'Train',
                                  'Car (electric)',
                                  'Bus',
                                  'Car (petrol)',
                                  'Car (diesel)'
                                ].map<DropdownMenuItem<String>>((String value) {
                                  return DropdownMenuItem<String>(
                                    value: value,
                                    child: Text(value),
                                  );
                                }).toList(),
                              ),
                            )
                          ]),
                      ElevatedButton(
                        child: Text("View",
                            style: TextStyle(
                                fontSize: 16,
                                color: Color(0xff232122),
                                fontWeight: FontWeight.bold)),
                        style: ElevatedButton.styleFrom(
                            padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
                            primary: Color(0xff7DA4A8),
                            shadowColor: Colors.black,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20),
                            )),
                        onPressed: stateSetter,
                      ),
                    ],
                  )),
                  SizedBox(
                    height: 30,
                  ),
                ],
              ),
            ),
            Container(
                margin: EdgeInsets.fromLTRB(35, 10, 35, 0),
                padding: EdgeInsets.fromLTRB(
                    MediaQuery.of(context).size.width * 0.26, 0, 0, 0),
                decoration: BoxDecoration(
                  color: Color(0xffE5E5E5),
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Row(children: [
                  RotatedBox(
                      quarterTurns: 3,
                      child: new Text("CO2 emission (g)",
                          style: TextStyle(
                              fontSize: 16,
                              color: Color(0xff232122),
                              fontWeight: FontWeight.bold))),
                  ChartContainer(
                      title: '',
                      color: Color(0xffE5E5E5),
                      chart: LearnPageBarChartContent(),
                      size: 0.4)
                ]))
          ],
        ));
  }

  void stateSetter() {
    setState(() {});
  }
}
