import 'package:flutter/material.dart';
import 'package:page_view_demo/page_view/pages/primary/primary_details_provider.dart';
import 'package:page_view_demo/page_view/utils/base_provider.dart';
import 'package:page_view_demo/page_view/widgets/custom_textform_field.dart';
import 'package:provider/provider.dart';

class SecondaryDetailsPage extends StatefulWidget {
  const SecondaryDetailsPage({Key? key}) : super(key: key);

  @override
  SecondaryDetailsPageState createState() => SecondaryDetailsPageState();
}

class SecondaryDetailsPageState extends State<SecondaryDetailsPage> {
  late PrimaryDetailsProvider provider;

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
          labelText: "Occupation",
          hintText: "Engineer, Doctor ...",
        ),
        ElevatedButton(
          style: ElevatedButton.styleFrom(
            primary: Colors.black,
            onPrimary: Colors.white,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(6.0)),
          ),
          onPressed: () => Navigator.pushNamed(context, '/step3'),
          child: const Text(
            "Submit",
            textAlign: TextAlign.center,
          ),
        )
      ]),
    ));
  }
}
