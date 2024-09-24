import 'package:flutter/material.dart';
import 'domain/custom_style.dart';
import 'expended_chat_screen.dart';

class ChatScreen extends StatelessWidget {
  MediaQueryData? mqData;
  bool? isLight;

  List<Map<String, dynamic>> mList = [
    {
      'icon': ClipRRect(
        borderRadius: BorderRadius.circular(50),
        child: Image.asset("assets/profiles/whatsapp.jpg"),
      ),
      'title': "Developer",
      'subtitle': 'Hello,Developer how are you??',
      'time': '8/07/24'
    }
  ];

  @override
  Widget build(BuildContext context) {
    isLight = Theme.of(context).brightness == Brightness.light;
    mqData = MediaQuery.of(context);
    print(mqData!.size.width);
    return Scaffold(
      appBar: mqData!.orientation == Orientation.portrait
          ? AppBar(
        title: Text(
          "WhatsApp",
          style: CustomTextStyle.mStyleColor(isLight: isLight!),
        ),
        actions: [
          IconButton(
              onPressed: () {},
              icon: Icon(Icons.qr_code_scanner_rounded)),
          IconButton(
              onPressed: () {}, icon: Icon(Icons.camera_alt_outlined)),
          PopupMenuButton(
            position: PopupMenuPosition.under,
            itemBuilder: (_) {
              return [
                PopupMenuItem(onTap: () {}, child: Text("New Group")),
                PopupMenuItem(onTap: () {}, child: Text("New broadcast")),
                PopupMenuItem(
                    onTap: () {}, child: Text("Linked devices")),
                PopupMenuItem(
                    onTap: () {}, child: Text("Starred messages")),
                PopupMenuItem(onTap: () {}, child: Text("Payments")),
                PopupMenuItem(onTap: () {}, child: Text("Settings"))
              ];
            },
          )
        ],
      )
          : null,
      body: mqData!.orientation == Orientation.portrait
          ? listUI(context: context)
          : LayoutBuilder(
          builder: (_,constraints) {
            return Row(
              children: [
                Expanded(
                    flex: constraints.maxWidth < 1100 ? 4 : 2,
                    child: Column(
                      children: [
                        Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: 10.0, vertical: 15),
                          child: LayoutBuilder(builder: (_, constraints) {
                            return Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Text(
                                  "Chats",
                                  style: TextStyle(
                                      color: isLight!
                                          ? Colors.black
                                          : Colors.white,
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold),
                                ),
                                Flexible(
                                  fit: FlexFit.loose,
                                  child: SizedBox(
                                    width: constraints.maxWidth * 0.65,
                                  ),
                                ),
                                Icon(Icons.edit_note_sharp),
                                Icon(Icons.sort)
                              ],
                            );
                          }),
                        ),
                        LayoutBuilder(builder: (_, constraints) {
                          return Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal: 10.0, vertical: 13),
                            child: SizedBox(
                              height: constraints.minHeight + 35,
                              child: TextField(
                                decoration: InputDecoration(
                                    border: OutlineInputBorder(
                                        borderSide: BorderSide(
                                            width: 1, color: Colors.grey)),
                                    enabledBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                            color: Colors.grey, width: 1)),
                                    prefixIcon: Icon(Icons.search),
                                    hintText: "Search or start a new chat",
                                    hintStyle: TextStyle(fontSize: 15)),
                              ),
                            ),
                          );
                        }),
                        Expanded(child: listUI(context: context)),
                      ],
                    )),
                Expanded(
                    flex: 5,
                    child: Container(
                      height: double.infinity,
                      width: double.infinity,
                      decoration: const BoxDecoration(
                          border: Border(
                              left: BorderSide(color: Colors.grey, width: 1))),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          ClipRRect(
                              child: Image.asset(
                                "assets/icons/whatsapp.png",
                                height: 50,
                              )),
                          const FittedBox(
                              child: Padding(
                                padding: EdgeInsets.all(8.0),
                                child: Text(
                                  "WhatsApp for Windows",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(fontSize: 20),
                                ),
                              )),
                          FittedBox(
                              child: Text(
                                "Send and receive message without keeping your phone online",
                                textAlign: TextAlign.center,
                                style: TextStyle(color: Colors.grey),
                              )),
                          FittedBox(
                            child: Text(
                              "Use whatsapp up to 4 linked devices and 1 phone at the same time",
                              style: TextStyle(color: Colors.grey),
                            ),
                          )
                        ],
                      ),
                    ))
              ],
            );
          }
      ),
      floatingActionButton: mqData!.orientation == Orientation.portrait ? FloatingActionButton(
        onPressed: () {},
        child: Icon(
          Icons.add_comment,
          color: isLight! ? Colors.white : Colors.black,
        ),
        backgroundColor: Colors.green.shade500,
      ) : null,
    );
  }

  Widget listUI({required BuildContext context}) {
    return ListView.builder(
        itemCount: 15,
        itemBuilder: (_, index) {
          return InkWell(
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return ExpandedChat() ;
              })) ;
            },
            child: Padding(
              padding: EdgeInsets.symmetric(vertical: 5.0),
              child: ListTile(
                leading: CircleAvatar(
                  backgroundColor: Colors.white,
                  child: mList[0]['icon'],
                ),
                title: Text(
                  mList[0]['title'],
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                subtitle: Text(
                  mList[0]['subtitle'],
                  style: TextStyle(color: Colors.grey.shade500),
                ),
                trailing: Text(mList[0]['time']),
              ),
            ),
          );
        });
  }
}