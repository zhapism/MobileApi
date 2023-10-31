import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:get/get.dart';
import 'package:get/instance_manager.dart';
import 'package:praktikum1/app/modules/home/views/news_tile.dart';
import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  HomeView({Key? key}) : super(key: key);
  HomeController homeController = Get.put(HomeController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        leading: Icon(
          Icons.arrow_back_ios,
        ),
        actions: [
          IconButton(
            icon: Icon(
              Icons.shopping_cart,
            ),
            onPressed: () {},
          )
        ],
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16),
            child: Row(
              children: [
                Expanded(
                  child: Text(
                    'Todays News',
                    style: TextStyle(
                        fontFamily: 'avenir',
                        fontSize: 32,
                        fontWeight: FontWeight.w900),
                  ),
                ),
                IconButton(
                    icon: Icon(Icons.view_list_rounded), onPressed: () {}),
                IconButton(icon: Icon(Icons.grid_view), onPressed: () {}),
              ],
            ),
          ),
          Expanded(
            child: Obx(() {
              if (homeController.isLoading.value)
                return Center(child: CircularProgressIndicator());
              else
                return AlignedGridView.count(
                  crossAxisCount: 2,
                  itemCount: homeController.articleList.length,
                  crossAxisSpacing: 16,
                  mainAxisSpacing: 16,
                  itemBuilder: (context, index) {
                    return NewsTile(homeController.articleList[index]);
                  },
                );
            }),
          )
        ],
      ),
    );
    // Scaffold(
    //     appBar: AppBar(
    //       title: Text(
    //         "News Today",
    //         style: TextStyle(fontSize: 28),
    //       ),
    //     ),
    //     body: AlignedGridView.count(
    //         crossAxisCount: 2,
    //         itemCount: HomeController.articletList.,
    //         itemBuilder: ((context, index) {
    //           return Container(
    //             height: 200,
    //             width: 100,
    //             color: Colors.red,
    //           );
    //         })));
  }
}
