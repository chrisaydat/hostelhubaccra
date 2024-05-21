// ignore_for_file: prefer_final_fields, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';

class SearchPage extends StatefulWidget {
  @override
  _SearchPageState createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  TextEditingController _searchController = TextEditingController();
  List<Map<String, dynamic>> _hostels = [
    {
      'title': 'Max Hostel',
      'subtitle': 'Premuim Hostel just 5 mins away from GIMPA',
      'imageUrl':
          'https://cf.bstatic.com/xdata/images/hotel/max1024x768/187385130.jpg?k=4935f6b9d6f63e9a003d7ac7283dc6fe390bd49ec1194bc88dddfd7985445d01&o=&hp=1',
    },
    {
      'title': 'K Hostel',
      'subtitle': 'Hostel 7 Mins away from GIMPA with AC',
      'imageUrl':
          'https://lh3.googleusercontent.com/p/AF1QipOVT3dF81u6AU-diDOF5GrnxkX24i3qd3gDRxQ8=s680-w680-h510',
    },
    // Add the rest of the hostel data here
  ];
  List<Map<String, dynamic>> _filteredHostels = [];

  @override
  void initState() {
    super.initState();
    _filteredHostels = List.from(_hostels);
  }

  void _search(String searchText) {
    setState(() {
      _filteredHostels = _hostels
          .where((hostel) =>
              hostel['title'].toLowerCase().contains(searchText.toLowerCase()))
          .toList();
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
          decoration: InputDecoration(
            hintText: 'Search...',
          ),
        ),
      ),
      body: ListView.builder(
        itemCount: _filteredHostels.length,
        itemBuilder: (context, index) {
          final hostelData = _filteredHostels[index];
          return ListTile(
            leading: CachedNetworkImage(
              imageUrl: hostelData['imageUrl'],
              errorWidget: (context, error, stackTrace) => Icon(Icons.error),
              placeholder: (context, url) => CircularProgressIndicator(),
            ),
            title: Text(hostelData['title']),
            subtitle: Text(hostelData['subtitle']),
          );
        },
      ),
    );
  }
}
