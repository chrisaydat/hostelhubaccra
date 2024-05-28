import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

const String avatarImageUrl =
    'https://images.unsplash.com/photo-1543610892-0b1f7e6d8ac1?ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=1856&q=80';

const double kHorizontalPadding = 32;

Profile dummyProfile =
    Profile(); // Dummy profile. You'll want to bring in the real user's profile

class ProfileSettings extends StatefulWidget {
  const ProfileSettings({super.key});

  @override
  _ProfileSettingsState createState() => _ProfileSettingsState();
}

class _ProfileSettingsState extends State<ProfileSettings> {
  late TextEditingController _firstNameController;
  late TextEditingController _lastNameController;
  late TextEditingController _locationController;
  late TextEditingController _websiteController;
  late TextEditingController _bioController;

  @override
  void initState() {
    super.initState();
    _firstNameController = TextEditingController(text: dummyProfile.firstName);
    _lastNameController = TextEditingController(text: dummyProfile.lastName);
    _locationController = TextEditingController(text: dummyProfile.location);
    _websiteController = TextEditingController(text: dummyProfile.website);
    _bioController = TextEditingController(text: dummyProfile.bio);
  }

  @override
  void dispose() {
    _firstNameController.dispose();
    _lastNameController.dispose();
    _locationController.dispose();
    _websiteController.dispose();
    _bioController.dispose();
    super.dispose();
  }

  void _updateProfile() {
    setState(() {
      dummyProfile = dummyProfile.copyWith(
        firstName: _firstNameController.text,
        lastName: _lastNameController.text,
        location: _locationController.text,
        website: _websiteController.text,
        bio: _bioController.text,
      );
    });
    Navigator.pop(context);
  }

void _uploadImage() async {
  final picker = ImagePicker();
  final pickedImage = await picker.pickImage(source: ImageSource.gallery);

  if (pickedImage != null) {
    setState(() {
      dummyProfile = dummyProfile.copyWith(profileImageUrl: pickedImage.path);
    });
  }
}

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
              onPressed: _updateProfile,
            ),
          ],
        ),
      ),
      body: ListView(
        padding: const EdgeInsets.symmetric(
            horizontal: kHorizontalPadding, vertical: 48),
        children: [
          const Align(
            child: ProfilePicture(
              imageUrl: avatarImageUrl,
            ),
          ),
          const SizedBox(height: 4),
          CupertinoButton(
            child: const Text(
              'Upload Image',
              style: TextStyle(fontWeight: FontWeight.w500),
            ),
            onPressed: _uploadImage,
          ),
          const SizedBox(height: 48),
          ProfileInputField(
            inputLabel: 'First name',
            hintText: 'Ransford',
            controller: _firstNameController,
          ),
          ProfileInputField(
            inputLabel: 'Last name',
            hintText: 'Anjin',
            controller: _lastNameController,
          ),
          ProfileInputField(
            inputLabel: 'Location',
            hintText: 'Haatso',
            controller: _locationController,
          ),
          ProfileInputField(
            inputLabel: 'Website',
            hintText: 'ghanaweb.com',
            controller: _websiteController,
          ),
          ProfileInputField(
            inputLabel: 'Bio',
            maxTextfieldLines: 5,
            maxLength: 140,
            hintText: 'Budding Student from GIMPA',
            controller: _bioController,
          ),
        ],
      ),
    );
  }
}

class ProfileInputField extends StatelessWidget {
  const ProfileInputField({
    this.inputLabel = '',
    this.hintText = '',
    this.maxTextfieldLines = 1,
    this.maxLength,
    required this.controller,
    Key? key,
  }) : super(key: key);

  final String inputLabel;
  final String hintText;
  final int? maxLength;
  final int maxTextfieldLines;
  final TextEditingController controller;

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
                controller: controller,
                maxLines: maxTextfieldLines,
                maxLength: maxLength,
                decoration: InputDecoration(
                  contentPadding: EdgeInsets.zero,
                  isDense: true,
                  hintText: hintText,
                  border: InputBorder.none,
                ),
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
  final String? imageUrl;
  final double radius;

  @override
  Widget build(BuildContext context) {
    return ClipOval(
      child: imageUrl != null
          ? Image.file(
              File(imageUrl!),
              height: radius,
              width: radius,
              fit: BoxFit.cover,
            )
          : Image.network(
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