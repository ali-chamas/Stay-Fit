import 'package:fitness_helper/calulator.dart';
import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:
       Container(

        height:  MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,

        decoration: const BoxDecoration(
          image: DecorationImage(
            image: NetworkImage("https://images.unsplash.com/photo-1470167290877-7d5d3446de4c?w=400&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8Mnx8Zml0bmVzcyUyMG1lYXN1cmluZyUyMHdlaWdodHxlbnwwfHwwfHx8MA%3D%3D"),
            fit: BoxFit.cover
          )
        ),
         child: Center(
           child: Column(
             children: [
               const SizedBox(height: 50,),
               const Text("Stay Fit",style: TextStyle(fontSize: 75,fontWeight: FontWeight.bold),),
               const Text("Try our calories calculator",style: TextStyle(fontSize: 20,fontWeight: FontWeight.normal),),
               const SizedBox(height: 30,),
               ElevatedButton(onPressed: (){Navigator.push(
                 context,
                 MaterialPageRoute(builder: (context) => const Calculator()),
               );},
                 style: ElevatedButton.styleFrom(backgroundColor: Colors.purple,minimumSize: const Size(100, 60)),
                  child: const Text("Let's GO!",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 25,color: Colors.white),),)
             ],
           ),
         ),
      ),

    );
  }
}
