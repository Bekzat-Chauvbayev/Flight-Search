import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    home: UserPanel(),
  ));
}
class UserPanel extends StatefulWidget {
  const UserPanel({super.key});

  @override
  State<UserPanel> createState() => _UserPanelState();
}

class _UserPanelState extends State<UserPanel> {
  int _count =0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(

        title: Text('BekaR'),
        centerTitle: true,
        backgroundColor: Colors.amberAccent,
      ),
      body: SafeArea(

        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Column(
              children: [
                Padding(padding: EdgeInsets.only(top: 20)),
                Text('Promo', style: TextStyle(
                color: Colors.white,
                fontSize: 30,
                fontFamily: 'Times New Roman'
              ),),
                Padding(padding: EdgeInsets.only(top: 20)),
                CircleAvatar(
                  backgroundImage: AssetImage('assets/a.png'),radius: 70,
                ),
                Padding(padding: EdgeInsets.only(top: 20)),
                Row(children: [
                  Icon(Icons.mail,size: 25, color: Colors.white,),
                  Padding(padding: EdgeInsets.only(top: 10, right: 5)),
                  Text('admin@gmail.com', style: TextStyle(color: Colors.white),)
                ],),
                Text('Promo $_count', style: TextStyle(
                    color: Colors.white,
                    fontSize: 30,
                    fontFamily: 'Times New Roman'
                ),),

],
        ),
],
      ),

      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.plus_one,color: Colors.white,),
          onPressed: (){
          setState(() {
            _count++;
          });
          },
      ),
    );
  }
}

class MyApp extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(primaryColor: Colors.deepOrange.shade500),
      home: Scaffold(
            appBar: AppBar(
              backgroundColor: Colors.deepOrangeAccent,
              title: Text('chert ',),
              centerTitle: true,),
         body: Row(
           mainAxisAlignment: MainAxisAlignment.center,
           children: [
             Column(
               children: [Text('dsaad'), TextButton(onPressed: () {}, child: Text('das'))],
             ),
             Column(
               children: [Text('dsaad'), TextButton(onPressed: () {}, child: Text('das'))],
             ),
           ],
         ),

        //   Center(
      //       child: Image(
      //         image: AssetImage('assets/a.png'),)
      //     /* OutlinedButton.icon(onPressed: () {}, icon: Icon(Icons.abc_sharp),
      //           label: Text('Gugugagga'))
      //
      //       TextButton(child: Text('baba'),  onPressed: () {  },)
      //       ElevatedButton.icon(onPressed: () {  },icon:Icon( Icons.abc),
      //       label: Text('Click'),) */
      // //  Icon(Icons.face, size: 45,color: Colors.amberAccent,),
      //       ),

        floatingActionButton: FloatingActionButton(
          onPressed: () { print('object'); },
          child: Text("Cli"),
        ),

      ),
    );
  }

}

