// ignore_for_file: prefer_const_constructors, use_super_parameters, prefer_const_constructors_in_immutables

import 'package:flutter/material.dart';
import 'package:hostelhubaccra/components/hostellist/hostel_list_tile.dart';

class HostelsList extends StatelessWidget {
  HostelsList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0.5,
          title: Text('Hostels'), // Title for the app bar
          leading: IconButton(
            icon: Icon(Icons.arrow_back), // Back button icon
            onPressed: () {
              Navigator.of(context).pop(); // Navigate back to previous route
            },
          ),
          actions: [
            IconButton(
              icon: Icon(Icons.search), // Search button
              onPressed: () {
                // Implement search functionality here
              },
            ),
          ],
        ),
        body: ListView(
          children: [
            HostelListTile(
              title: 'Max Hostel',
              subTitle: 'Premuim Hostel just 5 mins away from GIMPA',
              imageUrl: 'https://cf.bstatic.com/xdata/images/hotel/max1024x768/187385130.jpg?k=4935f6b9d6f63e9a003d7ac7283dc6fe390bd49ec1194bc88dddfd7985445d01&o=&hp=1', 
            ),
            HostelListTile(
              title: 'K Hostel',
              subTitle: 'Hostel 7 Mins away from GIMPA with AC',
              imageUrl: 'https://lh3.googleusercontent.com/p/AF1QipOVT3dF81u6AU-diDOF5GrnxkX24i3qd3gDRxQ8=s680-w680-h510', 
            ),
             HostelListTile(
              title: 'Kings Court Hostel',
              subTitle: 'Hostel 1 Minute away from GIMPA with AC and Washing Service',
              imageUrl: 'https://lh3.googleusercontent.com/p/AF1QipOxrEgYe6OvTRYlcmvRlb-BymV85ghj3DudSysX=s680-w680-h510', 
            ),
            HostelListTile(
              title: 'Crystal Hostel',
              subTitle: 'If you are looking for a low budget hostel, Crystal Hostel is a cool place to stay. The serene environment makes every stay memorable',
              imageUrl: 'https://lh3.googleusercontent.com/p/AF1QipMg5UPPmEHCpF_WRSrrVgVKKlik6oKNtg9QAkJX=s680-w680-h510', 
            ),
            HostelListTile(
  title: 'Graduate Hills Hostel',
  subTitle: 'Conveniently located near the university campus with Shuttle Service',
  imageUrl: 'https://lh5.googleusercontent.com/p/AF1QipNlI3yAh6sOrtDb4L0InZXA62tKBT3l6ipL0LHR=w260-h175-n-k-no', 
),
HostelListTile(
  title: 'Goodwill Plaza Hostel',
  subTitle: 'Affordable accommodation with basic amenities',
  imageUrl: 'https://lh3.googleusercontent.com/p/AF1QipPHTuS50f4LdFUaniTeoLd4k2jm00gES-AgJl5h=s680-w680-h510', 
),
HostelListTile(
  title: 'JBK Hostels',
  subTitle: 'Comfortable rooms with Wi-Fi and laundry service',
  imageUrl: 'https://lh3.googleusercontent.com/gps-proxy/ALd4DhFlgpLIKnwWkUKbeo99aVVSSdI-Ouq-B_GBaj46I401v0LC9xaLqQcm7C3RrjtsnTt4gRN_iZ2PQi2vh7TGDJJUqRWcpXijoxINeB-cornxZNw17xCrXJNItwZ46kajBSeDNhEhplIGfbcnTL7fX0acFbWfBdlZafZ4V0KOHcVPlKz1uH-CaMsK=w287-h192-n-k-no-v1-rj', 
),
HostelListTile(
  title: 'JD Hostels',
  subTitle: 'Close proximity to shopping malls and restaurants',
  imageUrl: 'https://pictures-ghana.jijistatic.net/38082557_OTU4LTEyODAtOWM5M2Y0ZjBiNA.webp', 
),
HostelListTile(
  title: 'KyeKyeKu Hostel',
  subTitle: 'Quiet environment for focused studying',
  imageUrl: 'https://streetviewpixels-pa.googleapis.com/v1/thumbnail?panoid=y0CoohnLj5LZ3aqGmOO5nw&cb_client=search.gws-prod.gps&yaw=135.89828&pitch=0&thumbfov=100&w=173&h=175', 
),
HostelListTile(
  title: 'Friendly Hostel',
  subTitle: 'Modern facilities including gym and swimming pool',
  imageUrl: 'https://lh3.googleusercontent.com/p/AF1QipOSUeYNtoo5FheA8ePFWhfCbQMpPpoH53BLGMip=s680-w680-h510', 
),
HostelListTile(
  title: 'Haven Hostel',
  subTitle: 'Spacious rooms with scenic views',
  imageUrl: 'https://lh3.googleusercontent.com/p/AF1QipMZ5P8bISZA8nbLzv3bo4-pv5W9WAX2fIALWzGE=s680-w680-h510', 
),
HostelListTile(
  title: 'Step up hostel',
  subTitle: '24/7 security for peace of mind',
  imageUrl: 'https://lh3.googleusercontent.com/p/AF1QipNqecy2pVVpy-vfsfXAHj7uiRrSO4obvofhRoRC=s680-w680-h510', 
),
HostelListTile(
  title: 'JBK Hostels Jungle Road',
  subTitle: 'Variety of room options to suit different needs',
  imageUrl: 'https://lh5.googleusercontent.com/p/AF1QipNrHcPu4qZJoi7bOw9vZKbtSjJJ1Lw0QYwTYBSS=w260-h175-n-k-no', 
),
HostelListTile(
  title: 'Lovelies Hostel',
  subTitle: 'Social events and activities for residents',
  imageUrl: 'https://lh3.googleusercontent.com/p/AF1QipOe07uTMO8YygXn3Gl0TyH3wXXG46alUfNW6qVY=s680-w680-h510', 
),
HostelListTile(
  title: 'Pentagon',
  subTitle: 'Hostel in The University of Ghana Campus ',
  imageUrl: 'https://getrooms.co/wp-content/uploads/2022/10/pentagon-hostel-scaled-1.jpg', 
),
HostelListTile(
  title: 'Aseda Hostel',
  subTitle: 'Fully furnished rooms for a hassle-free stay',
  imageUrl: 'https://getrooms.co/wp-content/uploads/2022/10/aseda-hostel-scaled-1.jpg', 
),
HostelListTile(
  title: 'West End Hostel',
  subTitle: 'Close to public transportation for easy commuting',
  imageUrl: 'https://getrooms.co/wp-content/uploads/2022/10/Westend-hostel-upsa.jpeg', 
),
HostelListTile(
  title: 'Chika House Hostel',
  subTitle: 'Homely atmosphere with friendly staff',
  imageUrl: 'https://getrooms.co/wp-content/uploads/2022/10/chika-hostel-1024x768-1.jpg', 
),
HostelListTile(
  title: 'Perry Hostel',
  subTitle: 'On-site cafeteria serving delicious meals',
  imageUrl: 'https://getrooms.co/wp-content/uploads/2022/10/perry-hostel.jpg', 
),
HostelListTile(
  title: 'Tesano Palace Hostel',
  subTitle: 'Dedicated study areas for academic excellence',
  imageUrl: 'https://getrooms.co/wp-content/uploads/2022/10/tesano-palace-hostel.jpg', 
),
          ],
        ),
      ),
    );
  }
}
