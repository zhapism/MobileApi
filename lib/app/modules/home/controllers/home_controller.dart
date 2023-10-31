import 'package:get/get.dart';
import 'package:praktikum1/app/data/remot_services.dart';
import 'package:praktikum1/app/modules/models/news.dart';

class HomeController extends GetxController {
  //TODO: Implement HomeController
  var isLoading = true.obs;
  var articleList = <Article>[].obs;

  @override
  void onInit() {
    fetchNews();
    super.onInit();
  }

  void fetchNews() async {
    try {
      isLoading(true);
      var news = await RemoteServices.fetchNews();
      if (news != null) {
        // articleList.value = news;
        articleList.assignAll(news.articles);
      }
    } finally {
      isLoading(false);
    }
  }

  // final count = 0.obs;

  // @override
  // void onReady() {
  //   super.onReady();
  // }

  // @override
  // void onClose() {
  //   super.onClose();
  // }

  // void increment() => count.value++;
}
