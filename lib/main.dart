import 'package:flutter/material.dart';

void main() {
  runApp(HabitBoostApp());
}

class HabitBoostApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'HabitBoost',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(fontFamily: 'Arial'),
      home: HabitListScreen(),
    );
  }
}

class HabitListScreen extends StatefulWidget {
  @override
  _HabitListScreenState createState() => _HabitListScreenState();
}

class _HabitListScreenState extends State<HabitListScreen> {
  List<Habit> habits = [
    Habit(name: 'Drink Water', streak: 3, totalDays: 7),
    Habit(name: 'Morning Exercise', streak: 5, totalDays: 7),
    Habit(name: 'Read a Book', streak: 2, totalDays: 7),
  ];

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: Color(0xFFFAF3E0),
      appBar: AppBar(
        backgroundColor: Color(0xFF228B22),
        elevation: 4,
        shadowColor: Colors.black26,
        title: Text(
          'Habit Boost',
          style: TextStyle(
            fontFamily: 'Arial',
            color: Color(0xFFFAF3E0),
            fontWeight: FontWeight.bold,
            fontSize: 22,
          ),
        ),
        centerTitle: true,
      ),
      body: ListView.builder(
        padding: EdgeInsets.all(16),
        itemCount: habits.length,
        itemBuilder: (context, index) {
          final habit = habits[index];
          return Container(
            margin: EdgeInsets.only(bottom: 16),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(16),
              boxShadow: [
                BoxShadow(
                  color: Colors.black12,
                  blurRadius: 8,
                  offset: Offset(0, 4),
                ),
              ],
            ),
            child: Padding(
              padding: EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Checkbox(
                        value: habit.isCompleted,
                        activeColor: Color(0xFF228B22),
                        checkColor: Colors.white,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(4),
                        ),
                        onChanged: (value) {
                          setState(() {
                            habit.isCompleted = value!;
                            if (value) {
                              habit.streak++;
                            } else {
                              habit.streak = 0;
                            }
                          });
                        },
                      ),
                      SizedBox(width: 8),
                      Expanded(
                        child: Text(
                          habit.name,
                          style: TextStyle(
                            fontFamily: 'Arial',
                            fontSize: screenWidth < 360 ? 14 : 18,
                            fontWeight: FontWeight.w600,
                            color:
                                habit.isCompleted
                                    ? Color(0xFF228B22)
                                    : Colors.black87,
                          ),
                        ),
                      ),
                      Icon(
                        habit.isCompleted
                            ? Icons.check_circle
                            : Icons.circle_outlined,
                        color:
                            habit.isCompleted
                                ? Color(0xFF228B22)
                                : Color(0xFFFF6347),
                        size: 24,
                      ),
                    ],
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}

class Habit {
  String name;
  bool isCompleted;
  int streak;
  int totalDays;

  Habit({
    required this.name,
    this.isCompleted = false,
    this.streak = 0,
    this.totalDays = 7,
  });
}
