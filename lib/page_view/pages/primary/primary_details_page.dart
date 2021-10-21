import 'package:flutter/material.dart';
import 'package:page_view_demo/page_view/pages/primary/primary_details_provider.dart';
import 'package:page_view_demo/page_view/utils/base_provider.dart';
import 'package:page_view_demo/page_view/widgets/custom_textform_field.dart';
import 'package:provider/provider.dart';

class PrimaryDetailsPage extends StatefulWidget {
  const PrimaryDetailsPage({Key? key}) : super(key: key);

  @override
  PrimaryDetailsPageState createState() => PrimaryDetailsPageState();
}

class PrimaryDetailsPageState extends State<PrimaryDetailsPage> {
  late PrimaryDetailsProvider provider;

  // PrimaryDetailsPageState(provider);

  @override
  void initState() {
    provider = Provider.of<PrimaryDetailsProvider>(context, listen: false);
    provider.listener = this as OnCallbackListener?;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Padding(
      padding: const EdgeInsets.fromLTRB(24.0, 12.0, 24.0, 12.0),
      child: Column(children: [
        CustomTextFormField(
          controller: provider.nameController,
          labelText: "First and Last Name",
          hintText: "Enter first and last name",
        ),
        ElevatedButton(
          style: ElevatedButton.styleFrom(
            primary: Colors.black,
            onPrimary: Colors.white,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(6.0)),
          ),
          onPressed: () => {
            // Navigator.pushNamed(context, '/step2')
          },
          child: const Text(
            "Submit",
            textAlign: TextAlign.center,
          ),
        )
      ]),
    ));
  }

  void setProvider() {}
}
