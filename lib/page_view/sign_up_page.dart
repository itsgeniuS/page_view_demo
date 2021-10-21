import 'package:flutter/material.dart';
import 'package:page_view_demo/page_view/pages/primary/primary_details_page.dart';
import 'package:page_view_demo/page_view/pages/secondary/secondary_details_page.dart';
import 'package:page_view_demo/page_view/pages/tertiary/tertiary_details_page.dart';
import 'package:page_view_demo/page_view/sign_up_provider.dart';
import 'package:page_view_demo/page_view/utils/base_provider.dart';
import 'package:provider/provider.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({Key? key}) : super(key: key);

  @override
  SignUpPageState createState() => SignUpPageState();
}

class SignUpPageState extends BaseState<SignUpPage> {
  late SignUpProvider signUpProvider;
  int currentPage = 0;

  //create a provider and declare the page controller

  var pageTitles = [
    "Confirm your\nPersonal Details",
    "Set up your\nUser ID",
    "Complete\nNeom Setup"
  ];

  var pageSubTitle = ["Personal Details", "Secondary Details", "Final Details"];

  final List<Widget> pageList = <Widget>[
    const Center(child: PrimaryDetailsPage()),
    const Center(child: SecondaryDetailsPage()),
    const Center(child: TertiaryDetailsPage())
  ];

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    signUpProvider = Provider.of<SignUpProvider>(context, listen: false);
    signUpProvider.listener = this;

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        centerTitle: true,
        title: null,
        leading: InkWell(
          child: const Icon(
            Icons.arrow_back_ios,
            color: Colors.black,
          ),
          onTap: () {
            Navigator.pop(context);
          },
        ),
        elevation: 0.0,
      ),
      body: signUpPageBody(context),
    );
  }

  Widget signUpPageBody(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 20.0, right: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Column(
                children: [
                  const Text(
                    "KYC VERIFICATION",
                    style: TextStyle(
                      color: Colors.black87,
                      fontSize: 18.0,
                    ),
                  ),
                  Text(
                    getCompletedStatusText(),
                    style: const TextStyle(
                      color: Colors.black87,
                      fontSize: 16.0,
                    ),
                  )
                ],
              ),
              const SizedBox(height: 40),
              Text(
                getTitleOfThePage(),
                style: const TextStyle(
                  color: Colors.black87,
                  fontSize: 32.0,
                ),
              ),
              const SizedBox(height: 10),
              const Text(
                "You can provide available details now or skip this submission & come back to it later",
                style: TextStyle(
                  color: Colors.black87,
                  fontSize: 14.0,
                ),
              )
            ],
          ),
        ),
        const SizedBox(height: 20),
        Container(
          width: MediaQuery.of(context).size.width,
          color: Colors.black26,
          child: Padding(
            padding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
            child: Text(
              getSubTitleOfThePage(),
              style: const TextStyle(color: Colors.black, fontSize: 14.0),
            ),
          ),
        ),
        Expanded(
          flex: 1,
          child: PageView(
            children: pageList,
            pageSnapping: false,
            controller: signUpProvider.pageController,
            physics: const NeverScrollableScrollPhysics(),
            onPageChanged: (index) {
              setState(() {
                currentPage = index;
              });
            },
          ),
        )
      ],
    );
  }

  @override
  void dispose() {
    //signUpProvider.pageController.dispose();
    super.dispose();
  }

  String getCompletedStatusText() {
    if (currentPage == 0) {
      return "Completed status: 0%";
    } else if (currentPage == 1) {
      return "Completed status: 50%";
    } else {
      return "Completed status: 100%";
    }
  }

  String getTitleOfThePage() {
    return pageTitles[currentPage];
  }

  String getSubTitleOfThePage() {
    return pageSubTitle[currentPage];
  }
}
