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

class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffDDDFDE),
      body: Center(
            child: Column(
          children: <Widget>[
            ElevatedButton(
              child: Text("Register"),
              onPressed: () {
                Navigator.pushNamed(context, '/register');
              },
            ),
            ElevatedButton(
              child: Text("Home"),
              onPressed: () {
                Navigator.pushNamed(context, '/home');
              },
            )
          ],
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


