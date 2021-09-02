import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:pagination/networking/reqres.dart';

class Users extends StatefulWidget {
  @override
  _UsersState createState() => _UsersState();
}

class _UsersState extends State<Users> {
  final PagingController<int, UserData> _pagingController =
      PagingController(firstPageKey: 1);

  Future<Reqres> _getData(int page) async {
    String url = "https://reqres.in/api/users?page=$page";
    http.Response response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      Reqres reqres = Reqres.fromJson(jsonDecode(response.body));
      return reqres;
    } else {
      throw Exception("Something Went Wrong");
    }
  }

  Future<void> _fetchPage(int pageKey) async {
    try {
      Reqres reqres = await _getData(pageKey);
      List<UserData> userData = reqres.data ?? [];

      int nextPage = pageKey + 1;

      if (reqres.total_pages == reqres.page) {
        _pagingController.appendLastPage(userData);
      } else {
        _pagingController.appendPage(userData, nextPage);
      }
    } catch (error) {
      _pagingController.error = error;
    }
  }

  @override
  void initState() {
    super.initState();
    _pagingController.addPageRequestListener((pageKey) {
      _fetchPage(pageKey);
    });
  }

  @override
  void dispose() {
    super.dispose();
    _pagingController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: AppBar(title: Text("My App")),
      body: PagedListView<int, UserData>(
        pagingController: _pagingController,
        builderDelegate: PagedChildBuilderDelegate<UserData>(
          noMoreItemsIndicatorBuilder: (context) => Padding(
              padding: EdgeInsets.all(18),
              child: Text("That's all Folks",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontStyle: FontStyle.italic,
                      color: Colors.grey,
                      fontSize: 16))),
          itemBuilder: (context, item, index) => Card(
            elevation: 8,
            child: Container(
              height: height * 0.25,
              width: double.infinity,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CircleAvatar(
                    radius: 35,
                    backgroundImage: NetworkImage(item.avatar),
                  ),
                  Text("${item.first_name} ${item.last_name}",
                      style: TextStyle(fontSize: 22)),
                  Text(item.email),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
