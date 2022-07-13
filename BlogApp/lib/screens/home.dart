import 'package:blogapp/model/data_model.dart';
import 'package:blogapp/services/auth.dart';
import 'package:blogapp/services/data_class.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../services/data_services.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Helper datahelp = Helper();

  @override
  void initState() {
    super.initState();
    datahelp.getData();
  }

  @override
  Widget build(BuildContext context) {
    final authService = Provider.of<AuthServices>(context);

    return Scaffold(
      body: Container(
        child: Column(
          children: [
            Center(
              child: Padding(
                padding: const EdgeInsets.all(25),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(),
                    const Text('Blog App', style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold),),
                    IconButton(
                      icon: const Icon(Icons.logout),
                      onPressed: () async {
                        authService.signOut();
                      },
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              child: FutureBuilder<List<DataModel>>(
                  future: datahelp.getData(),
                  builder: (context, snapshot) {
                    if (!snapshot.hasData) {
                       const Center(
                        child: Text('Data is empty or something wrong'),
                      );
                    }
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return const Center(
                        child: CircularProgressIndicator(),
                      );
                    }
                    return ListView.builder(
                      itemCount: snapshot.data!.length,
                      itemBuilder: (context, index) {
                        return  ListTile(
                          title: Text(snapshot.data![index].title),
                          subtitle: Text(snapshot.data![index].body),
                        );
                      },
                    );
                  }),
            ),
          ],
        ),
      ),
    );
  }
}
