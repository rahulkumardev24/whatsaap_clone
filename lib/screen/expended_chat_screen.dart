

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ExpandedChat extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: FittedBox(
          child: Row(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(40),
                child: CircleAvatar(
                  child: Image.asset("assets/profiles/whatsapp.jpg",fit: BoxFit.contain),
                ),
              ),
              SizedBox(width: 3,),
              Text("Developer")
            ],
          ),
        ),
        titleSpacing: 0,
        actions: [
          IconButton(
              onPressed: () {}, icon: Icon(Icons.video_camera_back_outlined)),
          IconButton(onPressed: () {}, icon: Icon(Icons.call)),
          PopupMenuButton(
            position: PopupMenuPosition.under,
            itemBuilder: (_) {
              return [
                PopupMenuItem(onTap: () {}, child: Text("New Group")),
                PopupMenuItem(onTap: () {}, child: Text("New broadcast")),
                PopupMenuItem(onTap: () {}, child: Text("Linked devices")),
                PopupMenuItem(onTap: () {}, child: Text("Starred messages")),
                PopupMenuItem(onTap: () {}, child: Text("Payments")),
                PopupMenuItem(onTap: () {}, child: Text("Settings"))
              ];
            },
          )
        ],
      ),
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        color: Colors.blue.shade50,
      ),
    );
  }
}