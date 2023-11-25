
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class Calculator extends StatefulWidget {
  const Calculator({super.key});

  @override
  State<Calculator> createState() => _CalculatorState();
}

class _CalculatorState extends State<Calculator> {

  String _gender = "";
  String _name = "";
  int _age=0;
  double _height = 0;
  double _weight = 0;
  double _calories = 0;


void calculateCalories(){
  if(_gender == "man"){
    _calories =66.47 + (13.75 * _weight ) + (5.003 * _height) - (6.755 * _age);

    }
  else if(_gender=="woman"){
    _calories = 655.1 + (9.563 * _weight) + (1.85*_height) - (4.676 * _age);


  }
  _calories = double.parse(_calories.toStringAsFixed(1));
}






  @override
  Widget build(BuildContext context) {
    final weightController = TextEditingController();
    final heightController = TextEditingController();
    final ageController = TextEditingController();

    bool validate(){
      if(_gender=="" || weightController.text=="" || ageController.text=="" || heightController.text =="" || _name==""){
        return false;
      }
      return true;
    }

    return Scaffold(

      backgroundColor: Colors.grey[100],
      appBar: AppBar(actions: [],title: const Text("Calories Calculator",style: TextStyle(fontSize: 24,fontWeight: FontWeight.bold),),centerTitle: true,backgroundColor: Colors.grey[100]),

      body: Column(

        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              GestureDetector(
                onTap: (){
                  setState(() {
                    _gender="man";
                  });
                },
              child:Container(

                margin: const EdgeInsets.all(30),
                padding: const EdgeInsets.symmetric(horizontal: 30,vertical: 40),

                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),

                  border: Border.all(color:Colors.black),
                  color: _gender == "man" ?Colors.blue[200]:Colors.blue
                ),
                child:  const Icon(Icons.male,color: Colors.white,size: 45,),

              ),
              ),

              GestureDetector(
                onTap: (){
                  setState(() {
                    _gender="woman";
                  });
                },
              child:Container(

                margin: const EdgeInsets.all(30),
                padding: const EdgeInsets.symmetric(horizontal: 30,vertical: 40),



                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),

                    border: Border.all(color:Colors.black),
                    color: _gender == "woman" ?Colors.pink[200]:Colors.pink

                ),
                child: const Icon(Icons.female,color: Colors.white,size: 45,),
              ),
              )
            ],
          ),
          Center(


                child:Padding(padding: const EdgeInsets.all(30),
            child:Column(


              children: [
                 TextField(

                  decoration:const  InputDecoration(
                      border: OutlineInputBorder(),
                      hintText: "Enter Your Name",
                      hintStyle: TextStyle(fontSize: 20)


                  ),
                 onChanged: (e){
                    _name=e;
                 }
                ),const SizedBox(height: 20,),
                TextField(
                  controller: ageController,
                  keyboardType: TextInputType.number,
                  inputFormatters: <TextInputFormatter>[
                    FilteringTextInputFormatter.digitsOnly
                  ],
                  decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      hintText: "Enter Your Age",
                      hintStyle: TextStyle(fontSize: 20)


                  ),
                  onChanged: (e){

                    _age=int.parse(e);

                  },
                ),const SizedBox(height: 20,),
                TextField(
                  controller: heightController,
                  keyboardType: TextInputType.number,
                  inputFormatters: <TextInputFormatter>[
                    FilteringTextInputFormatter.allow(RegExp(r'^\d+\.?\d{0,1}'))
                  ],
                  decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      hintText: "Enter Your Height (cm)",
                      hintStyle: TextStyle(fontSize: 20)


                  ),
                  onChanged: (e){

                    _height=double.parse(e);

                  },
                ),const SizedBox(height: 20,),
                TextField(
                  controller: weightController,
                  keyboardType: TextInputType.number,
                  inputFormatters: <TextInputFormatter>[

                    FilteringTextInputFormatter.allow(RegExp(r'^\d+\.?\d{0,1}'))
                  ],
                  decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      hintText: "Enter Your Weight (kg)",
                      hintStyle: TextStyle(fontSize: 20),


                  ),
                  onChanged: (e){

                    _weight=double.parse(e);

                  },


                ),const SizedBox(height: 60,),
                ElevatedButton(onPressed: (){

                  if(!validate()){
                    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                      content: Text("Please fill all fields",style: TextStyle(fontSize: 24),),
                      backgroundColor: Colors.red,
                    ));
                  }
                  else{
                    calculateCalories();
                  showDialog(context: context, builder: (context) {
                    return AlertDialog(

                        title: Text('Hello $_name !', style: const TextStyle(
                            fontSize: 30, fontWeight: FontWeight.bold),),
                        scrollable: true,
                        content: Column(

                          children: [
                            const Text('your needed calories per day are  ',
                              style: TextStyle(fontSize: 20),),
                            Text('$_calories', style: const TextStyle(
                                fontSize: 24,
                                fontWeight: FontWeight.bold,
                                color: Colors.purple),),


                          ],
                        )
                    );

                  });}  },

                    style: ElevatedButton.styleFrom(backgroundColor: Colors.purple,minimumSize: const Size(100, 100),),
                    child:
                const Icon(Icons.arrow_forward_ios , color: Colors.white,size: 40,)
                )
              ],
            ),



                ),


          )

        ],
      ),

    );
  }
}
