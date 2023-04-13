import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutterassignment/view-model/provider/todo_provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      Provider.of<TopProvider>(context, listen: false).getAllTodos();
      Provider.of<TopProvider>(context, listen: false).getAllpopular();
      Provider.of<TopProvider>(context, listen: false).getAllfeatured();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: const [
          Spacer(flex: 3),
          Center(
              child: Text('Deals',
                  textAlign: TextAlign.center, style: TextStyle(fontSize: 25))),
          Spacer(flex: 8),
          Icon(Icons.search),
          Spacer(flex: 1),
        ],
      ),
      drawer: Drawer(
        child: ListView(
          padding: const EdgeInsets.all(0),
          children: [
            const DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.blue,
              ), //BoxDecoration
              child: UserAccountsDrawerHeader(
                decoration: BoxDecoration(color: Colors.blue),
                accountName: Text(
                  "Hello Demo!!!",
                  style: TextStyle(fontSize: 18),
                ),
                accountEmail: Text("demo@gmail.com"),
                currentAccountPictureSize: Size.square(50),
                currentAccountPicture: CircleAvatar(
                  backgroundColor: Colors.lightGreenAccent,
                  child: Text(
                    "H",
                    style: TextStyle(fontSize: 30.0, color: Colors.blue),
                  ), //Text
                ), //circleAvatar
              ), //UserAccountDrawerHeader
            ), //DrawerHeader
            ListTile(
              leading: const Icon(Icons.person),
              title: const Text(' My Profile '),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: const Icon(Icons.edit),
              title: const Text(' Edit Profile '),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: const Icon(Icons.logout),
              title: const Text('LogOut'),
              onTap: () {
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
      body: DefaultTabController(
        length: 3,
        child: Scaffold(
          appBar: new AppBar(
            actions: <Widget>[],
            title: new TabBar(
              tabs: [
                new Tab(text: "TOP"),
                new Tab(text: "POPULAR"),
                new Tab(text: "FEATURED"),
              ],
              indicatorColor: Colors.white,
            ),
          ),
          body: Consumer<TopProvider>(
            builder: (context, value, child) {
              if (value.isLoading) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }
              final tops = value.top;
              final featured = value.featured;
              final popular = value.popular;
              return TabBarView(
                children: [
                  ListView.builder(
                      itemCount: featured.length,
                      itemBuilder: (context, index) {
                        final feature = featured[index];
                        return Card(
                            child: Container(
                          child: Padding(
                            padding: EdgeInsets.all(5),
                            child: Column(
                              children: <Widget>[
                                Column(
                                  children: [
                                    Container(
                                      color: Colors.white,
                                      child: Column(
                                        mainAxisSize: MainAxisSize.max,
                                        children: <Widget>[
                                          Row(
                                            children: [
                                              Image.network(
                                                feature.download_url,
                                                height: 150,
                                                width: 150,
                                              ),
                                              Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Text(
                                                    feature.author,
                                                    style: TextStyle(
                                                      fontSize: 14,
                                                      color: Colors.black,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                    ),
                                                  ),
                                                  SizedBox(
                                                    height: 15,
                                                  ),
                                                  Row(
                                                    children: [
                                                      Text(
                                                        feature.height
                                                            .toString(),
                                                        style: TextStyle(
                                                          fontSize: 14,
                                                          color: Colors.green,
                                                          fontWeight:
                                                              FontWeight.bold,
                                                        ),
                                                      ),
                                                      SizedBox(
                                                        width: 8,
                                                      ),
                                                      Text(
                                                        feature.width
                                                            .toString(),
                                                        style: TextStyle(
                                                            fontSize: 14,
                                                            color: Colors.black,
                                                            fontWeight:
                                                                FontWeight.bold,
                                                            decoration:
                                                                TextDecoration
                                                                    .lineThrough),
                                                      ),
                                                      SizedBox(
                                                        width: 8,
                                                      ),
                                                      Text(
                                                        feature.id + " %",
                                                        style: TextStyle(
                                                          fontSize: 14,
                                                          color: Colors.black,
                                                          fontWeight:
                                                              FontWeight.bold,
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ],
                                              ),
                                            ],
                                          )
                                        ],
                                      ),
                                    ),
                                    Container(
                                      padding: EdgeInsets.only(top: 10),
                                      child: Row(
                                        children: <Widget>[
                                          Icon(
                                            Icons.thumb_up,
                                            size: 25.0,
                                          ),
                                          SizedBox(
                                            width: 8,
                                          ),
                                          Text(feature.id.toString()),
                                          SizedBox(
                                            width: 40,
                                          ),
                                          Icon(
                                            Icons.message,
                                            size: 25.0,
                                          ),
                                          SizedBox(
                                            width: 8,
                                          ),
                                          Text(feature.width.toString()),
                                          SizedBox(
                                            width: 40,
                                          ),
                                          Icon(
                                            Icons.lock_clock,
                                            size: 25.0,
                                          ),
                                          SizedBox(
                                            width: 8,
                                          ),
                                          Text(feature.height.toString()),
                                          SizedBox(
                                            width: 50,
                                          ),
                                          Text(
                                            'Ad other',
                                            style: TextStyle(
                                                color: Colors.lightBlue),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                )
                              ],
                            ),
                          ),
                        ));
                      }),
                  ListView.builder(
                      itemCount: tops.length,
                      itemBuilder: (context, index) {
                        final todo = tops[index];
                        return Card(
                            child: Container(
                          child: Padding(
                            padding: EdgeInsets.all(5),
                            child: Column(
                              children: <Widget>[
                                Column(
                                  children: [
                                    Container(
                                      color: Colors.white,
                                      child: Column(
                                        mainAxisSize: MainAxisSize.min,
                                        children: <Widget>[
                                          Row(
                                            children: [
                                              Expanded(
                                                child: Image.network(
                                                  "https://picsum.photos/id/${index}/150/150",
                                                  height: 150,
                                                  width: 150,
                                                ),
                                              ),
                                              Expanded(
                                                flex: 2,
                                                child: Text(
                                                  todo.title,
                                                  style: TextStyle(
                                                    fontSize: 14,
                                                    color: Colors.black,
                                                    fontWeight: FontWeight.bold,
                                                  ),
                                                ),
                                              ),
                                            ],
                                          )
                                        ],
                                      ),
                                    ),
                                    Container(
                                      padding: EdgeInsets.only(top: 10),
                                      child: Row(
                                        children: <Widget>[
                                          Icon(
                                            Icons.thumb_up,
                                            size: 25.0,
                                          ),
                                          SizedBox(
                                            width: 8,
                                          ),
                                          Text(todo.id.toString()),
                                          SizedBox(
                                            width: 40,
                                          ),
                                          Icon(
                                            Icons.message,
                                            size: 25.0,
                                          ),
                                          SizedBox(
                                            width: 8,
                                          ),
                                          Text(todo.albumId.toString()),
                                          SizedBox(
                                            width: 40,
                                          ),
                                          Icon(
                                            Icons.lock_clock,
                                            size: 25.0,
                                          ),
                                          SizedBox(
                                            width: 8,
                                          ),
                                          Text(todo.albumId.toString()),
                                        ],
                                      ),
                                    ),
                                  ],
                                )
                              ],
                            ),
                          ),
                        ));
                      }),
                  ListView.builder(
                      itemCount: popular.length,
                      itemBuilder: (context, index) {
                        final populars = popular[index];
                        return Card(
                            child: Container(
                          child: Padding(
                            padding: EdgeInsets.all(5),
                            child: Column(
                              children: <Widget>[
                                Column(
                                  children: [
                                    Container(
                                      color: Colors.white,
                                      child: Column(
                                        mainAxisSize: MainAxisSize.min,
                                        children: <Widget>[
                                          Row(
                                            children: [
                                              Expanded(
                                                child: Image.network(
                                                  populars.download_url,
                                                  height: 150,
                                                  width: 150,
                                                ),
                                              ),
                                              Expanded(
                                                flex: 2,
                                                child: Text(
                                                  populars.author,
                                                  style: TextStyle(
                                                    fontSize: 14,
                                                    color: Colors.black,
                                                    fontWeight: FontWeight.bold,
                                                  ),
                                                ),
                                              ),
                                            ],
                                          )
                                        ],
                                      ),
                                    ),
                                    Container(
                                      padding: EdgeInsets.only(top: 10),
                                      child: Row(
                                        children: <Widget>[
                                          Icon(
                                            Icons.thumb_up,
                                            size: 25.0,
                                          ),
                                          SizedBox(
                                            width: 8,
                                          ),
                                          Text(populars.id.toString()),
                                          SizedBox(
                                            width: 40,
                                          ),
                                          Icon(
                                            Icons.message,
                                            size: 25.0,
                                          ),
                                          SizedBox(
                                            width: 8,
                                          ),
                                          Text(populars.width.toString()),
                                          SizedBox(
                                            width: 40,
                                          ),
                                          Icon(
                                            Icons.lock_clock,
                                            size: 25.0,
                                          ),
                                          SizedBox(
                                            width: 8,
                                          ),
                                          Text(populars.height.toString()),
                                          // SizedBox(width: 100,),
                                          // Text('Ad other', style: TextStyle(color: Colors.lightBlue),),
                                        ],
                                      ),
                                    ),
                                  ],
                                )
                              ],
                            ),
                          ),
                        ));
                      }),
                ],
              );
            },
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: Icon(Icons.currency_rupee_outlined),
        backgroundColor: Colors.red,
      ),
    );
  }
}
