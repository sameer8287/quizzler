import 'package:flutter/material.dart';
import 'questionBank.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

Questionbank questionbank = Questionbank();

void main() {
  runApp( quiz());
}
class quiz extends StatelessWidget {
  const quiz({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.grey.shade900,
        body: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 10.0),
            child: quzz(),
          ),
        ),
      ),
    );
  }
}

class quzz extends StatefulWidget {
  const quzz({Key? key}) : super(key: key);

  @override
  State<quzz> createState() => _quzzState();
}

class _quzzState extends State<quzz> {

  int rand=0;
  List<Icon> score = [ ];
  get len => questionbank.questions.length;

  void checker(bool rightanswer)
  {
    print(len);
    bool correctanswer = questionbank.questions[rand].questionAnswer;
    setState(() {
      if(rand+1 == len )
        {
          Alert(
            context: context,
            title: 'Finished!',
            desc: 'You\'ve reached the end of the quiz.',
          ).show();
          setState(() {
            // questionbank.questions.clear();
            rand = 0;
            score= [];
          });

        }
      else {
        if(rightanswer == correctanswer  )
        {
          setState(() {
            rand++;
            score.add(
              Icon(
                Icons.check,
                color: Colors.green,
              ),
            );
          });
        }
        else
        {
          setState(() {
            rand++;
            score.add(
              Icon(
                Icons.close,
                color: Colors.red,
              ),
            );
          });
        }
      }
    });



  }


  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(0,0,0,22),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            flex: 6,
              child: Center(child: Text(questionbank.questions[rand].questionText,
              style: TextStyle(
                color: Colors.white,
                fontSize: 25.0
              ),
              ),
              ),
          ),

          Expanded(
              child: Padding(
                padding:  EdgeInsets.all(20.0),
                child: TextButton(
                  style:ButtonStyle(
                    backgroundColor: MaterialStateProperty.all<Color>(Colors.green),
                  ),
                  onPressed: () {
                    checker(true);
                  },child: Text('TRUE',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 20.0,
                ),),
                ),
              ),),
          Expanded(
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: TextButton(
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all<Color>(Colors.orange)
                  ),
                  onPressed: (){
                    checker(false);
                  },
                  child: Text('FALSE',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 20.0
                  ),),
                ),
              )),
          Row(
            children: score,
          )
        ],
      ),
    );
  }
}
