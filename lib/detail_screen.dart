import 'package:flutter/material.dart'; //flutter sdk

class DetailScreen extends StatelessWidget {

  final String title;
  final bool done;

  const DetailScreen(this.title, this.done);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: done ? Colors.green : Colors.red,
      appBar: AppBar(
        title: Text("Details"),
        backgroundColor: Colors.transparent
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(vertical: 70),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            Expanded(
              child: Container(
                padding: EdgeInsets.all(20),
                alignment: Alignment.center,
                child: Text(
                  done ? 'Das hast du schon erledigt:' : 'Das musst du noch machen:',
                  style: TextStyle(
                    fontSize: 20, 
                    color: Colors.white
                  ), 
                  textAlign: TextAlign.center
                )
              )
            ),
            Expanded(
              child: Container(
                alignment: Alignment.center,
                child: Text(
                  title, 
                  style: TextStyle(
                    fontSize: 30, 
                    color: Colors.white
                  )
                )
              )
            ),
            Expanded(
              child: IconButton(
                iconSize: 60,
                onPressed: () => Navigator.pop(context),
                icon: Icon(done ? Icons.check : Icons.close, color: Colors.white),
              ),
            ),
          ],
        ),
      ),
    );
  }
}


class Counter extends StatefulWidget {
  @override
  _CounterState createState() => _CounterState();
}

class _CounterState extends State<Counter> {
  int count = 0;

  void plusOne() {
    setState(() {
      count++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Click Count')),
      body: Center(
        child: Text(count.toString()),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: plusOne,
      ),
    );
  }
}