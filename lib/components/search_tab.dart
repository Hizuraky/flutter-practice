import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SearchTab extends StatelessWidget {
  static const title = '地点検索';
  static const androidIcon = Icon(Icons.search);
  static const iosIcon = Icon(CupertinoIcons.search);

  const SearchTab({super.key});

  Widget _buildBody(BuildContext context) {
    String titleText = 'Second Page';
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          children: [
            const Text("Flutter Demo App",
                style: TextStyle(
                    fontSize: 16,
                    color: Colors.black54,
                    fontWeight: FontWeight.bold)),
            TextField(
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'SecondPage title',
              ),
              onChanged: (text) {
                titleText = text;
              },
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(context) {
    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(),
      child: _buildBody(context),
    );
  }
}
