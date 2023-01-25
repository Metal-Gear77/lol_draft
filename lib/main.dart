import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        useMaterial3: true,
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: SingleChildScrollView(
        child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              SizedBox(
                height: 500,
                child: Row(
                  children: [
                    Column(
                      children: [exam1, exam1, exam1, exam1, exam1],
                    ),
                    VerticalDivider(
                      width: 50,
                      color: Colors.black,
                    ),
                    Column(
                      children: [card1, card1, card1, card1, card1],
                    )
                  ],
                ),
              ),
              SizedBox(
                height: 300,
                width: 300,
                child: GridView.builder(
                    gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                        maxCrossAxisExtent: 100,
                        crossAxisSpacing: 10,
                        mainAxisSpacing: 10,
                        childAspectRatio: 1),
                    itemCount: 10,
                    itemBuilder: (context, index) {
                      return card2;
                    }),
              )
            ]),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}

Widget card1 = SizedBox(
    width: 200,
    height: 100,
    child: Container(
      color: Colors.red,
    ));
Widget card2 = SizedBox(
    width: 50,
    height: 50,
    child: Container(
      color: Colors.brown,
    ));
Widget exam1 = Container(
    padding: EdgeInsets.all(20),
    width: 300,
    height: 100,
    child: ListTile(
      tileColor: Colors.lightBlueAccent,
      title: Text("닉네임"),
      leading: Icon(Icons.ac_unit_outlined),
      trailing: Icon(Icons.access_alarm_outlined),
    ));

//            Draggable(
//               data: "asd",
//                 feedback: SizedBox(
//                   height: 100,
//                   width: 100,
//                   child: Card(color: Colors.redAccent),
//                 ),
//                 child: SizedBox(
//                   height: 100,
//                   width: 100,
//                   child: Card(color: Colors.lightBlueAccent,),
//                 )),
//             DragTarget(
//                 onAccept: (value){print("${value}" + "asd");},
//                 builder: (
//               BuildContext context,
//               List<dynamic> accepted,
//               List<dynamic> rejected,
//             ) {
//               return SizedBox(
//                   height: 100,
//                   width: 100,
//                   child: Card(color: Colors.red,),
//                 );
//             })
