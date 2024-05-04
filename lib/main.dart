import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  final List<Map<String, String>> imageList = [

    {'url': 'images/img_1.jpg', 'title': 'Mood'},
    {'url': 'images/img_4.jpg', 'title': 'Animals'},
    {'url': 'images/img_5.jpg', 'title': 'Nature'},
    {'url': 'images/img_6.jpg', 'title': 'Travel'},
    {'url': 'images/img_7.jpg', 'title': 'Food'},
    {'url': 'images/img_8.jpg', 'title': 'Fashion'},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Photo Gallery', style: TextStyle(color: Colors.white),),
        centerTitle: true,
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios),
          color: Colors.white,
          onPressed: () {

          },
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.more_vert), color: Colors.white,
            onPressed: () {

            },
          ),
        ],
        backgroundColor: Colors.green,
      ),
      body: GridView.builder(
        itemCount: imageList.length, // Number of images
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
        ),
        itemBuilder: (BuildContext context, int index) {

          return GestureDetector(
            onTap: () {

              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ImageDetailsScreen(
                    imageUrl: imageList[index]['url']!,
                    imageTitle: imageList[index]['title']!,
                    suggestedImages: imageList,
                  ),
                ),
              );
            },
            child: Container(
              margin: EdgeInsets.all(8),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.9),
                    spreadRadius: 4,
                    blurRadius: 10,
                    offset: Offset(0, 3),
                  ),
                ],
                color: Colors.grey[200],
              ),
              child: Stack(
                alignment: Alignment.center,
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(16),
                    child: Image.network(
                      imageList[index]['url']!,
                      fit: BoxFit.cover,
                    ),
                  ),
                  Positioned(
                    bottom: 8,
                    left: 8,
                    child: Text(
                      imageList[index]['title']!,
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ),
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

class ImageDetailsScreen extends StatelessWidget {
  final String imageUrl;
  final String imageTitle;
  final List<Map<String, String>> suggestedImages;

  ImageDetailsScreen({required this.imageUrl, required this.imageTitle, required this.suggestedImages});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(imageTitle, style: TextStyle(color: Colors.white),),
        centerTitle: true,
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios),
          color: Colors.white,
          onPressed: () {

            Navigator.pop(context);
          },
        ),
        backgroundColor: Colors.green,
      ),
      body: RotatedBox(
        quarterTurns: MediaQuery.of(context).orientation == Orientation.landscape ? 3 : 0,
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                width: double.infinity,
                child: Container(
                  margin: EdgeInsets.all(16),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(24),
                    child: Image.network(
                      imageUrl,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Image Description',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 8),
                    Text(
                      'Being in nature, or even viewing scenes of nature, reduces anger, fear, and stress and increases pleasant feelings',
                      style: TextStyle(fontSize: 16),
                    ),
                    SizedBox(height: 16),
                    ElevatedButton(
                      onPressed: () {

                      },
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all(Colors.green),
                      ),
                      child: Text('Read More', style: TextStyle(color: Colors.white),),
                    ),
                    SizedBox(height: 16),
                    Text(
                      'Suggestions',
                      style: TextStyle(
                        color: Colors.green,
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 8),

                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: List.generate(
                          suggestedImages.length,
                              (index) => GestureDetector(
                            onTap: () {

                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => ImageDetailsScreen(
                                    imageUrl: suggestedImages[index]['url']!,
                                    imageTitle: suggestedImages[index]['title']!,
                                    suggestedImages: suggestedImages,
                                  ),
                                ),
                              );
                            },
                            child: Container(
                              margin: EdgeInsets.symmetric(horizontal: 8),
                              child: Column(
                                children: [
                                  ClipRRect(
                                    borderRadius: BorderRadius.circular(12),
                                    child: Image.network(
                                      suggestedImages[index]['url']!,
                                      fit: BoxFit.cover,
                                      width: 180,
                                      height: 180,
                                    ),
                                  ),
                                  SizedBox(height: 10),
                                  Text(
                                    suggestedImages[index]['title']!,
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}



//
// {'url': 'images/img_1.jpg', 'title': 'Mood'},
// {'url': 'images/img_4.jpg', 'title': 'Animals'},
// {'url': 'images/img_5.jpg', 'title': 'Nature'},
// {'url': 'images/img_6.jpg', 'title': 'Travel'},
// {'url': 'images/img_7.jpg', 'title': 'Food'},
// {'url': 'images/img_8.jpg', 'title': 'Fashion'},


