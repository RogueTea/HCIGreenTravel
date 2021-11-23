import 'package:flutter/material.dart';

// Setup all the blank pages outlined in the figma wireframes.
// Added basic button routing to map out the navigation of the app.

void main() {
  runApp(MaterialApp(
    initialRoute: '/login',
    routes: {
      '/login': (context) => LoginPage(),
      '/register': (context) => RegisterPage(),
      '/register-success': (context) => RegisterSuccessPage(),
      '/home': (context) => HomePage(),
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
  //final Object _controller;
  TextBoxInput(this._title);

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

class LoginPage extends StatelessWidget {
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
                    TextBoxInput("username"),
                    TextBoxInput("password"),
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

class RegisterPage extends StatelessWidget {
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
                      child: Text("Log In",
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
                    TextBoxInput("username"),
                    TextBoxInput("email"),
                    TextBoxInput("password"),
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

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double tab_width = width / 3;
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
          Column(
            children: <Widget>[
              Container(
                  margin: EdgeInsets.fromLTRB(50, 65, 50, 0),
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
                    child: Text("Edit profile ->",
                        style: TextStyle(
                          color: Color(0xff232122),
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                        )),
                    onPressed: () {},
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
                    child: Text("Your weekly report ->  ",
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
                      margin: EdgeInsets.fromLTRB(30, 20, 10, 0),
                      padding: EdgeInsets.fromLTRB(10.0, 10, 10, 10),
                      height: 110,
                      decoration: BoxDecoration(
                        color: Color(0xffEDEDED),
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: Column(
                        children: [
                          Text("Total CO2 emittion",
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
                      //padding: EdgeInsets.fromLTRB(10.0, 0, 10, 0),
                      height: 110,
                      decoration: BoxDecoration(
                        color: Color(0xffEDEDED),
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: Text("graph"))
                ],
              )
            ],
          )
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
                          'Cycle',
                          'Car',
                          'Bus',
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

class EditJourneyPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
      title: Text("Edit Journey"),
      backgroundColor: Colors.blue,
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
    );
  }
}

class WeeklyReportPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
      title: Text("Weekly Report"),
      backgroundColor: Colors.blue,
    ));
  }
}

class LearnPage extends StatelessWidget {
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
        body: Stack(
          children: [
            Container(
              width: MediaQuery.of(context).size.width * 0.8,
              margin: EdgeInsets.fromLTRB(30, 100, 30, 50),
              padding: EdgeInsets.fromLTRB(10, 20, 10, 20),
              decoration: BoxDecoration(
                color: Color(0xffEDEDED),
                borderRadius: BorderRadius.circular(15),
              ),
              child: Column(
                children: [
                  SizedBox(height: 30),
                  Container(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("       Travel distance (Km)",
                            style: TextStyle(
                                color: Color(0xff232122), fontSize: 16)),
                        Container(
                            margin: EdgeInsets.fromLTRB(20, 10, 80, 10),
                            padding: EdgeInsets.symmetric(horizontal: 20),
                            decoration: BoxDecoration(
                              color: Color(0xffE5E5E5),
                              borderRadius: BorderRadius.circular(15),
                            ),
                            child: TextField(
                                decoration:
                                    InputDecoration(border: InputBorder.none))),
                      ],
                    ),
                  ),
                  Text("graph")
                ],
              ),
            ),
            Container(
              padding: EdgeInsets.fromLTRB(30, 50, 30, 50),
              child: Text("CO2 emittions compared",
                  style: TextStyle(
                      fontSize: 36,
                      color: Color(0xff232122),
                      fontWeight: FontWeight.bold)),
            )
          ],
        ));
  }
}
