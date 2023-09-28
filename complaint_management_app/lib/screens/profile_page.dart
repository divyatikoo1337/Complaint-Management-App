import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      appBar: AppBar(
        title: Text("Hello John"), 
        backgroundColor: Theme.of(context).backgroundColor,
        actions: [
          IconButton(onPressed: () {}, icon: const Icon(Icons.edit),)
        ],
        ),
      body: Center(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(children: [
                Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: CircleAvatar(
                    backgroundColor: Theme.of(context).primaryColor,
                    // backgroundImage: AssetImage('lib/assets/image1.png'),
                    radius: 80,
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text("John Doe", style: TextStyle(fontSize: 35),),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text("johndoe@gmail.com", style: TextStyle(fontSize: 18),),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text("6787996565",
                  style: TextStyle(fontSize: 18),
                            ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text("Hostel A",
                  style: TextStyle(fontSize: 18),
                            ),
                ),
              const Spacer(),
              Padding(
                padding: const EdgeInsets.only(bottom: 20.0),
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 25, vertical: 4),
                  decoration: BoxDecoration(
                    color: Theme.of(context).primaryColor,
                    borderRadius: BorderRadius.circular(8)
                  ),
                  child: TextButton.icon(
                    onPressed: () {}, 
                    icon: Icon(Icons.delete, color: Theme.of(context).backgroundColor,), 
                    label: Text("Delete", style: TextStyle(color: Theme.of(context).backgroundColor),),
                    ),
                ),
              ),
          
            ]),
          ),
        ),
    );
  }
}