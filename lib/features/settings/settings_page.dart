// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

const double kHorizontalPadding = 24.0; // used for default side whitespace

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

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
                      _buildListTile(
                        titleText: 'Account',
                        leadingIconData: Icons.account_circle_outlined,
                        onTap: () {},
                      ),
                      _buildListTile(
                        titleText: 'Notifications',
                        leadingIconData: Icons.notifications_outlined,
                        onTap: () {},
                      ),
                      _buildListTile(
                        titleText: 'Security',
                        leadingIconData: Icons.lock_outline,
                        onTap: () {},
                      ),
                      _buildListTile(
                        titleText: 'Appearance',
                        leadingIconData: Icons.visibility_outlined,
                        onTap: () {},
                      ),
                      _buildListTile(
                        titleText: 'Logout',
                        leadingIconData: Icons.logout,
                        includeTrailingIcon: false,
                        color: Colors.red,
                        onTap: () {
                          //Todo: Logout of auth here
                        },
                      ),
                      _buildSectionTitle(title: 'FEEDBACK'),
                      _buildListTile(
                          titleText: 'Report a bug',
                          leadingIconData: Icons.warning_amber_outlined,
                          onTap: () {}),
                      _buildListTile(
                        titleText: 'Send feedback',
                        leadingIconData: Icons.send_outlined,
                        onTap: () {},
                      ),
                      _buildSectionTitle(title: 'INFO'),
                      _buildListTile(
                        titleText: 'About',
                        leadingIconData: Icons.help_outline,
                        onTap: () {},
                      ),
                      _buildListTile(
                        titleText: 'Get support',
                        leadingIconData: Icons.contact_support_outlined,
                        onTap: () {},
                      ),
                      const SizedBox(height: 24),
                      Center(
                        child: Text(
                          'VERSION 1.0.0',
                          style: Theme.of(context).textTheme.labelSmall,
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
          IconData? leadingIconData,
          required Function onTap,
          Color color = Colors.black,
          bool includeTrailingIcon = true}) =>
      Column(
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
            onTap: onTap as void Function(),
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