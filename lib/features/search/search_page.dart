// ignore_for_file: use_key_in_widget_constructors, prefer_final_fields, library_private_types_in_public_api, prefer_const_constructors

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cached_network_image/cached_network_image.dart';

class SearchPage extends StatefulWidget {
  @override
  _SearchPageState createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  TextEditingController _searchController = TextEditingController();
  Stream<QuerySnapshot>? _searchResults;

  @override
  void initState() {
    super.initState();
    _search(''); // Start with initial empty search 
  }

  void _search(String searchText) {
    setState(() {
      _searchResults = FirebaseFirestore.instance
          .collection('hostels')
          .where('title', isEqualTo: searchText)
          .snapshots();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context),
        ),
        title: TextField(
          controller: _searchController,
          onChanged: _search,
        ),
      ),
      body: StreamBuilder<QuerySnapshot>(
        stream: _searchResults,
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return Center(child: CupertinoActivityIndicator());
          } else {
            final results = snapshot.data!.docs;
            return ListView.builder(
              itemCount: results.length,
              itemBuilder: (context, index) {
                final hostelData = results[index].data() as Map<String, dynamic>;
                return ListTile(
                  leading: CachedNetworkImage( // Using cached_network_image 
                    imageUrl: hostelData['image URL'],
                    errorWidget: (context, error, stackTrace) => Icon(Icons.error),
                    placeholder: (context, url) => CircularProgressIndicator(),
                  ),
                  title: Text(hostelData['Title']),
                  subtitle: Text(hostelData['Subtitle']),
                );
              }
            );
          }
        }
      ),
    );
  }
}
