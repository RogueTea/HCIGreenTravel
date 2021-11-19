import 'package:flutter/material.dart';

// Setup all the blank pages outlined in the figma wireframes.
// Added basic button routing to map out the navigation of the app.

void main() {
  runApp(MaterialApp(
    initialRoute: '/login',
    routes: {
      '/login': (context) => LoginPage(),
      '/register': (context) => RegisterPage(),
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
        child:Stack(
        children: [
          Positioned(
                    top: 150,
                    left: 80,
                    height:60,
                    width: 120,
                    child: Container(
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                      color: Color(0xff7DA4A8),
                      borderRadius: BorderRadius.circular(15),
                    ),
                  child:Text("Log In",
                    style: TextStyle(
                      fontSize: 20, 
                      fontWeight: FontWeight.bold,)))
                ),
          Positioned(
                    top: 150,
                    right: 80,
                    height:60,
                    width: 120,
                    child: Container(
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                      color: Color(0xffDDDFDE),
                      borderRadius: BorderRadius.circular(15),
                    ),
                  child:Text("Register",
                    style: TextStyle(
                      fontSize: 20, 
                      fontWeight: FontWeight.bold,)))
                ),
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
           ElevatedButton(
              child: Text("Log In", style: TextStyle(
                fontSize: 16, 
                color: Color(0xff232122),
                fontWeight: FontWeight.bold)),
              style: ElevatedButton.styleFrom(
                padding:EdgeInsets.fromLTRB(30, 10, 30, 10),
                primary: Color(0xff7DA4A8),
                shadowColor: Colors.black,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),)),
              onPressed: () {
                Navigator.pushNamed(context, '/home');
              },
            ),
          ],
        )
            )],
            )));
  }
}

class RegisterPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
      title: Text("Register"),
      backgroundColor: Colors.blue,
    ));
  }
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double tab_width = MediaQuery.of(context).size.width/3;
    return Scaffold(
        backgroundColor: Color(0xffDDDFDE),
        bottomNavigationBar: BottomAppBar(
        child: Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            Container(
              width: tab_width,
              color: Color(0xffDDDFDE),
              child: IconButton(icon: Icon(Icons.account_circle), onPressed: () {},),
            ), 
             Container(
              width: tab_width,
              color: Color(0xffCBCBCB),
              child: IconButton(icon: Icon(Icons.emoji_events), onPressed: () {
                Navigator.pushNamed(context, '/scoreboard');
              },),
            ), 
             Container(
              width: tab_width,
              color: Color(0xffCBCBCB),
              child:  IconButton(icon: Icon(Icons.school), onPressed: () {
                Navigator.pushNamed(context, '/learn');
              },),
            ), 
          ],
        ),
        color: Color(0xffCBCBCB),
      ),
        body: Center(
            child: Column(
          children: <Widget>[
            ElevatedButton(
              child: Text("New Journey"),
              onPressed: () {
                Navigator.pushNamed(context, '/new-journey');
              },
            ),
            ElevatedButton(
              child: Text("Edit Journey"),
              onPressed: () {
                Navigator.pushNamed(context, '/edit-journey');
              },
            ),
            ElevatedButton(
              child: Text("Scoreboard"),
              onPressed: () {
                Navigator.pushNamed(context, '/scoreboard');
              },
            ),
            ElevatedButton(
              child: Text("Weekly Report"),
              onPressed: () {
                Navigator.pushNamed(context, '/weekly-report');
              },
            ),
            ElevatedButton(
              child: Text("Learn"),
              onPressed: () {
                Navigator.pushNamed(context, '/learn');
              },
            )
          ],
        )));
  }
}

class NewJourneyPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Add New Journey"),
          backgroundColor: Colors.blue,
        ),
        body: Center(
            child: Column(
          children: <Widget>[
            ElevatedButton(
              child: Text("Save Journey"),
              onPressed: () {
                Navigator.pushNamed(context, '/new-journey/save');
              },
            ),
          ],
        )));
  }
}

class NewJourneyConfirmPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Save Journey"),
          backgroundColor: Colors.blue,
        ),
        body: Center(
            child: Column(
          children: <Widget>[
            ElevatedButton(
              child: Text("Save Journey"),
              onPressed: () {
                Navigator.pushNamed(context, '/new-journey/confirm');
              },
            ),
          ],
        )));
  }
}

class NewJourneySavePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Name Journey"),
          backgroundColor: Colors.blue,
        ),
        body: Center(
            child: Column(
          children: <Widget>[
            ElevatedButton(
              child: Text("Journey Score"),
              onPressed: () {
                Navigator.pushNamed(context, '/new-journey/score');
              },
            ),
          ],
        )));
  }
}

class NewJourneyScoredPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Journey Scored"),
          backgroundColor: Colors.blue,
        ),
        body: Center(
            child: Column(
          children: <Widget>[
            ElevatedButton(
              child: Text("Home"),
              onPressed: () {
                Navigator.pushNamed(context, '/home');
              },
            ),
          ],
        )));
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
    double tab_width = MediaQuery.of(context).size.width/3;
    return Scaffold(
        appBar: AppBar(
         title: Text("Scoreboard"),
          backgroundColor: Colors.blue,
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
              child: IconButton(icon: Icon(Icons.account_circle), onPressed: () {
                Navigator.pushNamed(context, '/home');
              },),
            ), 
             Container(
              width: tab_width,
              color: Color(0xffCDDDFDE),
              child: IconButton(icon: Icon(Icons.emoji_events), onPressed: () {},),
            ), 
             Container(
              width: tab_width,
              color: Color(0xffCBCBCB),
              child:  IconButton(icon: Icon(Icons.school), onPressed: () {
                Navigator.pushNamed(context, '/learn');
              },),
            ), 
          ],
        ),
        color: Color(0xffCBCBCB),
      ),);
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
    double tab_width = MediaQuery.of(context).size.width/3;
    return Scaffold(
       backgroundColor: Color(0xffDDDFDE),
        bottomNavigationBar: BottomAppBar(
        child: Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            Container(
              width: tab_width,
              color: Color(0xffCBCBCB),
              child: IconButton(icon: Icon(Icons.account_circle), onPressed: () {
                Navigator.pushNamed(context, '/home');
              },),
            ), 
             Container(
              width: tab_width,
              color: Color(0xffCBCBCB),
              child: IconButton(icon: Icon(Icons.emoji_events), onPressed: () {
                Navigator.pushNamed(context, '/scoreboard');
              },),
            ), 
             Container(
              width: tab_width,
              color: Color(0xffDDDFDE),
              child:  IconButton(icon: Icon(Icons.school), onPressed: () {},),
            ), 
          ],
        ),
        color: Color(0xffCBCBCB),
      ),
        );
  }
}


