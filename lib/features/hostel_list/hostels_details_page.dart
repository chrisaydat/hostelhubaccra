import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class HostelDetailsPage extends StatelessWidget {
  final String title;
  final String subTitle;
  final String imageUrl;
  final String price;

  HostelDetailsPage({
    required this.title,
    required this.subTitle,
    required this.imageUrl,
    required this.price,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Text('Hostel Details'),
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.network(
              imageUrl,
              height: 200,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
            SizedBox(height: 20),
            Text(
              title,
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            Text(
              subTitle,
              style: TextStyle(fontSize: 16),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 20),
            Text(
              price,
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.star, color: Colors.yellow),
                SizedBox(width: 5),
                Text(
                  '4.5',
                  style: TextStyle(fontSize: 18),
                ),
              ],
            ),
            SizedBox(height: 20),
            // Adding the centered Contact button
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Center(
                child: SlideAnimation(
                  onPressed: () {
                    _launchURL('tel:+233208566659');
                  },
                  icon: Icons.contact_phone_sharp,
                  iconSize: 30,
                  height: 40,
                  color: const Color(0xffE7E7E9),
                  slideColor: Colors.black,
                  slideDuration: const Duration(milliseconds: 1000),
                  completedAnimation: const Duration(milliseconds: 2000),
                  content: const Text(
                    'Contact',
                    style: TextStyle(
                      fontSize: 20,
                      color: Colors.black87,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _launchURL(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }
}

class SlideAnimation extends StatefulWidget {
  const SlideAnimation({
    required this.onPressed,
    this.height = 40,
    this.width = 300,
    this.content = const Text(
      'Add to bag',
      style: TextStyle(color: Colors.white, fontSize: 16),
    ),
    this.color = Colors.purpleAccent,
    this.slideColor = Colors.purple,
    this.iconSize = 24,
    this.icon = Icons.check_circle_outline_rounded,
    this.slideDuration = const Duration(milliseconds: 200),
    this.completedAnimation = const Duration(milliseconds: 500),
    this.borderRadius = 5,
    Key? key,
  }) : super(key: key);

  final double height;
  final double width;
  final Color color;
  final Color slideColor;
  final double iconSize;
  final Widget content;
  final IconData icon;
  final Duration slideDuration;
  final Duration completedAnimation;
  final double borderRadius;
  final void Function() onPressed;

  @override
  State<SlideAnimation> createState() => _SlideAnimationState();
}

class _SlideAnimationState extends State<SlideAnimation> {
  bool isPressed = false;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: GestureDetector(
        onTap: () {
          setState(() {
            isPressed = true;
            widget.onPressed();
          });
        },
        child: Stack(
          children: [
            Container(
              decoration: BoxDecoration(
                color: widget.color,
                borderRadius: BorderRadius.all(
                  Radius.circular(widget.borderRadius),
                ),
              ),
              height: widget.height,
              width: widget.width,
              child: Center(
                child: widget.content,
              ),
            ),
            AnimatedContainer(
              duration: widget.slideDuration,
              decoration: BoxDecoration(
                color: widget.slideColor,
                borderRadius: BorderRadius.all(
                  Radius.circular(widget.borderRadius),
                ),
              ),
              width: isPressed ? widget.width : 0,
              height: widget.height,
            ),
            AnimatedPositioned(
              duration: widget.completedAnimation,
              top: isPressed
                  ? (widget.height / 2) - (widget.iconSize / 2)
                  : widget.height,
              left: (widget.width / 2) - (widget.iconSize / 2),
              curve: Curves.bounceOut,
              child: isPressed
                  ? Icon(
                      widget.icon,
                      color: Colors.white,
                      size: widget.iconSize,
                    )
                  : const SizedBox(),
            ),
          ],
        ),
      ),
    );
  }
}