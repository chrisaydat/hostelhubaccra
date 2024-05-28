import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

const String avatarImageUrl =
    'https://images.unsplash.com/photo-1543610892-0b1f7e6d8ac1?ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=1856&q=80';

const double kHorizontalPadding = 32;

Profile dummyProfile =
    Profile(); // Dummy profile. You'll want to bring in the real user's profile

class ProfileSettings extends StatelessWidget {
  const ProfileSettings({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.white,
        leadingWidth: 0,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            CupertinoButton(child: const Text('Cancel'), onPressed: () {
              Navigator.pop(context);
            }),
            const Text(
              'Edit Profile',
              style: TextStyle(color: Colors.black, fontSize: 18),
            ),
            CupertinoButton(
              child: const Text(
                'Done',
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                ),
              ),
              onPressed: () {
                // print(dummyProfile);
                
              },
            ),
          ],
        ),
      ),
      // Use a ListView so the keyboard can push up our text fields.
      body: ListView(
        padding: const EdgeInsets.symmetric(
            horizontal: kHorizontalPadding, vertical: 48),
        children: [
          const Align(
            // Align here prevents the child from being stretched. Try removing it to see the effect!
            child: ProfilePicture(
              imageUrl: avatarImageUrl,
            ),
          ),
          // const SizedBox(height: 4),
          // CupertinoButton(
          //   child: const Text(
          //     'Upload Image',
          //     style: TextStyle(fontWeight: FontWeight.w500),
          //   ),
          //   onPressed: () {
          //     // Logic to upload image from photo library and replace
          //   },
          // ),
          const SizedBox(height: 48),
          ProfileInputField(
            inputLabel: 'First name',
            hintText: 'Ransford',
            onChanged: (val) {
              dummyProfile = dummyProfile.copyWith(firstName: val);
            },
          ),
          ProfileInputField(
            inputLabel: 'Last name',
            hintText: 'Anjin',
            onChanged: (val) {
              dummyProfile = dummyProfile.copyWith(lastName: val);
            },
          ),
          ProfileInputField(
            inputLabel: 'Location',
            hintText: 'Haatso',
            onChanged: (val) {
              dummyProfile = dummyProfile.copyWith(location: val);
            },
          ),
          ProfileInputField(
            inputLabel: 'Website',
            hintText: 'ghanaweb.com',
            onChanged: (val) {
              dummyProfile = dummyProfile.copyWith(website: val);
            },
          ),
          ProfileInputField(
            inputLabel: 'Bio',
            maxTextfieldLines: 5,
            maxLength: 140,
            hintText:
                'Budding Student from GIMPA',
            onChanged: (val) {
              dummyProfile = dummyProfile.copyWith(bio: val);
            },
          ),
        ],
      ),
    );
  }
}

class ProfileInputField extends StatelessWidget {
  const ProfileInputField(
      {this.inputLabel = '',
      this.hintText = '',
      this.maxTextfieldLines = 1,
      this.maxLength,
      required this.onChanged,
      Key? key})
      : super(key: key);
  final String inputLabel;
  final String hintText;
  final int? maxLength;
  final int maxTextfieldLines;
  final Function(String) onChanged;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              flex: 2,
              child: Text(
                inputLabel,
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            Expanded(
              flex: 3,
              child: TextField(
                maxLines: maxTextfieldLines,
                maxLength: maxLength,
                decoration: InputDecoration(
                  contentPadding: EdgeInsets
                      .zero, // IMPORTANT: Set content padding to zero and isDense to true to control the spacing yourself
                  isDense: true,
                  hintText: hintText,
                  border: InputBorder.none,
                ),
                onChanged: onChanged,
              ),
            ),
          ],
        ),
        const Divider(
          thickness: 1,
          height: 32,
        ),
      ],
    );
  }
}

class ProfilePicture extends StatelessWidget {
  const ProfilePicture({required this.imageUrl, this.radius = 172, Key? key})
      : super(key: key);
  final String imageUrl;
  final double radius;

  @override
  Widget build(BuildContext context) {
    return ClipOval(
      child: Image.network(
        avatarImageUrl,
        height: radius,
        width: radius,
        fit: BoxFit.cover,
      ),
    );
  }
}

class Profile {
  final String? profileImageUrl;
  final String? firstName;
  final String? lastName;
  final String? website;
  final String? location;
  final String? bio;

  Profile(
      {this.profileImageUrl,
      this.firstName,
      this.lastName,
      this.website,
      this.location,
      this.bio});

  @override
  String toString() {
    return '$firstName $lastName';
  }

  Profile copyWith({
    String? profileImageUrl,
    String? firstName,
    String? lastName,
    String? website,
    String? location,
    String? bio,
  }) {
    return Profile(
      profileImageUrl: profileImageUrl ?? this.profileImageUrl,
      firstName: firstName ?? this.firstName,
      lastName: lastName ?? this.lastName,
      website: website ?? this.website,
      location: location ?? this.location,
      bio: bio ?? this.bio,
    );
  }
}