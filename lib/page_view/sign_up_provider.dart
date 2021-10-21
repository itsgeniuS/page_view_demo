import 'package:flutter/material.dart';
import 'package:page_view_demo/page_view/utils/base_provider.dart';

class SignUpProvider extends BaseProvider<BaseModel> {
  PageController pageController = PageController(initialPage: 0);

  void onPrimaryPageSubmit() {
    pageController.animateToPage(1,
        duration: const Duration(milliseconds: 400), curve: Curves.easeInOut);
  }

  void onSecondaryPageSubmit() {
    pageController.animateToPage(2,
        duration: const Duration(milliseconds: 400), curve: Curves.easeInOut);
  }

  void onFinalPageSubmit() {
    pageController.animateToPage(3,
        duration: const Duration(milliseconds: 400), curve: Curves.easeInOut);
  }
}
