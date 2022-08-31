import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:restaurant_app/data/db/database_helper.dart';
import 'package:restaurant_app/provider/database_provider.dart';
import 'package:restaurant_app/widgets/consumer_saved.dart';

class SavedPage extends StatelessWidget {
  static const routeName = '/saved_page';

  const SavedPage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<DatabaseProvider>(
      create: (_) => DatabaseProvider(databaseHelper: DatabaseHelper()),
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Saved"),
        ),
        body: const ConsumerSaved(),
      ),
    );
  }
}
