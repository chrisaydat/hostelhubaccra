// ignore_for_file: prefer_const_constructors, avoid_print
import 'package:flutter/material.dart';
import 'package:hostelhubaccra/components/hostellist/hostel_list_tile.dart';
import 'package:hostelhubaccra/features/hostel_list/hostels_details_page.dart';

class HostelsList extends StatelessWidget {
  const HostelsList({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
          GestureDetector(
            onTap: () {
              print('Tapped on Max Hostel');
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => HostelDetailsPage(
                    title: 'Max Hostel',
                    subTitle: 'Premuim Hostel just 5 mins away from GIMPA',
                    imageUrl: 'https://cf.bstatic.com/xdata/images/hotel/max1024x768/187385130.jpg?k=4935f6b9d6f63e9a003d7ac7283dc6fe390bd49ec1194bc88dddfd7985445d01&o=&hp=1',
                  ),
                ),
              );
            },
            child: HostelListTile(
              title: 'Max Hostel',
              subTitle: 'Premuim Hostel just 5 mins away from GIMPA',
              imageUrl: 'https://cf.bstatic.com/xdata/images/hotel/max1024x768/187385130.jpg?k=4935f6b9d6f63e9a003d7ac7283dc6fe390bd49ec1194bc88dddfd7985445d01&o=&hp=1', onTap: () {  },
            ),
          ),
          GestureDetector(
  onTap: () {
    print('Tapped on K Hostel');
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => HostelDetailsPage(
          title: 'K Hostel',
          subTitle: 'Hostel 7 Mins away from GIMPA with AC',
          imageUrl: 'https://lh3.googleusercontent.com/p/AF1QipOVT3dF81u6AU-diDOF5GrnxkX24i3qd3gDRxQ8=s680-w680-h510',
        ),
      ),
    );
  },
  child: HostelListTile(
    title: 'K Hostel',
    subTitle: 'Hostel 7 Mins away from GIMPA with AC',
    imageUrl: 'https://lh3.googleusercontent.com/p/AF1QipOVT3dF81u6AU-diDOF5GrnxkX24i3qd3gDRxQ8=s680-w680-h510',
    onTap: () {},
  ),
),
GestureDetector(
  onTap: () {
    print('Tapped on Kings Court Hostel');
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => HostelDetailsPage(
          title: 'Kings Court Hostel',
          subTitle: 'Hostel 1 Minute away from GIMPA with AC and Washing Service',
          imageUrl: 'https://lh3.googleusercontent.com/p/AF1QipOxrEgYe6OvTRYlcmvRlb-BymV85ghj3DudSysX=s680-w680-h510',
        ),
      ),
    );
  },
  child: HostelListTile(
    title: 'Kings Court Hostel',
    subTitle: 'Hostel 1 Minute away from GIMPA with AC and Washing Service',
    imageUrl: 'https://lh3.googleusercontent.com/p/AF1QipOxrEgYe6OvTRYlcmvRlb-BymV85ghj3DudSysX=s680-w680-h510',
    onTap: () {},
  ),
),
GestureDetector(
  onTap: () {
    print('Tapped on Crystal Hostel');
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => HostelDetailsPage(
          title: 'Crystal Hostel',
          subTitle: 'If you are looking for a low budget hostel, Crystal Hostel is a cool place to stay. The serene environment makes every stay memorable',
          imageUrl: 'https://lh3.googleusercontent.com/p/AF1QipMg5UPPmEHCpF_WRSrrVgVKKlik6oKNtg9QAkJX=s680-w680-h510',
        ),
      ),
    );
  },
  child: HostelListTile(
    title: 'Crystal Hostel',
    subTitle: 'If you are looking for a low budget hostel, Crystal Hostel is a cool place to stay. The serene environment makes every stay memorable',
    imageUrl: 'https://lh3.googleusercontent.com/p/AF1QipMg5UPPmEHCpF_WRSrrVgVKKlik6oKNtg9QAkJX=s680-w680-h510',
    onTap: () {},
  ),
),
GestureDetector(
  onTap: () {
    print('Tapped on Graduate Hills Hostel');
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => HostelDetailsPage(
          title: 'Graduate Hills Hostel',
          subTitle: 'Conveniently located near the university campus with Shuttle Service',
          imageUrl: 'https://lh5.googleusercontent.com/p/AF1QipNlI3yAh6sOrtDb4L0InZXA62tKBT3l6ipL0LHR=w260-h175-n-k-no',
        ),
      ),
    );
  },
  child: HostelListTile(
    title: 'Graduate Hills Hostel',
    subTitle: 'Conveniently located near the university campus with Shuttle Service',
    imageUrl: 'https://lh5.googleusercontent.com/p/AF1QipNlI3yAh6sOrtDb4L0InZXA62tKBT3l6ipL0LHR=w260-h175-n-k-no',
    onTap: () {},
  ),
),
GestureDetector(
  onTap: () {
    print('Tapped on Goodwill Plaza Hostel');
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => HostelDetailsPage(
          title: 'Goodwill Plaza Hostel',
          subTitle: 'Affordable accommodation with basic amenities',
          imageUrl: 'https://lh3.googleusercontent.com/p/AF1QipPHTuS50f4LdFUaniTeoLd4k2jm00gES-AgJl5h=s680-w680-h510',
        ),
      ),
    );
  },
  child: HostelListTile(
    title: 'Goodwill Plaza Hostel',
    subTitle: 'Affordable accommodation with basic amenities',
    imageUrl: 'https://lh3.googleusercontent.com/p/AF1QipPHTuS50f4LdFUaniTeoLd4k2jm00gES-AgJl5h=s680-w680-h510',
    onTap: () {},
  ),
),
GestureDetector(
  onTap: () {
    print('Tapped on JBK Hostels');
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => HostelDetailsPage(
          title: 'JBK Hostels',
          subTitle: 'Comfortable rooms with Wi-Fi and laundry service',
          imageUrl: 'https://lh3.googleusercontent.com/gps-proxy/ALd4DhFlgpLIKnwWkUKbeo99aVVSSdI-Ouq-B_GBaj46I401v0LC9xaLqQcm7C3RrjtsnTt4gRN_iZ2PQi2vh7TGDJJUqRWcpXijoxINeB-cornxZNw17xCrXJNItwZ46kajBSeDNhEhplIGfbcnTL7fX0acFbWfBdlZafZ4V0KOHcVPlKz1uH-CaMsK=w287-h192-n-k-no-v1-rj',
        ),
      ),
    );
  },
  child: HostelListTile(
    title: 'JBK Hostels',
    subTitle: 'Comfortable rooms with Wi-Fi and laundry service',
    imageUrl: 'https://lh3.googleusercontent.com/gps-proxy/ALd4DhFlgpLIKnwWkUKbeo99aVVSSdI-Ouq-B_GBaj46I401v0LC9xaLqQcm7C3RrjtsnTt4gRN_iZ2PQi2vh7TGDJJUqRWcpXijoxINeB-cornxZNw17xCrXJNItwZ46kajBSeDNhEhplIGfbcnTL7fX0acFbWfBdlZafZ4V0KOHcVPlKz1uH-CaMsK=w287-h192-n-k-no-v1-rj',
    onTap: () {},
  ),
),
GestureDetector(
  onTap: () {
    print('Tapped on JD Hostels');
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => HostelDetailsPage(
          title: 'JD Hostels',
          subTitle: 'Close proximity to shopping malls and restaurants',
          imageUrl: 'https://pictures-ghana.jijistatic.net/38082557_OTU4LTEyODAtOWM5M2Y0ZjBiNA.webp',
        ),
      ),
    );
  },
  child: HostelListTile(
    title: 'JD Hostels',
    subTitle: 'Close proximity to shopping malls and restaurants',
    imageUrl: 'https://pictures-ghana.jijistatic.net/38082557_OTU4LTEyODAtOWM5M2Y0ZjBiNA.webp',
    onTap: () {},
  ),
),
GestureDetector(
  onTap: () {
    print('Tapped on KyeKyeKu Hostel');
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => HostelDetailsPage(
          title: 'KyeKyeKu Hostel',
          subTitle: 'Quiet environment for focused studying',
          imageUrl: 'https://streetviewpixels-pa.googleapis.com/v1/thumbnail?panoid=y0CoohnLj5LZ3aqGmOO5nw&cb_client=search.gws-prod.gps&yaw=135.89828&pitch=0&thumbfov=100&w=173&h=175',
        ),
      ),
    );
  },
  child: HostelListTile(
    title: 'KyeKyeKu Hostel',
    subTitle: 'Quiet environment for focused studying',
    imageUrl: 'https://streetviewpixels-pa.googleapis.com/v1/thumbnail?panoid=y0CoohnLj5LZ3aqGmOO5nw&cb_client=search.gws-prod.gps&yaw=135.89828&pitch=0&thumbfov=100&w=173&h=175',
    onTap: () {},
  ),
),
GestureDetector(
  onTap: () {
    print('Tapped on Friendly Hostel');
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => HostelDetailsPage(
          title: 'Friendly Hostel',
          subTitle: 'Modern facilities including gym and swimming pool',
          imageUrl: 'https://lh3.googleusercontent.com/p/AF1QipOSUeYNtoo5FheA8ePFWhfCbQMpPpoH53BLGMip=s680-w680-h510',
        ),
      ),
    );
  },
  child: HostelListTile(
    title: 'Friendly Hostel',
    subTitle: 'Modern facilities including gym and swimming pool',
    imageUrl: 'https://lh3.googleusercontent.com/p/AF1QipOSUeYNtoo5FheA8ePFWhfCbQMpPpoH53BLGMip=s680-w680-h510',
    onTap: () {},
  ),
),
GestureDetector(
  onTap: () {
    print('Tapped on Haven Hostel');
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => HostelDetailsPage(
          title: 'Haven Hostel',
          subTitle: 'Spacious rooms with scenic views',
          imageUrl: 'https://lh3.googleusercontent.com/p/AF1QipMZ5P8bISZA8nbLzv3bo4-pv5W9WAX2fIALWzGE=s680-w680-h510',
        ),
      ),
    );
  },
  child: HostelListTile(
    title: 'Haven Hostel',
    subTitle: 'Spacious rooms with scenic views',
    imageUrl: 'https://lh3.googleusercontent.com/p/AF1QipMZ5P8bISZA8nbLzv3bo4-pv5W9WAX2fIALWzGE=s680-w680-h510',
    onTap: () {},
  ),
),
GestureDetector(
  onTap: () {
    print('Tapped on Step up hostel');
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => HostelDetailsPage(
          title: 'Step up hostel',
          subTitle: '24/7 security for peace of mind',
          imageUrl: 'https://lh3.googleusercontent.com/p/AF1QipNqecy2pVVpy-vfsfXAHj7uiRrSO4obvofhRoRC=s680-w680-h510',
        ),
      ),
    );
  },
  child: HostelListTile(
    title: 'Step up hostel',
    subTitle: '24/7 security for peace of mind',
    imageUrl: 'https://lh3.googleusercontent.com/p/AF1QipNqecy2pVVpy-vfsfXAHj7uiRrSO4obvofhRoRC=s680-w680-h510',
    onTap: () {},
  ),
),
GestureDetector(
  onTap: () {
    print('Tapped on JBK Hostels Jungle Road');
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => HostelDetailsPage(
          title: 'JBK Hostels Jungle Road',
          subTitle: 'Variety of room options to suit different needs',
          imageUrl: 'https://lh5.googleusercontent.com/p/AF1QipNrHcPu4qZJoi7bOw9vZKbtSjJJ1Lw0QYwTYBSS=w260-h175-n-k-no',
        ),
      ),
    );
  },
  child: HostelListTile(
    title: 'JBK Hostels Jungle Road',
    subTitle: 'Variety of room options to suit different needs',
    imageUrl: 'https://lh5.googleusercontent.com/p/AF1QipNrHcPu4qZJoi7bOw9vZKbtSjJJ1Lw0QYwTYBSS=w260-h175-n-k-no',
    onTap: () {},
  ),
),
GestureDetector(
  onTap: () {
    print('Tapped on Lovelies Hostel');
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => HostelDetailsPage(
          title: 'Lovelies Hostel',
          subTitle: 'Social events and activities for residents',
          imageUrl: 'https://lh3.googleusercontent.com/p/AF1QipOe07uTMO8YygXn3Gl0TyH3wXXG46alUfNW6qVY=s680-w680-h510',
        ),
      ),
    );
  },
  child: HostelListTile(
    title: 'Lovelies Hostel',
    subTitle: 'Social events and activities for residents',
    imageUrl: 'https://lh3.googleusercontent.com/p/AF1QipOe07uTMO8YygXn3Gl0TyH3wXXG46alUfNW6qVY=s680-w680-h510',
    onTap: () {},
  ),
),
GestureDetector(
  onTap: () {
    print('Tapped on Pentagon');
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => HostelDetailsPage(
          title: 'Pentagon',
          subTitle: 'Hostel in The University of Ghana Campus',
          imageUrl: 'https://getrooms.co/wp-content/uploads/2022/10/pentagon-hostel-scaled-1.jpg',
        ),
      ),
    );
  },
  child: HostelListTile(
    title: 'Pentagon',
    subTitle: 'Hostel in The University of Ghana Campus',
    imageUrl: 'https://getrooms.co/wp-content/uploads/2022/10/pentagon-hostel-scaled-1.jpg',
    onTap: () {},
  ),
),
GestureDetector(
  onTap: () {
    print('Tapped on Aseda Hostel');
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => HostelDetailsPage(
          title: 'Aseda Hostel',
          subTitle: 'Fully furnished rooms for a hassle-free stay',
          imageUrl: 'https://getrooms.co/wp-content/uploads/2022/10/aseda-hostel-scaled-1.jpg',
        ),
      ),
    );
  },
  child: HostelListTile(
    title: 'Aseda Hostel',
    subTitle: 'Fully furnished rooms for a hassle-free stay',
    imageUrl: 'https://getrooms.co/wp-content/uploads/2022/10/aseda-hostel-scaled-1.jpg',
    onTap: () {},
  ),
),
GestureDetector(
  onTap: () {
    print('Tapped on West End Hostel');
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => HostelDetailsPage(
          title: 'West End Hostel',
          subTitle: 'Close to public transportation for easy commuting',
          imageUrl: 'https://getrooms.co/wp-content/uploads/2022/10/Westend-hostel-upsa.jpeg',
        ),
      ),
    );
  },
  child: HostelListTile(
    title: 'West End Hostel',
    subTitle: 'Close to public transportation for easy commuting',
    imageUrl: 'https://getrooms.co/wp-content/uploads/2022/10/Westend-hostel-upsa.jpeg',
    onTap: () {},
  ),
),
GestureDetector(
  onTap: () {
    print('Tapped on Chika House Hostel');
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => HostelDetailsPage(
          title: 'Chika House Hostel',
          subTitle: 'Homely atmosphere with friendly staff',
          imageUrl: 'https://getrooms.co/wp-content/uploads/2022/10/chika-hostel-1024x768-1.jpg',
        ),
      ),
    );
  },
  child: HostelListTile(
    title: 'Chika House Hostel',
    subTitle: 'Homely atmosphere with friendly staff',
    imageUrl: 'https://getrooms.co/wp-content/uploads/2022/10/chika-hostel-1024x768-1.jpg',
    onTap: () {},
  ),
),
GestureDetector(
  onTap: () {
    print('Tapped on Perry Hostel');
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => HostelDetailsPage(
          title: 'Perry Hostel',
          subTitle: 'On-site cafeteria serving delicious meals',
          imageUrl: 'https://getrooms.co/wp-content/uploads/2022/10/perry-hostel.jpg',
        ),
      ),
    );
  },
  child: HostelListTile(
    title: 'Perry Hostel',
    subTitle: 'On-site cafeteria serving delicious meals',
    imageUrl: 'https://getrooms.co/wp-content/uploads/2022/10/perry-hostel.jpg',
    onTap: () {},
  ),
),
GestureDetector(
  onTap: () {
    print('Tapped on Tesano Palace Hostel');
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => HostelDetailsPage(
          title: 'Tesano Palace Hostel',
          subTitle: 'Dedicated study areas for academic excellence',
          imageUrl: 'https://getrooms.co/wp-content/uploads/2022/10/tesano-palace-hostel.jpg',
        ),
      ),
    );
  },
  child: HostelListTile(
    title: 'Tesano Palace Hostel',
    subTitle: 'Dedicated study areas for academic excellence',
    imageUrl: 'https://getrooms.co/wp-content/uploads/2022/10/tesano-palace-hostel.jpg',
    onTap: () {},
  ),
),
        ],
      ),
    );
  }
}