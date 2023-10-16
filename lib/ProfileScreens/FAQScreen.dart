import 'package:flutter/material.dart';

class DropDownQuestions extends StatefulWidget {
  const DropDownQuestions({super.key});

  @override
  _DropDownQuestionsState createState() => _DropDownQuestionsState();
}

class _DropDownQuestionsState extends State<DropDownQuestions> {
  List<QuestionAnswerPair> questionAnswerPairs = [
    QuestionAnswerPair("How do I use Walt's services?",
        "To use Walt's services, simply visit our website and create an\naccount. Once you have created an account, you can browse our\nservices and select the ones that you want to use."),
    QuestionAnswerPair("What payment methods does Walt accept?", ""),
    QuestionAnswerPair("Can I cancel my order or request a refund?", ""),
    QuestionAnswerPair("How do I contact Walt's customer support?",""),
    QuestionAnswerPair("How does Walt protect my personal information?", ""),
    QuestionAnswerPair("How do I update my account information?",""),
    QuestionAnswerPair("Does Walt offer any discounts or promotions?", "")
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          'FAQs',
          textAlign: TextAlign.center,
          style: TextStyle(
            color: Colors.black,
            fontSize: 19,
            fontFamily: 'Inter',
            fontWeight: FontWeight.w600,
            height: 0,
          ),
        ),
      ),
      body: ListView(
        children: questionAnswerPairs
            .map((pair) => DropDownQuestionWidget(pair))
            .toList(),
      ),
    );
  }
}

class QuestionAnswerPair {
  final String question;
  final String answer;

  QuestionAnswerPair(this.question, this.answer);
}

class DropDownQuestionWidget extends StatefulWidget {
  final QuestionAnswerPair pair;

  DropDownQuestionWidget(this.pair);

  @override
  _DropDownQuestionWidgetState createState() => _DropDownQuestionWidgetState();
}

class _DropDownQuestionWidgetState extends State<DropDownQuestionWidget> {
  bool isExpanded = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        ListTile(
          title: Text(widget.pair.question),
          titleTextStyle: const TextStyle(
          color: Color(0xFF2A2C33),
          fontSize: 12,
          fontFamily: 'Inter',
          fontWeight: FontWeight.w600,
          height: 0,
          ),
          trailing: IconButton(
            icon: Icon(isExpanded ? Icons.expand_less : Icons.expand_more),
            onPressed: () {
              setState(() {
                isExpanded = !isExpanded;
              });
            },
          ),
        ),
        if (isExpanded)
          Padding(
            padding: const EdgeInsets.only(left: 16.0, right: 16.0,bottom:16),
            child: Align(
              alignment: Alignment.topLeft,
              child: Text(
                widget.pair.answer,
                style: const TextStyle(
                  color: Color(0xFF5A6071),
                  fontSize: 12,
                  fontFamily: 'Inter',
                  fontWeight: FontWeight.w400,
                  height: 0,
                ),
              ),
            ),
          ),
      ],
    );
  }
}
