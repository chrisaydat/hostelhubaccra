// ignore_for_file: prefer_const_constructors, use_build_context_synchronously, avoid_print, unused_local_variable

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:hostelhubaccra/features/notifications/notifications_page.dart';
import 'package:hostelhubaccra/features/settings/profile_settings.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:hostelhubaccra/main.dart';

const double kHorizontalPadding = 24.0; // used for default side whitespace

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({Key? key});

  @override
  Widget build(BuildContext context) {
    const double toolbarHeight = kToolbarHeight + 100;

    return Theme(
      data: Theme.of(context).copyWith(
        primaryColor: Colors.blue[100],
      ),
      child: Scaffold(
        backgroundColor: Colors.white,
        body: CustomScrollView(
          slivers: [
            SliverAppBar(
              backgroundColor: Colors.white,
              elevation: 1.5,
              titleSpacing: kHorizontalPadding,
              title: Column(
                children: const [
                  SizedBox(height: toolbarHeight / 3),
                  Text(
                    'Settings',
                    style: TextStyle(
                      fontSize: 32,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                ],
              ),
              centerTitle: false,
              toolbarHeight: toolbarHeight,
            ),
            SliverList(
              delegate: SliverChildListDelegate([
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: kHorizontalPadding,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      _buildSectionTitle(title: 'GENERAL'),
                      // _buildListTile(
                      //   titleText: 'Account',
                      //   leadingIconData: Icons.account_circle_outlined,
                      //   onTap: () {
                      //     Navigator.push(
                      //       context,
                      //       MaterialPageRoute(builder: (context) => ProfileSettings()),
                      //     );
                      //   },
                      // ),
                      // _buildListTile(
                      //   titleText: 'Notifications',
                      //   leadingIconData: Icons.notifications_outlined,
                      //   onTap: () {
                      //     Navigator.push(
                      //       context,
                      //       MaterialPageRoute(builder: (context) => NotificationsPage()),
                      //     );
                      //   },
                      // ),
                      // _buildListTile(
                      //   titleText: 'Security',
                      //   leadingIconData: Icons.lock_outline,
                      //   onTap: () {},
                      // ),
                      // _buildListTile(
                      //   titleText: 'Appearance',
                      //   leadingIconData: Icons.visibility_outlined,
                      //   onTap: () {},
                      // ),
                      _buildListTile(
                        titleText: 'Logout',
                        leadingIconData: Icons.logout,
                        includeTrailingIcon: false,
                        color: Colors.red,
                        onTap: () async {
                          try {
                            await FirebaseAuth.instance.signOut();
                            Navigator.of(context).pushReplacementNamed('/login');
                          } catch (e) {
                            // Handle errors if any
                            print('Error signing out: $e');
                          }
                        },
                      ),
                      _buildSectionTitle(title: 'FEEDBACK'),
                      _buildListTile(
                        titleText: 'Report a bug',
                        leadingIconData: Icons.warning_amber_outlined,
                        onTap: () {
                          _showFeedbackForm(context, 'Report a Bug');
                        },
                      ),
                      _buildListTile(
                        titleText: 'Send feedback',
                        leadingIconData: Icons.send_outlined,
                        onTap: () {
                          _showFeedbackForm(context, 'Send Feedback');
                        },
                      ),
                      _buildSectionTitle(title: 'INFO'),
                      // _buildListTile(
                      //   titleText: 'About',
                      //   leadingIconData: Icons.help_outline,
                      //   onTap: () {},
                      // ),
                      _buildListTile(
                        titleText: 'Get support',
                        leadingIconData: Icons.contact_support_outlined,
                        onTap: () {
                          _showSupportForm(context);
                        },
                      ),
                      const SizedBox(height: 24),
                      Center(
                        child: Text(
                          'VERSION 1.0.0',
                          style: Theme.of(context).textTheme.bodySmall,
                        ),
                      ),
                      const SizedBox(height: 48),
                    ],
                  ),
                )
              ]),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSectionTitle({required String title}) {
    return Column(
      children: [
        const SizedBox(height: 32),
        Text(
          title,
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w600,
            color: Colors.grey[800],
            letterSpacing: .5,
          ),
        ),
        const SizedBox(height: 16),
      ],
    );
  }

  Widget _buildListTile(
      {required String titleText,
      required IconData leadingIconData,
      required Function onTap,
      Color color = Colors.black,
      bool includeTrailingIcon = true}) {
    return Column(
      children: [
        ListTile(
          contentPadding: EdgeInsets.zero,
          leading: Icon(
            leadingIconData,
            color: color,
            size: 28,
          ),
          title: Text(
            titleText,
            style: TextStyle(
              color: color,
              fontSize: 18,
            ),
          ),
          onTap: () => onTap(),
          trailing: includeTrailingIcon
              ? const Icon(
                  Icons.chevron_right,
                  size: 28,
                )
              : null,
        ),
        const Divider(),
      ],
    );
  }
}

void _showFeedbackForm(BuildContext context, String title) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      final TextEditingController _feedbackController = TextEditingController();

      return AlertDialog(
        title: Text(title),
        content: TextField(
          controller: _feedbackController,
          decoration: InputDecoration(
            hintText: 'Enter your feedback...',
          ),
          maxLines: 5,
        ),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            child: Text('Cancel'),
          ),
          ElevatedButton(
            onPressed: () {
              String feedback = _feedbackController.text;
              // TODO: Implement sending feedback to server or perform any other action
              Navigator.of(context).pop();
              Fluttertoast.showToast(
                msg: 'Thank you for your feedback! It is much appreciated.',
                toastLength: Toast.LENGTH_LONG,
                gravity: ToastGravity.BOTTOM,
                timeInSecForIosWeb: 2,
                backgroundColor: Colors.green,
                textColor: Colors.white,
                fontSize: 16.0,
              );
            },
            child: Text('Submit'),
          ),
        ],
      );
    },
  );
}

void _showSupportForm(BuildContext context) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      final TextEditingController _supportController = TextEditingController();

      return AlertDialog(
        title: Text('Get Support'),
        content: TextField(
          controller: _supportController,
          decoration: InputDecoration(
            hintText: 'Describe your issue or question...',
          ),
          maxLines: 5,
        ),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            child: Text('Cancel'),
          ),
          ElevatedButton(
            onPressed: () {
              String supportMessage = _supportController.text;
              // TODO: Implement sending support message to server or perform any other action
              Navigator.of(context).pop();
              Fluttertoast.showToast(
                msg: 'We have received your request. Our support team will reach out to you soon.',
                toastLength: Toast.LENGTH_LONG,
                gravity: ToastGravity.BOTTOM,
                timeInSecForIosWeb: 2,
                backgroundColor: Colors.blue,
                textColor: const Color.fromARGB(255, 122, 106, 106),
                fontSize: 16.0,
              );
            },
            child: Text('Submit'),
          ),
        ],
      );
    },
  );
}