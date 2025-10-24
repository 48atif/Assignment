import 'package:flutter/material.dart';

class CourseGridScreen extends StatelessWidget {
  const CourseGridScreen({super.key});

  final List<Map<String, String>> courses = const [
    {
      'title': 'Full Stack Web Development with JavaScript (MERN)',
      'image': 'assets/js.jpg',
      'batch': 'ব্যাচ ১৯',
      'hours': '৬০ ঘন্টা বাকি',
      'days': '৬ দিন বাকি'
    },
    {
      'title': 'Full Stack Web Development with Python, Django & React',
      'image': 'assets/phython.jpg',
      'batch': 'ব্যাচ ৫',
      'hours': '৮০ ঘন্টা বাকি',
      'days': '৪০ দিন বাকি'
    },
    {
      'title': 'Full Stack Web Development with ASP.Net Core',
      'image': 'assets/asp.jpg',
      'batch': 'ব্যাচ ৭',
      'hours': '৭৫ ঘন্টা বাকি',
      'days': '৩৬ দিন বাকি'
    },
    {
      'title': 'SQA: Manual & Automated Testing',
      'image': 'assets/sqa.jpg',
      'batch': 'ব্যাচ ১৩',
      'hours': '৫৫ ঘন্টা বাকি',
      'days': '৩৫ দিন বাকি'
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("মডিউল ১০ এর অ্যাসাইনমেন্ট"),
        backgroundColor: Colors.blueAccent,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: GridView.count(
          crossAxisCount: 2,
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
          childAspectRatio: 0.72,
          children: courses.map((course) {
            return CourseCard(
              title: course['title']!,
              imageUrl: course['image']!,
              batch: course['batch']!,
              hours: course['hours']!,
              days: course['days']!,
            );
          }).toList(),
        ),
      ),
    );
  }
}

class CourseCard extends StatelessWidget {
  final String title;
  final String imageUrl;
  final String batch;
  final String hours;
  final String days;

  const CourseCard({
    super.key,
    required this.title,
    required this.imageUrl,
    required this.batch,
    required this.hours,
    required this.days,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Column(
        children: [
          // Image covers half
          Expanded(
            flex: 1,
            child: ClipRRect(
              borderRadius:
              const BorderRadius.vertical(top: Radius.circular(12)),
              child: Image.asset(
                imageUrl,
                width: double.infinity,
                fit: BoxFit.cover,
              ),
            ),
          ),

          //content
          Expanded(
            flex: 1,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      InfoTag(icon: Icons.group, text: batch),
                      InfoTag(icon: Icons.schedule, text: hours),
                      InfoTag(icon: Icons.calendar_today, text: days),
                    ],
                  ),
                  const SizedBox(height: 6),
                  Text(
                    title,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 13,
                    ),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                  const Spacer(),
                  ElevatedButton.icon(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.white,
                      side: BorderSide(color: Colors.grey.shade300),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                      minimumSize: const Size(double.infinity, 36),
                    ),
                    onPressed: () {},
                    icon: const Icon(Icons.arrow_forward,
                        size: 16, color: Colors.black),
                    label: const Text(
                      "বিস্তারিত দেখুন",
                      style: TextStyle(color: Colors.black),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class InfoTag extends StatelessWidget {
  final IconData icon;
  final String text;

  const InfoTag({super.key, required this.icon, required this.text});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(icon, size: 14, color: Colors.grey[700]),
        const SizedBox(width: 3),
        Text(
          text,
          style: TextStyle(fontSize: 10, color: Colors.grey[700]),
        ),
      ],
    );
  }
}