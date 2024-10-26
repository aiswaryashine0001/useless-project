import 'package:flutter/material.dart';

class FinalAdvicePage extends StatelessWidget {
  final String painLevel;

  FinalAdvicePage({required this.painLevel});

  final List<String> _spiritualAdvices = [
    "When life gives you lemons, just say 'Thank you, Universe!' and make lemonade. 🍋",
    "Meditate on this: Sometimes the best path is the one that leads to the snack bar. 🍕",
    "Don't worry, even Buddha took breaks to eat. Find your zen in your favorite snack! 🍩",
    "If you can’t find peace, make sure you haven’t misplaced your chocolate stash. 🍫",
    "Your inner peace is like a WiFi signal; sometimes it’s strong, sometimes it’s weak. Just keep reconnecting! 📶",
    "If your problems were as heavy as they seem, they’d need their own yoga mat. 🧘‍♂️",
    "Life is short. Smile while you still have teeth! 😁",
    "Remember: The only thing standing between you and inner peace is... well, everything. Just breathe! 🌈",
    "You are the author of your own life. Make sure to add some funny chapters! 📖",
    "Even the lotus blooms in muddy waters. So don't worry about the mess; it's where the magic happens! 🌸"
  ];

  // List of image paths from assets
  final List<String> _adviceImages = [
    'assets/meme.png',
    'assets/meme.png',
    'assets/meme.png',
    'assets/meme.png',
    'assets/meme.png',
    'assets/meme.png',
    'assets/meme.png',
    'assets/meme.png',
    'assets/meme.png',
    'assets/meme.png'
  ];

  int getRandomIndex() {
    return DateTime.now().microsecond % _spiritualAdvices.length;
  }

  @override
  Widget build(BuildContext context) {
    final randomIndex = getRandomIndex();

    return Scaffold(
      appBar: AppBar(
        title: Text('Final Advice'),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'You selected: $painLevel',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 20),
              Image.asset(
                _adviceImages[randomIndex],
                height: 180,
                fit: BoxFit.contain,
              ),
              SizedBox(height: 20),
              Text(
                _spiritualAdvices[randomIndex],
                style: TextStyle(fontSize: 20),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
