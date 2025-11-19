import 'package:flutter/material.dart';

class LocationScreen extends StatefulWidget {
  const LocationScreen({super.key});

  @override
  State<LocationScreen> createState() => _LocationScreenState();
}

class _LocationScreenState extends State<LocationScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        leading: Icon(Icons.keyboard_arrow_left_sharp, size: 40),
        flexibleSpace: Container(decoration: BoxDecoration()),
        backgroundColor: Colors.transparent,
      ),
      body: Column(
        children: [
          Container(
            height: 300,
            width: double.infinity,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/images/sign_in_bg.png'),
                fit: BoxFit.cover,
              ),
            ),
            child: Image(image: AssetImage('assets/images/map_img.png')),
          ),
          SizedBox(height: 30),
          Text(
            'Select Your Location',
            style: TextStyle(
              fontSize: 26,
              fontWeight: FontWeight.w600,
              fontFamily: 'Gilory',
            ),
          ),
          SizedBox(height: 14),
          Text(
            'Swithch on your location to stay in tune with',
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w400,
              color: Color(0xFF7C7C7C),
            ),
          ),
          Text(
            'what’s happening in your area',
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w400,
              color: Color(0xFF7C7C7C),
            ),
          ),
          SizedBox(height: 300),
          Center(
            child: ElevatedButton(
              onPressed: () {
                // Navigator.push(
                //   context,
                //   MaterialPageRoute(builder: (context) => SigninScreen()),
                // );
              },
              style: ElevatedButton.styleFrom(
                fixedSize: Size(354, 67),
                backgroundColor: Color(0xFF53B175),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadiusGeometry.circular(16),
                ),
              ),
              child: Text(
                'Submit',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.normal,
                  fontFamily: 'Gilroy',
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
