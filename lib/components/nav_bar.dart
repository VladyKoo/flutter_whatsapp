import 'package:flutter/material.dart';

class NavBar extends StatelessWidget {
  String _title;
  TabController _tabController;

  NavBar(this._title, this._tabController);


  @override
  Widget build(BuildContext context) {
    return AppBar(
          title: Text(_title),
          actions: [
            IconButton(
                onPressed: () => print('btn1'), icon: const Icon(Icons.search)),
            IconButton(
                onPressed: () => print('btn2'),
                icon: const Icon(Icons.more_vert)),
          ],
          backgroundColor: Color(0xFF075E54),
          bottom: PreferredSize(
              preferredSize: const Size.fromHeight(50.0),
              child: ListView(
                shrinkWrap: true,
                children: [
                  Row(
                    children: [
                      Expanded(
                        flex: 1,
                        child: IconButton(
                            onPressed: () => print('aaa'),
                            color: Colors.white,
                            icon: Icon(Icons.camera_alt)),
                      ),
                      Expanded(
                        flex: 10,
                        child: TabBar(
                          indicatorWeight: 5,
                          controller: _tabController,
                          tabs: const <Widget>[
                            Tab(
                              child: Text('chats'),
                            ),
                            Tab(
                              child: Text('status'),
                            ),
                            Tab(
                              child: Text('calls'),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              )),
        ),
}
}
