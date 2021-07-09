import 'package:efood/controller/db_helper.dart';
import 'package:efood/model/user_story_model.dart';
import 'package:flutter/material.dart';

class ViewBdPage extends StatefulWidget {
  const ViewBdPage({Key key}) : super(key: key);

  @override
  _ViewBdPageState createState() => _ViewBdPageState();
}

class _ViewBdPageState extends State<ViewBdPage> {
  DatabaseClient db = new DatabaseClient();

  @override
  void initState() {
    super.initState();
    db.create();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
              color: Colors.red,
              child: Text('ok'),
            ),
            ElevatedButton(
              onPressed: () async {
                User user = new User();
                user.username = "omar faruk";

                user = await db.upsertUser(user);
                print(user.toMap());

                Story story = new Story();
                story.title = "news header ";
                story.body = "new body content.......";
                story.user_id = user.id;
                story.user = user;

                story = await db.upsertStory(story);

                Story getstory = await db.fetchStoryAndUser(1);
                print(getstory.body);

                List<Story> latestStories = await db.fetchLatestStories(5);

                latestStories.forEach((element) => print(element.toMap()));
              },
              child: Text("OK press"),
            ),
          ],
        ),
      ),
    );
  }
}
