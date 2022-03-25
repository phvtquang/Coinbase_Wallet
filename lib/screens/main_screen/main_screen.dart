import 'package:coinbaseclone/constant.dart';
import 'package:flutter/material.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          Container(
            color: kPrimaryColor,
            height: MediaQuery.of(context).size.height * 0.4,
          ),
          DraggableScrollableSheet(
              expand: true,
              initialChildSize: 0.65,
              minChildSize: 0.65,
              maxChildSize: 0.85,
              builder: (BuildContext context, scrollController) {
                return Container(
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(15),
                      topRight: Radius.circular(15),
                    ),
                  ),
                  child: ListView.builder(
                    controller: scrollController,
                    itemCount: 2,
                    itemBuilder: (BuildContext context, int index) {
                      return ListTile(title: Text('Item $index'));
                    },
                  ),
                );
              }),
        ],
      ),
    );
  }
}
