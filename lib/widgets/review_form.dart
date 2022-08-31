import 'dart:async';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:restaurant_app/provider/review_provider.dart';

class ReviewForm extends StatefulWidget {
  const ReviewForm({Key? key, required this.id}) : super(key: key);
  final String id;

  @override
  State<ReviewForm> createState() => _ReviewFormState();
}

class _ReviewFormState extends State<ReviewForm> {
  bool _loading = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Submit Review"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: SafeArea(
          child: Column(
            children: <Widget>[
              Form(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    TextFormField(
                      decoration: const InputDecoration(
                          labelText: 'Name',
                          enabledBorder: OutlineInputBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(10.0)),
                          ),
                          border: OutlineInputBorder()),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Dont Leave it Empty Please';
                        }
                        return null;
                      },
                      onChanged: (value) {
                        Provider.of<ReviewProvider>(context, listen: false)
                            .changeName(value);
                        Provider.of<ReviewProvider>(context, listen: false)
                            .changeId(widget.id);
                      },
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    TextFormField(
                      decoration: const InputDecoration(
                          labelText: 'Review',
                          enabledBorder: OutlineInputBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(10.0)),
                          ),
                          border: OutlineInputBorder()),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Dont Leave it Empty Please';
                        }
                        return null;
                      },
                      onChanged: (value) {
                        Provider.of<ReviewProvider>(context, listen: false)
                            .changeReview(value);
                      },
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          minimumSize: const Size.fromHeight(60)),
                      onPressed: () {
                        setState(() {
                          _loading = true;
                        });
                        Provider.of<ReviewProvider>(context, listen: false)
                            .createData();
                        Provider.of<ReviewProvider>(context, listen: false)
                            .addReview();

                        Timer(const Duration(seconds: 3), () {
                          _loading = true;
                          Navigator.pop(context);
                        });
                      },
                      child: _loading
                          ? const CircularProgressIndicator(
                              color: Colors.black,
                            )
                          : const Text("Submit"),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
