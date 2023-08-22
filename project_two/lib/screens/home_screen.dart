import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert'; // used for json decodeing

// import here
import '../drawer.dart';
import '../floatingBtn.dart';
import '../config.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var myText = "Change My Name";
  var url = Uri.parse('${Config.url}/note-list');
  var data;

  @override
  void initState() {
    super.initState();
    fetchData();
  }

  fetchData() async {
    var res = await http.get(url);
    data = jsonDecode(res.body); // convert the recived code in to list
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        title: const Text('Awesome App'),
      ),
      body: data != null
          ? SizedBox(
              width: double.infinity,
              child: ListView.builder(
                // it is like recycler view
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text(getTitle(data[index]["notes"])),
                    subtitle: Text(getDesc(data[index]["notes"])),
                    leading: const Icon(Icons.note_alt_outlined),
                    onTap: () async {
                      await Navigator.pushNamed(context, '/Detail',
                          arguments: data[index]["id"]);
                      setState(() {
                        fetchData();
                      });
                    },
                  );
                },
                itemCount: data.length,
              ),
            )
          : const Center(
              child: CircularProgressIndicator(),
            ),
      drawer: const MyDrawer(),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          await Navigator.pushNamed(context, '/Detail', arguments: 0);
          setState(() {
            fetchData();
          });
        },
        child: const Icon(
          Icons.add,
        ),
      ),
    );
  }
}
