import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: CustomScrollView(
          physics: BouncingScrollPhysics(),
          slivers: [
            SliverAppBar(
              expandedHeight: 80.0,
              forceElevated: true,
              // pinned: true,
              floating: true,
              leading: IconButton(
                onPressed: () {},
                iconSize: 30.0,
                icon: const Icon(Icons.settings),
              ),
              flexibleSpace: FlexibleSpaceBar(
                centerTitle: true,
                title: const Text("Budget"),
              ),
              actions: [
                IconButton(
                  onPressed: () {},
                  iconSize: 30.0,
                  icon: const Icon(Icons.add),
                ),
              ],
            ),
            SliverList(
              delegate: SliverChildBuilderDelegate(
                (context, i) {
                  return Container(
                    color: Colors.red,
                    height: 80.0,
                    margin: const EdgeInsets.all(10.0),
                  );
                },
                childCount: 10,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
