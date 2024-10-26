import 'package:flutter/material.dart';
import 'final_advice_page.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool hasHeadache = false;
  String? painLevel;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.white,
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: hasHeadache
                ? _buildPainLevelSelector()
                : _buildHeadacheQuestion(),
          ),
        ),
      ),
    );
  }

  Widget _buildHeadacheQuestion() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          'Do you have a headache?',
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          textAlign: TextAlign.center,
        ),
        SizedBox(height: 20),
        AnimatedButton(
          onPressed: () {
            setState(() {
              hasHeadache = true;
            });
          },
          text: 'Yes',
        ),
      ],
    );
  }

  Widget _buildPainLevelSelector() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          'How bad is the pain?',
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          textAlign: TextAlign.center,
        ),
        SizedBox(height: 20),
        _buildPainLevelButton('Mild'),
        SizedBox(height: 10),
        _buildPainLevelButton('Moderate'),
        SizedBox(height: 10),
        _buildPainLevelButton('Severe'),
      ],
    );
  }

  Widget _buildPainLevelButton(String level) {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        onPressed: () {
          setState(() {
            painLevel = level;
          });
          _showSarcasticComment(level);
        },
        child: Text(
          level,
          style: TextStyle(fontSize: 18),
        ),
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.blueAccent,
          padding: EdgeInsets.symmetric(vertical: 15),
          textStyle: TextStyle(fontSize: 18),
        ),
      ),
    );
  }

  void _showSarcasticComment(String level) {
    String comment;

    switch (level) {
      case 'Mild':
        comment = 'Seriously? Just drink some water! 💧';
        break;
      case 'Moderate':
        comment = 'Oh come on! You’re not dying! 😂';
        break;
      case 'Severe':
        comment = 'Killing you? More like a slight inconvenience! 🤦‍♂️';
        break;
      default:
        comment = 'What?';
    }

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Pain Level: $level'),
          content: Text(comment),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
                _finalAdvice(level);
              },
              child: Text('Got it!'),
            ),
          ],
        );
      },
    );
  }

  void _finalAdvice(String level) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => FinalAdvicePage(painLevel: level),
      ),
    );
  }
}

// AnimatedButton widget for playful effect
class AnimatedButton extends StatefulWidget {
  final VoidCallback onPressed;
  final String text;

  AnimatedButton({required this.onPressed, required this.text});

  @override
  _AnimatedButtonState createState() => _AnimatedButtonState();
}

class _AnimatedButtonState extends State<AnimatedButton>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(seconds: 1),
      vsync: this,
    )..repeat(reverse: true);

    _animation = CurvedAnimation(
      parent: _controller,
      curve: Curves.easeInOut,
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ScaleTransition(
      scale: _animation,
      child: ElevatedButton(
        onPressed: widget.onPressed,
        child: Text(widget.text),
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.blueAccent,
          padding: EdgeInsets.symmetric(horizontal: 30, vertical: 15),
          textStyle: TextStyle(fontSize: 18),
        ),
      ),
    );
  }
}
