import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:tugas/app/modules/home/controllers/api_service.dart';
import 'package:tugas/app/modules/home/views/models.dart';

class WelcomeScreen extends StatefulWidget {
  @override
  _WelcomeScreenState createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  Future<Welcome>? _futureWelcome;

  @override
  void initState() {
    super.initState();
    _futureWelcome = ApiService().fetchWelcome();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Welcome Screen'),
      ),
      body: FutureBuilder<Welcome>(
        future: _futureWelcome,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return ListView.builder(
              itemCount: snapshot.data?.articles?.length, // Use ?. to access articles
              itemBuilder: (context, index) {
                return Card(
                  child: ListTile(
                    title: Text(snapshot.data?.articles?[index].title ?? ''), // Use ?. to access title
                    subtitle: Text(snapshot.data?.articles?[index].description ?? ''), // Use ?. to access description
                  ),
                );
              },
            );
          } else if (snapshot.hasError) {
            return Text('${snapshot.error}');
          }
          return Center(child: CircularProgressIndicator());
        },
      ),
    );
  }
}