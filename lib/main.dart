import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: CreateCommentPage(),
    );
  }
}

class CreateCommentPage extends StatefulWidget {
  @override
  _CreateCommentPageState createState() => _CreateCommentPageState();
}

class _CreateCommentPageState extends State<CreateCommentPage> {
  final _formKey = GlobalKey<FormState>();
  final _commentController = TextEditingController();

  void _submitComment() {
    if (_formKey.currentState!.validate()) {
      // Proses komentar
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Comment submitted: ${_commentController.text}")),
      );
      _commentController.clear();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Create Comment"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Add a Comment",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 16),
              TextFormField(
                controller: _commentController,
                decoration: InputDecoration(
                  labelText: "Comment",
                  border: OutlineInputBorder(),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Comment cannot be empty";
                  }
                  return null;
                },
              ),
              SizedBox(height: 16),
              ElevatedButton(
                onPressed: _submitComment,
                child: Text("Submit"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}