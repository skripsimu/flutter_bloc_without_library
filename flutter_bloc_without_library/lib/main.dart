import 'package:flutter/material.dart';
import 'package:flutter_bloc_without_library/color_bloc.dart';

void main() => runApp(BLocSample());

class BLocSample extends StatefulWidget {
  @override
  _BLocSampleState createState() => _BLocSampleState();
}

class _BLocSampleState extends State<BLocSample> {
  ColorBLoc bloc = new ColorBLoc();
  @override
  void dispose() {
    bloc.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: new Scaffold(
        appBar: AppBar(
          title: Text('BLoc Sample'),
        ),
        body: Center(
            child: StreamBuilder(
          stream: bloc.stateStream,
          initialData: Colors.amber,
          builder: (context, snapshot) {
            return AnimatedContainer(
              duration: Duration(milliseconds: 500),
              height: 100,
              width: 100,
              color: snapshot.data,
            );
          },
        )),
        floatingActionButton: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: <Widget>[
            FloatingActionButton(
              backgroundColor: Colors.amber,
              onPressed: () {
                bloc.eventSink.add(ColorEvent.to_amber);
              },
            ),
            SizedBox(
              width: 10,
            ),
            FloatingActionButton(
              backgroundColor: Colors.blue,
              onPressed: () {
                bloc.eventSink.add(ColorEvent.to_blue);
              },
            ),
          ],
        ),
      ),
    );
  }
}
