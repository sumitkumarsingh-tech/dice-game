import 'package:flutter/material.dart';
import 'screen_one/profile_screen.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:avatar_glow/avatar_glow.dart';
import 'package:flutter/services.dart';

void main() {
  //to stop app to turn in landscape mode
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);

  runApp(const MaterialApp(
      debugShowCheckedModeBanner: false, home: DiceGameApp()));
}

class DiceGameApp extends StatefulWidget {
  const DiceGameApp({super.key});


  @override
  State<DiceGameApp> createState() => _DiceGameAppState();
}

class _DiceGameAppState extends State<DiceGameApp> {
  var nameController1 = TextEditingController();
  var nameController2 = TextEditingController();
  var counterText1 = "";
  var counterText2 = "";

  @override
  Widget build(BuildContext context) {
    var heightC = MediaQuery.of(context).size.height;
    var widthC = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: Colors.grey.shade900,
      body: SingleChildScrollView(
        keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
        scrollDirection: Axis.vertical,
        child: Container(
          margin: const EdgeInsets.only(top: 30.0),
          width: widthC,
          height: heightC,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text("Dice Game",
                  style: GoogleFonts.eczar(
                      fontSize: 40,
                      fontWeight: FontWeight.w800,
                      color: Colors.white)),
              AvatarGlow(
                endRadius: 100,
                duration: const Duration(seconds: 2),
                repeatPauseDuration: const Duration(seconds: 1),
                startDelay: const Duration(seconds: 1),
                glowColor: Colors.red,
                child: Container(
                  decoration: BoxDecoration(
                      border: Border.all(style: BorderStyle.none),
                      shape: BoxShape.circle),
                  child: CircleAvatar(
                    backgroundColor: Colors.grey.shade900,
                    radius: 60,
                    child: Image.asset(
                      "asset/images/dice3d.png",
                      fit: BoxFit.scaleDown,
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 30.0, right: 30),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("Player 1",
                            style: GoogleFonts.eczar(
                                fontSize: 12,
                                fontWeight: FontWeight.w800,
                                color: Colors.white)),
                        const SizedBox(
                          height: 8,
                        ),
                        SizedBox(
                          width: 100,
                          height: 48,
                          child: Center(
                            child: TextField(
                              keyboardType: TextInputType.name,
                              onChanged: (value){
                                setState(() {
                                  counterText1 = (9-value.length ).toString();
                                });
                              },
                              maxLength: 9,
                              maxLengthEnforcement: MaxLengthEnforcement.enforced,
                              style: GoogleFonts.eczar(
                                  fontSize: 12,
                                  fontWeight: FontWeight.w800,
                                  color: Colors.white),
                              decoration: InputDecoration(
                                focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(12),
                                    borderSide: const BorderSide(
                                        color: Colors.amberAccent)),
                                enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(12),
                                    borderSide: const BorderSide(
                                        color: Colors.amberAccent)),
                                disabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(12),
                                    borderSide: const BorderSide(
                                        color: Colors.amberAccent)),
                              ),
                              controller: nameController1,
                            ),
                          ),
                        )
                      ],
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("Player 2",
                            style: GoogleFonts.eczar(
                                fontSize: 12,
                                fontWeight: FontWeight.w800,
                                color: Colors.white)),
                        const SizedBox(
                          height: 8,
                        ),
                        SizedBox(
                          width: 100,
                          height: 48,
                          child: Center(
                            child: TextField(
                              keyboardType: TextInputType.name,
                              onChanged: (value){
                                setState(() {
                                  counterText2 = (9-value.length ).toString();
                                });
                              },
                              maxLength: 9,
                              maxLengthEnforcement: MaxLengthEnforcement.enforced,
                              style: GoogleFonts.eczar(
                                  fontSize: 12,
                                  fontWeight: FontWeight.w800,
                                  color: Colors.white),
                              decoration: InputDecoration(
                                focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(12),
                                    borderSide: const BorderSide(
                                        color: Colors.amberAccent)),
                                enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(12),
                                    borderSide: const BorderSide(
                                        color: Colors.amberAccent)),
                                disabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(12),
                                    borderSide: const BorderSide(
                                        color: Colors.amberAccent)),
                              ),
                              controller: nameController2,
                            ),
                          ),
                        )
                      ],
                    ),
                  ],
                ),
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.red.shade800,
                    minimumSize: const Size(150, 50),
                    elevation: 40,
                    shadowColor: Colors.red.shade900,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(50))),
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return  DiceScreen(nameController1.text ,nameController2.text);
                  }));
                },
                child: Text("Start Game",
                    style: GoogleFonts.eczar(
                        fontSize: 25,
                        fontWeight: FontWeight.w800,
                        color: Colors.white)),
              ),
              Text("Made with ❤ by Sumit",
                  style: GoogleFonts.eczar(
                      fontSize: 18,
                      fontWeight: FontWeight.w800,
                      color: Colors.white)),
            ],
          ),
        ),
      ),
    );
  }
}
