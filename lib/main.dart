import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'CarProvider.dart';
void main() {
  runApp(
    ChangeNotifierProvider(
      create: (Context)=>CarState(),
      child: const MyApp(),
    )
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // TRY THIS: Try running your application with "flutter run". You'll see
        // the application has a blue toolbar. Then, without quitting the app,
        // try changing the seedColor in the colorScheme below to Colors.green
        // and then invoke "hot reload" (save your changes or press the "hot
        // reload" button in a Flutter-supported IDE, or press "r" if you used
        // the command line to start the app).
        //
        // Notice that the counter didn't reset back to zero; the application
        // state is not lost during the reload. To reset the state, use hot
        // restart instead.
        //
        // This works for code too, not just values: Most code changes can be
        // tested with just a hot reload.
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home:  Home(),
    );
  }
}

class Home extends StatelessWidget {
  Home({Key? key}) : super(key: key);
  final CarState _provider = CarState();
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextListener(model: _provider),
            Padding(
              padding: const EdgeInsets.only(top:8.0),
              child: Row(

                mainAxisAlignment: MainAxisAlignment.center,
                children: [

                  FloatingActionButton(
                      child: const Icon(Icons.car_crash),
                      onPressed: (){
                        _provider.setState("Crash");
                      }
                  ),
                  FloatingActionButton(
                      child: const Icon(Icons.car_rental),
                      onPressed: (){
                        _provider.setState("rental");
                      }
                  ),
                  FloatingActionButton(
                      child: const Icon(Icons.car_repair),
                      onPressed: (){
                        _provider.setState("Repair");
                      }
                  ),
                ],
              ),
            ),

          ],
        ),
      )
    );
  }
}
class TextListener extends StatelessWidget {
  const TextListener({Key? key,required this.model}) : super(key: key);
  final CarState model;
  @override
  Widget build(BuildContext context) {
    return  Container(
      child: ListenableBuilder(
        listenable: model,
        builder: (BuildContext context,Widget? child){
          return Text(
            "State: ${model.state}"
          );
        },
      ),
    );
  }
}



