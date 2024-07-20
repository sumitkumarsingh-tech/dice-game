
import 'package:flutter/material.dart';
import 'dart:math';

import 'package:flutter/services.dart';


   final random = Random();
   String a = "";
   int randomNumber = 1;
   int scoreA = 0;
   int scoreB = 0;
   int numberOfClick = 0;
   bool startingClick= true;



class DiceScreen extends StatefulWidget {
   final String name1;
   final String name2;
   const DiceScreen(this.name1,this.name2,{super.key});

  @override
  State<DiceScreen> createState() => _DiceScreenState();
}
class _DiceScreenState extends State<DiceScreen> {

  // int randomNumber = 1;
  // int scoreA = 0;
  // int scoreB = 0;
  // int numberOfClick = 1;
  // bool startingClick= true;


  void A(){
    scoreA += randomNumber;

  }
  void B(){
    scoreB += randomNumber;
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.grey.shade700,
        body:SizedBox(
          width: double.infinity,
          height: double.infinity,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                  width: 150,
                  height: 150,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15.0),
                  ),
                  child: Image.asset("asset/images/dice_$randomNumber.png",fit: BoxFit.fill,)
              ),
              const SizedBox(
                height: 50,
              ),

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [

                  Column(
                    children: [
                      Text(scoreA.toString(),style: const TextStyle(fontSize: 30,fontWeight: FontWeight.w500),),
                      const SizedBox(
                        height: 10,
                      ),
                      Text(widget.name1 ?? "Stranger 1",style: const TextStyle(fontSize: 24,fontWeight: FontWeight.w300),),

                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Column(
                    children: [
                      Text(scoreB.toString(),style: const TextStyle(fontSize: 30,fontWeight: FontWeight.w500),),
                      const SizedBox(
                        height: 10,
                      ),
                       Text(widget.name2 ?? "Stranger 2",style: const TextStyle(fontSize: 24,fontWeight: FontWeight.w300),),
                    ],
                  ),

                ],

              ),
              const SizedBox(
                height: 50,
              ),

              ElevatedButton(style:ElevatedButton.styleFrom(
                  backgroundColor: Colors.teal.shade800,
                  minimumSize: const Size(150, 50),
                  elevation: 10,
                  shadowColor: Colors.teal.shade700,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(50)
                  )
              ),
                onPressed:  (){
                  setState(() {

                    while(numberOfClick<=10){
                      randomNumber = random.nextInt(6)+1;
                      if(startingClick){
                        A();
                      }else{
                        B();
                      }
                      numberOfClick++;
                      startingClick = !startingClick;
                      break;

                    }
                    if(numberOfClick==10){
                      if(scoreA>scoreB){
                        a = widget.name1 ?? "Stranger 1";
                        showWinnerDialog();
                      }else if(scoreB>scoreA){
                        a = widget.name2 ?? "Stranger 2";
                        showWinnerDialog();
                      }else{
                        showDrawDialog();
                      }
                    }

                  });

                },
                child: const Text("Roll Dice",style: TextStyle(
                    fontSize:18,fontWeight:FontWeight.w500,color:Colors.amber
                ),
                ),


              ),

            ],
          ),
        ),

    );
  }
  void showWinnerDialog(){
    showDialog(barrierDismissible:false,
        context: context,
        builder: (BuildContext context){
       return Dialog(
         shape: RoundedRectangleBorder(
             borderRadius: BorderRadius.circular(16)

         ),
         child: Container(
           height: 500,
           decoration: BoxDecoration(
               borderRadius: BorderRadius.circular(16),
               image:const DecorationImage(image: AssetImage("asset/images/tulip.png",),fit: BoxFit.fill),
               color: Colors.red.shade900
           ),
           child: Padding(
             padding: const EdgeInsets.all(10.0),
             child: Expanded(
               child: Column(
                   mainAxisAlignment: MainAxisAlignment.center,
                   crossAxisAlignment: CrossAxisAlignment.center,
                   mainAxisSize: MainAxisSize.min,
                   children: [
                     Text(a,style: const TextStyle(fontSize: 26,
                         fontWeight:FontWeight.w900,color: Colors.amberAccent),),
                     const SizedBox(
                       height: 10,
                     ),
                     const Padding(
                       padding: EdgeInsets.only(bottom: 8.0),
                       child: Image(image: AssetImage("asset/images/prize.png",),width: 70,height: 70,),
                     ),
                     const SizedBox(
                       height: 30,
                     ),
                     Column(
                       children: [
                         TextButton.icon(
                             style: TextButton.styleFrom(
                               backgroundColor: Colors.black26,

                             ),
                             onPressed: (){
                               Navigator.of(context).pop();
                                setState(() {
                                  scoreA = 0;
                                  scoreB = 0;
                                  startingClick = true;
                                  numberOfClick = 0;
                                  randomNumber = 1;
                                });

                             }, icon: const Icon(Icons.refresh,color: Colors.amberAccent,),
                             label: const Text("Play Again!",style: TextStyle(fontSize: 14,color: Colors.amberAccent),
                             )
                         ),
                         const SizedBox(height: 8,),
                         TextButton.icon(
                             style: TextButton.styleFrom(
                               backgroundColor: Colors.black26,

                             ),
                             onPressed: (){
                               SystemNavigator.pop();
                               setState(() {
                                 scoreA = 0;
                                 scoreB = 0;
                                 startingClick = true;
                                 numberOfClick = 0;
                                 randomNumber = 1;
                               });

                             }, icon: const Icon(Icons.exit_to_app,color: Colors.amberAccent,),
                             label: const Text("Exit Game!",style: TextStyle(fontSize: 14,color: Colors.redAccent),
                             )
                         ),
                       ],
                     ),
                   ]
               ),
             ),
           ),
         ),
       );
        }
    );
  }

  void showDrawDialog() {
    showDialog(context: context, builder: (BuildContext context){
      return Dialog(
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16)

        ),
        child: Container(
          height: 500,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16),
              image:const DecorationImage(image: AssetImage("asset/images/tulip.png",),fit: BoxFit.fill),
              color: Colors.red.shade900
          ),
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Expanded(
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const Text("Draw",style: TextStyle(fontSize: 40,
                        fontWeight:FontWeight.bold,color: Colors.amberAccent),),
                    const SizedBox(
                      height: 10,
                    ),
                    Column(

                      children: [
                        TextButton.icon(
                            style: TextButton.styleFrom(
                              backgroundColor: Colors.black26,
                            ),
                            onPressed: (){
                              Navigator.of(context).pop();
                              setState(() {
                                scoreA = 0;
                                scoreB = 0;
                                startingClick = true;
                                numberOfClick = 0;
                                randomNumber = 1;
                              });


                            }, icon: const Icon(Icons.refresh,color: Colors.amberAccent,),
                            label: const Text("Play Again!",style: TextStyle(fontSize: 14,color: Colors.amberAccent),
                            )
                        ),
                        const SizedBox(height: 8,),
                        TextButton.icon(
                            style: TextButton.styleFrom(
                              backgroundColor: Colors.black26,

                            ),
                            onPressed: (){
                              SystemNavigator.pop();
                              setState(() {
                                scoreA = 0;
                                scoreB = 0;
                                startingClick = true;
                                numberOfClick = 0;
                                randomNumber = 1;
                              });

                            }, icon: const Icon(Icons.exit_to_app,color: Colors.amberAccent,),
                            label: const Text("Exit Game!",style: TextStyle(fontSize: 14,color: Colors.redAccent),
                            )
                        ),
                      ],
                    ),
                  ]
              ),
            ),
          ),
        ),
      );
    });
  }


}


