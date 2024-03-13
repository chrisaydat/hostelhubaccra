// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

class ParallaxEffect extends StatefulWidget {
  const ParallaxEffect({Key? key}) : super(key: key);

  @override
  _ParallaxEffectState createState() => _ParallaxEffectState();
}

class _ParallaxEffectState extends State<ParallaxEffect> {
  late PageController _pageController;
  double _pageOffset = 0;

  @override
  void initState() {
    super.initState();
    _pageController = PageController(viewportFraction: 0.6);
    _pageController.addListener(_updatePageOffset);
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  void _updatePageOffset() {
    setState(() {
      _pageOffset = _pageController.page!;
    });
    debugPrint(_pageOffset.toString());
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 300,
      child: PageView.builder(
        controller: _pageController,
        itemCount: featuredHostels.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: Stack(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(30),
                  child: SizedBox(
                    height: 300,
                    child: Image.network(
                      featuredHostels[index].imageUrl,
                      fit: BoxFit.cover,
                      alignment: Alignment(-_pageOffset.abs() + index, 0),
                    ),
                  ),
                ),
                Positioned(
                  bottom: 20,
                  child: Padding(
                    padding: EdgeInsets.all(15),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          featuredHostels[index].name,
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 22,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: 5),
                        Text(
                          featuredHostels[index].description,
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                          ),
                        ),
                        SizedBox(height: 5),
                        Text(
                          'Location: ${featuredHostels[index].location}',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}

// Sample data structure for featured hostels
class Hostel {
  final String name;
  final String imageUrl;
  final String description;
  final String location;

  Hostel({
    required this.name,
    required this.imageUrl,
    required this.description,
    required this.location,
  });
}

List<Hostel> featuredHostels = [
  Hostel(
  name: 'Legon Hall Hostel',
  imageUrl: 'https://dynamic-media-cdn.tripadvisor.com/media/photo-o/08/d6/88/ea/photo0jpg.jpg?w=700&h=-1&s=1',
  description: 'Accommodation primarily for students, but may offer guest rooms for short-term stays.',
  location: 'University of Ghana, Legon, Accra',
),

Hostel(
  name: 'Max Hostel',
  imageUrl: 'https://cf.bstatic.com/xdata/images/hotel/max1024x768/187385130.jpg?k=4935f6b9d6f63e9a003d7ac7283dc6fe390bd49ec1194bc88dddfd7985445d01&o=&hp=1',
  description: 'Premuim Hostel just 5 mins away from GIMPA',
  location: 'Accra, Ghana',
),

Hostel(
  name: 'K Hostel',
  imageUrl: 'https://lh3.googleusercontent.com/p/AF1QipOVT3dF81u6AU-diDOF5GrnxkX24i3qd3gDRxQ8=s680-w680-h510',
  description: 'Hostel 7 Mins away from GIMPA with AC',
  location: 'Accra, Ghana',
),

Hostel(
  name: 'Kings Court Hostel',
  imageUrl: 'https://lh3.googleusercontent.com/p/AF1QipOxrEgYe6OvTRYlcmvRlb-BymV85ghj3DudSysX=s680-w680-h510',
  description: 'Hostel 1 Minute away from GIMPA with AC and Washing Service',
  location: 'Accra, Ghana',
),

Hostel(
  name: 'Crystal Hostel',
  imageUrl: 'https://lh3.googleusercontent.com/p/AF1QipMg5UPPmEHCpF_WRSrrVgVKKlik6oKNtg9QAkJX=s680-w680-h510',
  description: 'If you are looking for a low budget hostel, Crystal Hostel is a cool place to stay. The serene environment makes every stay memorable',
  location: 'Accra, Ghana',
),

Hostel(
  name: 'Graduate Hills Hostel',
  imageUrl: 'https://lh5.googleusercontent.com/p/AF1QipNlI3yAh6sOrtDb4L0InZXA62tKBT3l6ipL0LHR=w260-h175-n-k-no',
  description: 'Conveniently located near the university campus with Shuttle Service',
  location: 'Accra, Ghana',
),

Hostel(
  name: 'Goodwill Plaza Hostel',
  imageUrl: 'https://lh3.googleusercontent.com/p/AF1QipPHTuS50f4LdFUaniTeoLd4k2jm00gES-AgJl5h=s680-w680-h510',
  description: 'Affordable accommodation with basic amenities',
  location: 'Accra, Ghana',
),

Hostel(
  name: 'JBK Hostels',
  imageUrl: 'https://lh3.googleusercontent.com/gps-proxy/ALd4DhGOejujLvZDUtlEaZRyc0nqD5f1Z-RG9Hdf1uuL6w2pgaugWftC5tQL_DmbDwzXYXJs_LFzyLarGG8J_XuIVauvE4QIirwcWA1spTL7gFpo_q83VN5fkrgQxsp4GSwble0DwhyjoNvkIwyeU-xHKdz8zM69UU4dUsj6H9shRr_YXdkXPQnv2IxX=s680-w680-h510',
  description: 'Comfortable rooms with Wi-Fi and laundry service',
  location: 'Accra, Ghana',
),


Hostel(
  name: 'KyeKyeKu Hostel',
  imageUrl: 'https://streetviewpixels-pa.googleapis.com/v1/thumbnail?panoid=y0CoohnLj5LZ3aqGmOO5nw&cb_client=search.gws-prod.gps&yaw=135.89828&pitch=0&thumbfov=100&w=173&h=175',
  description: 'Quiet environment for focused studying',
  location: 'Accra, Ghana',
),

Hostel(
  name: 'Friendly Hostel',
  imageUrl: 'https://lh3.googleusercontent.com/p/AF1QipOSUeYNtoo5FheA8ePFWhfCbQMpPpoH53BLGMip=s680-w680-h510',
  description: 'Modern facilities including gym and swimming pool',
  location: 'Accra, Ghana',
),

Hostel(
  name: 'Haven Hostel',
  imageUrl: 'https://lh3.googleusercontent.com/p/AF1QipMZ5P8bISZA8nbLzv3bo4-pv5W9WAX2fIALWzGE=s680-w680-h510',
  description: 'Spacious rooms with scenic views',
  location: 'Accra, Ghana',
),

Hostel(
  name: 'Step up hostel',
  imageUrl: 'https://lh3.googleusercontent.com/p/AF1QipNqecy2pVVpy-vfsfXAHj7uiRrSO4obvofhRoRC=s680-w680-h510',
  description: '24/7 security for peace of mind',
  location: 'Accra, Ghana',
),

Hostel(
  name: 'JBK Hostels Jungle Road',
  imageUrl: 'https://lh5.googleusercontent.com/p/AF1QipNrHcPu4qZJoi7bOw9vZKbtSjJJ1Lw0QYwTYBSS=w260-h175-n-k-no',
  description: 'Variety of room options to suit different needs',
  location: 'Accra, Ghana',
),

Hostel(
  name: 'Lovelies Hostel',
  imageUrl: 'https://lh3.googleusercontent.com/p/AF1QipOe07uTMO8YygXn3Gl0TyH3wXXG46alUfNW6qVY=s680-w680-h510',
  description: 'Social events and activities for residents',
  location: 'Accra, Ghana',
),

Hostel(
  name: 'Pentagon',
  imageUrl: 'https://getrooms.co/wp-content/uploads/2022/10/pentagon-hostel-scaled-1.jpg',
  description: 'Hostel in The University of Ghana Campus',
 

 location: 'Accra, Ghana',
),

Hostel(
  name: 'Aseda Hostel',
  imageUrl: 'https://getrooms.co/wp-content/uploads/2022/10/aseda-hostel-scaled-1.jpg',
  description: 'Fully furnished rooms for a hassle-free stay',
  location: 'Accra, Ghana',
),

Hostel(
  name: 'West End Hostel',
  imageUrl: 'https://getrooms.co/wp-content/uploads/2022/10/Westend-hostel-upsa.jpeg',
  description: 'Close to public transportation for easy commuting',
  location: 'Accra, Ghana',
),

Hostel(
  name: 'Chika House Hostel',
  imageUrl: 'https://getrooms.co/wp-content/uploads/2022/10/chika-hostel-1024x768-1.jpg',
  description: 'Homely atmosphere with friendly staff',
  location: 'Accra, Ghana',
),

Hostel(
  name: 'Perry Hostel',
  imageUrl: 'https://getrooms.co/wp-content/uploads/2022/10/perry-hostel.jpg',
  description: 'On-site cafeteria serving delicious meals',
  location: 'Accra, Ghana',
),

Hostel(
  name: 'Tesano Palace Hostel',
  imageUrl: 'https://getrooms.co/wp-content/uploads/2022/10/tesano-palace-hostel.jpg',
  description: 'Dedicated study areas for academic excellence',
  location: 'Accra, Ghana',
),

];
