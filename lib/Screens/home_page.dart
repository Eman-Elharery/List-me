import 'package:flutter/material.dart';
import 'package:list_me/Screens/add_list.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final List<Map<String, dynamic>> items = [
    {
      'title': 'Movies',
      'count': 10,
      'color': const Color(0xFFEEE5FF),
      'imagePath': 'assets/images/movie_img.png',
    },
    {
      'title': 'Series',
      'count': 14,
      'color': const Color(0xFFF6DFB9),
      'imagePath': 'assets/images/series_img.png',
    },
    {
      'title': 'Books',
      'count': 7,
      'color': const Color(0xFFC8DEEF),
      'imagePath': 'assets/images/book_img.png',
    },
    {
      'title': 'Songs',
      'count': 3,
      'color': const Color(0xFFC0E9CB),
      'imagePath': 'assets/images/music_img.png',
    },
  ];

  void addButton(String title, Color color, String imagePath) {
    setState(() {
      items.add({
        'title': title,
        'color': color,
        'imagePath': imagePath,
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: GridView.builder(
          itemCount: items.length,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2, 
            mainAxisSpacing: 16,
            crossAxisSpacing: 16,
            childAspectRatio: 3 / 4,
          ),
          itemBuilder: (context, index) {
            final item = items[index];
            return GestureDetector(
              onTap: () {
               
              },
              child: Container(
                decoration: BoxDecoration(
                  color: item['color'],
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      item['title'],
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      '${item['count']} ${item['title']}',
                      style: const TextStyle(fontSize: 14, color: Colors.black54),
                    ),
                    const SizedBox(height: 16),
                    Expanded(
                      child: Image.asset(
                        item['imagePath'],
                        fit: BoxFit.contain,
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
      floatingActionButton: Align(
        alignment: Alignment.bottomCenter,
        child: Padding(
          padding: const EdgeInsets.only(bottom: 16),
          child: FloatingActionButton(
            backgroundColor: Colors.black,
            onPressed: () async {
              
            },
            child: const Icon(Icons.add, size: 32, color: Colors.white),
          ),
        ),
      ),
    );
  }
}


