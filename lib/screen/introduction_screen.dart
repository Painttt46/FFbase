import 'dart:html';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'home_screen.dart';
class IntroScreen extends StatelessWidget {
  IntroScreen({super.key});
final List<PageViewModel> pages = [
  
  PageViewModel(
    
    
    title :'Connect with Veraprat',
    body:'Duotupooooooooo',
    footer: SizedBox(
      height:45,
      width:150,
      child:ElevatedButton(
        style: ElevatedButton.styleFrom(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          elevation: 8,
        ),
        onPressed: () {} ,
        child:  const Text('Logest')),
      ),
      image: Image.network('https://th.bing.com/th/id/OIP.kXPVZ9v693YSiHQdgt08hAHaEo?rs=1&pid=ImgDetMain'),
      decoration: const PageDecoration(
        titleTextStyle: TextStyle(
          fontSize: 25,
          fontWeight: FontWeight.bold,
        )
      ),
    ),

  PageViewModel( //page 2
    title :'Vraprat V2',
    body:'Helpppppppppppppppppppppppppppppppppppppppppppppppp',
    footer: SizedBox(
      height:45,
      width:150,
      child:ElevatedButton(
        style: ElevatedButton.styleFrom(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          elevation: 8,
        ),
        onPressed: () {} ,
        child:  const Text('Jope')),
      ),
      image: Image.network('https://www.swremovals.com.au/wp-content/uploads/2018/01/dog.jpg'),
      decoration: const PageDecoration(
        titleTextStyle: TextStyle(
          fontSize: 25,
          fontWeight: FontWeight.bold,
        )
      ),
    ),

  PageViewModel( //page 3
    title :'Veraprat V3',
    body:'10000000% lego',
    footer: SizedBox(
      height:45,
      width:150,
      child:ElevatedButton(
        style: ElevatedButton.styleFrom(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          elevation: 8,
        ),
        onPressed: () {} ,
        child:  const Text('Logest')),
      ),
      image: Image.network('https://th.bing.com/th/id/R.26e1b8d36a2f573aa20b4ff3353a79db?rik=ffcdJ50wCLcTkQ&pid=ImgRaw&r=0'),
      decoration: const PageDecoration(
        titleTextStyle: TextStyle(
          fontSize: 25,
          fontWeight: FontWeight.bold,
        )
      ),
    ),
];
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      appBar: AppBar(
        backgroundColor: Colors.orange,
        title: const Text('On Boarding'),
        centerTitle: true,
      ),
      body: IntroductionScreen(
        
        pages: pages,
        showSkipButton: true,
        skip: const Text('Skip'),
        showDoneButton: true,
        done: const Text('Done'),
        showNextButton: true,
        next: const Icon(Icons.arrow_forward,size: 25,),
        onDone: () => onDone (context),
        curve: Curves.bounceOut,
        dotsDecorator: const DotsDecorator(
          size: Size(15,15),
          color: Colors.blue,
          activeColor: Colors.orange,
          activeSize: Size.square(20),
        ),
      ),
    );
  }
  void onDone (context) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool('ON_BOARDING', false);
    Navigator.pushReplacement(
      context, 
      MaterialPageRoute(
        builder:(context) =>  HomeScreen(),
        ),
        );
  }
}