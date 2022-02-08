import 'package:flutter/material.dart';

import 'story_brain.dart';

StoryBrain storyBrain = StoryBrain();

void main() {
  runApp(const DestiniApp());
}

class DestiniApp extends StatelessWidget {
  const DestiniApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark(),
      home: const HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {

    // String story = storyBrain.getStory();

    // nextStory (choice) {
    //
    // }

    return Scaffold(
      // backgroundColor: Colors.red,
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage("images/background.png"),
            fit: BoxFit.cover
          )
        ),
        padding: const EdgeInsets.symmetric(vertical: 50, horizontal: 15),
        constraints:  BoxConstraints.expand(),
        child: SafeArea(

          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
               Expanded(
                flex: 12,
                  child: Center(
                    child: Text(
                      storyBrain.getStory(),
                      style: const TextStyle(
                        fontSize: 25
                      ),
                    ),
                  )),
              Expanded(
                  flex: 2,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8),
                    child: TextButton(
                      onPressed: () {
                        storyBrain.nextStory(1);
                        setState(() {
                          storyBrain.getChoice1();
                        });
                      },
                      child:  Text(
                        storyBrain.getChoice1(),
                        style: const TextStyle(
                          fontSize: 20,
                          color: Colors.white
                        ),
                      ),
                      style: TextButton.styleFrom(
                          backgroundColor: Colors.red
                      ),
                    ),
                  )),
              Expanded(
                  flex: 2,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8),
                    child: Visibility(
                      visible: storyBrain.buttonVisible(),
                      child: TextButton(
                        onPressed: () {
                          storyBrain.nextStory(2);
                          setState(() {
                            storyBrain.getChoice2();
                          });
                        },
                        child:  Text(
                          storyBrain.getChoice2(),
                          style: const TextStyle(
                            fontSize: 20,
                            color: Colors.white,
                          ),
                        ),
                        style: TextButton.styleFrom(
                          backgroundColor: Colors.blue
                        ),
                      ),
                    ),
                  ))
            ],
          ),
        ),
      ),
    );
  }
}


