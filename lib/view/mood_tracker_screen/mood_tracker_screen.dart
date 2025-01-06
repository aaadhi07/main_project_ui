import 'package:flutter/material.dart';

class MoodTrackerScreen extends StatefulWidget {
  @override
  _MoodTrackerScreenState createState() => _MoodTrackerScreenState();
}

class _MoodTrackerScreenState extends State<MoodTrackerScreen> {
  String? _selectedMood; // Tracks the currently selected mood

  final List<Map<String, dynamic>> _moods = [
    {'emoji': '😊', 'label': 'Happy', 'color': Colors.orange},
    {'emoji': '😐', 'label': 'Neutral', 'color': Colors.blue},
    {'emoji': '😔', 'label': 'Sad', 'color': Colors.purple},
    {'emoji': '🤩', 'label': 'Excited', 'color': Colors.pink},
    {'emoji': '😴', 'label': 'Tired', 'color': Colors.green},
    {'emoji': '😡', 'label': 'Angry', 'color': Colors.red},
  ];

  void _selectMood(String mood) {
    setState(() {
      _selectedMood = mood;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: const Text(
      //     'Mood Tracker',
      //     style: TextStyle(fontSize: 24, color: Colors.white),
      //   ),
      //   centerTitle: true,
      //   backgroundColor: Colors.teal,
      //   elevation: 0,
      // ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.teal.shade100, Colors.teal.shade300],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(height: 20),

            // Title
            Text(
              'How are you feeling today?',
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            const SizedBox(height: 20),

            // Mood Selection Grid
            Expanded(
              child: GridView.builder(
                padding: const EdgeInsets.all(16),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  crossAxisSpacing: 16,
                  mainAxisSpacing: 16,
                ),
                itemCount: _moods.length,
                itemBuilder: (context, index) {
                  final mood = _moods[index];
                  return GestureDetector(
                    onTap: () => _selectMood(mood['label']),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        CircleAvatar(
                          radius: 40,
                          backgroundColor: mood['color'],
                          child: Text(
                            mood['emoji'],
                            style: const TextStyle(fontSize: 30),
                          ),
                        ),
                        const SizedBox(height: 8),
                        Text(
                          mood['label'],
                          style: const TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),

            // Display Selected Mood
            if (_selectedMood != null) ...[
              const SizedBox(height: 20),
              Text(
                'You are feeling $_selectedMood!',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              const SizedBox(height: 20),
            ],

            // Log Mood Button
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: ElevatedButton(
                onPressed: _selectedMood == null
                    ? null
                    : () {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text('Mood "$_selectedMood" logged!'),
                            backgroundColor: Colors.teal,
                          ),
                        );
                        setState(() {
                          _selectedMood = null; // Reset mood selection
                        });
                      },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.white,
                  disabledBackgroundColor: Colors.grey.shade300,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                  padding: const EdgeInsets.symmetric(
                      vertical: 16, horizontal: 40),
                ),
                child: const Text(
                  'Log Mood',
                  style: TextStyle(
                    color: Colors.teal,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
