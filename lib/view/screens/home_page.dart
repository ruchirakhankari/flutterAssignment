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
    });
  }

  @override
  Widget build(BuildContext context) {
    // return Scaffold(
    //   appBar: AppBar(
    //     title: const Text('Provider API'),
    //   ),
    //   body: Consumer<TodoProvider>(
    //     builder: (context, value, child) {
    //       if (value.isLoading) {
    //         return const Center(
    //           child: CircularProgressIndicator(),
    //         );
    //       }
    //       final todos = value.todos;
    //       return ListView.builder(
    //         itemCount: todos.length,
    //         itemBuilder: (context, index) {
    //           final todo = todos[index];
    //           return ListTile(
    //             leading: Image.network(todo.url),
    //             // leading: CircleAvatar(
    //             //   child: Text(todo.id.toString()),
    //             // ),
    //             title: Text(
    //               todo.title,
    //               // style: TextStyle(
    //               //   color: todo.completed ? Colors.grey : Colors.black,
    //               // ),
    //             ),
    //           );
    //         },
    //       );
    //     },
    //   ),
    // );


    return Scaffold(
        appBar: AppBar(
          //title: Text('Deals'),
          actions: const [
            Spacer(flex: 3),
            // Icon(Icons.fit_screen),
            Center(child: Text('Deals',textAlign: TextAlign.center,style: TextStyle(fontSize: 25))),
            Spacer(flex: 8),
            Icon(Icons.search),
            Spacer(flex: 1),
          ],
        ),
        drawer: Drawer(
          child: ListView(
            children: <Widget>[
              DrawerHeader(
                child: Text(
                  "Hello Demo!!",
                  textAlign: TextAlign.justify,
                  textScaleFactor: 2.0,
                ),
                decoration: BoxDecoration(color: Colors.green),
              ),
              ListTile(
                title: Text("App"),
                onTap: () {
                  Navigator.pop(context);
                },
              ),
              ListTile(
                title: Text("Logout"),
                onTap: () {
                  Navigator.pop(context);
                },
              )
            ],
          ),
        ),
       // icon: Icon(Icons.directions_transit,size: 50.0,),
        body: DefaultTabController(
          length: 3,
          child: Scaffold(
            appBar: new AppBar(
              actions: <Widget>[],
              title: new TabBar(
                tabs: [
                  new Tab(text:"TOP"),
                  new Tab(text:"POPULAR"),
                  new Tab(text:"FEATURED"),
                ],
                indicatorColor: Colors.white,
              ),
            ),
            body:
            Consumer<TopProvider>(
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
                        itemCount: tops.length,
                        itemBuilder: (context, index){
                          final todo = tops[index];
                          return Card(
                              child: Container(
                                child: Padding(
                                  padding: EdgeInsets.all(5),
                                  child: Column(
                                    children:<Widget> [
                                      Column(
                                        children: [
                                          Container(
                                            color: Colors.white,
                                            child: Column(
                                              mainAxisSize: MainAxisSize.min,
                                              children:<Widget> [
                                                Row(
                                                  children: [
                                                    Expanded(
                                                      child: Image.network("https://picsum.photos/id/${index}/150/150", height: 150,width: 150,),
                                                    ),
                                                    Expanded(
                                                      flex: 2,
                                                      child:Text(
                                                       todo.title,
                                                        style: TextStyle(
                                                          fontSize: 14,
                                                          color: Colors.black,
                                                          fontWeight: FontWeight.bold,),
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
                                                Icon(Icons.thumb_up,size: 25.0,),
                                                SizedBox(width: 8,),
                                                Text(todo.id.toString()),
                                                SizedBox(width: 40,),
                                                Icon(Icons.message,size: 25.0,),
                                                SizedBox(width: 8,),
                                                Text(todo.albumId.toString()),
                                                SizedBox(width: 40,),
                                                Icon(Icons.lock_clock,size: 25.0,),
                                                SizedBox(width: 8,),
                                                Text(todo.albumId.toString()),
                                                SizedBox(width: 100,),
                                                Text('Ad other', style: TextStyle(color: Colors.lightBlue),),
                                              ],
                                            ),
                                          ),
                                        ],
                                      )
                                    ],
                                  ),
                                ),
                              )
                          );
                        }
                    ),
                    //new Icon(Icons.directions_transit,size: 50.0,),
                    ListView.builder(
                        itemCount: featured.length,
                        itemBuilder: (context, index){
                          final feature = featured[index];
                          return Card(
                              child: Container(
                                child: Padding(
                                  padding: EdgeInsets.all(5),
                                  child: Column(
                                    children:<Widget> [
                                      Column(
                                        children: [
                                          Container(
                                            color: Colors.white,
                                            child: Column(
                                              mainAxisSize: MainAxisSize.min,
                                              children:<Widget> [
                                                Row(
                                                  children: [
                                                    Expanded(
                                                      child: Image.network("https://picsum.photos/id/${index}/150/150", height: 150,width: 150,),
                                                    ),
                                                    Expanded(
                                                      flex: 2,
                                                      child:Text(
                                                        feature.body,
                                                        style: TextStyle(
                                                          fontSize: 14,
                                                          color: Colors.black,
                                                          fontWeight: FontWeight.bold,),
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
                                                Icon(Icons.thumb_up,size: 25.0,),
                                                SizedBox(width: 8,),
                                                Text(feature.id.toString()),
                                                SizedBox(width: 40,),
                                                Icon(Icons.message,size: 25.0,),
                                                SizedBox(width: 8,),
                                                Text(feature.postId.toString()),
                                                SizedBox(width: 40,),
                                                Icon(Icons.lock_clock,size: 25.0,),
                                                SizedBox(width: 8,),
                                                Text(feature.postId.toString()),
                                                SizedBox(width: 100,),
                                                Text('Ad other', style: TextStyle(color: Colors.lightBlue),),
                                              ],
                                            ),
                                          ),
                                        ],
                                      )
                                    ],
                                  ),
                                ),
                              )
                          );
                        }
                    ),
                    //3.
                    ListView.builder(
                        itemCount: popular.length,
                        itemBuilder: (context, index){
                          final populars = popular[index];
                          return Card(
                              child: Container(
                                child: Padding(
                                  padding: EdgeInsets.all(5),
                                  child: Column(
                                    children:<Widget> [
                                      Column(
                                        children: [
                                          Container(
                                            color: Colors.white,
                                            child: Column(
                                              mainAxisSize: MainAxisSize.min,
                                              children:<Widget> [
                                                Row(
                                                  children: [
                                                    Expanded(
                                                      child: Image.network(populars.download_url, height: 150,width: 150,),
                                                    ),
                                                    Expanded(
                                                      flex: 2,
                                                      child:Text(
                                                        populars.auther,
                                                        style: TextStyle(
                                                          fontSize: 14,
                                                          color: Colors.black,
                                                          fontWeight: FontWeight.bold,),
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
                                                Icon(Icons.thumb_up,size: 25.0,),
                                                SizedBox(width: 8,),
                                                Text(populars.id.toString()),
                                                SizedBox(width: 40,),
                                                Icon(Icons.message,size: 25.0,),
                                                SizedBox(width: 8,),
                                                Text(populars.id.toString()),
                                                SizedBox(width: 40,),
                                                Icon(Icons.lock_clock,size: 25.0,),
                                                SizedBox(width: 8,),
                                                Text(populars.id.toString()),
                                                SizedBox(width: 100,),
                                                Text('Ad other', style: TextStyle(color: Colors.lightBlue),),
                                              ],
                                            ),
                                          ),
                                        ],
                                      )
                                    ],
                                  ),
                                ),
                              )
                          );
                        }
                    ),
                  ],
                );
              },
            ),
          ),
        )
    );
  }
}
