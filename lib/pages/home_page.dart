import 'package:flutter/material.dart';

class MyTab {
  final String name;
  final MaterialColor color;
  final IconData icon;

  const MyTab(this.name, this.color, this.icon);
}

enum TabItem { chats, status, calls }

class HomePage extends StatefulWidget {
  const HomePage({Key? key, required this.title}) : super(key: key);

  final String title;
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with TickerProviderStateMixin {
  TabItem _currentTab = TabItem.chats;

  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  Future<bool> onWillPop() async {
    if (_currentTab != TabItem.chats) {
      if (_currentTab == TabItem.calls) {
        selectTab(TabItem.status);
      } else {
        selectTab(TabItem.chats);
      }
      return false;
    } else {
      return true;
    }
  }

  void selectTab(TabItem tabItem) {
    setState(() => _currentTab = tabItem);
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: onWillPop,
      child: Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
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
        body: TabBarView(
          children: const <Widget>[
            Text('Chats'),
            Text('Status'),
            Text('Calls'),
          ],
          controller: _tabController,
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () => print('tap'),
          tooltip: 'New chat',
          child: const Icon(Icons.chat),
          backgroundColor: Colors.green,
        ),
      ),
    );
  }
}
