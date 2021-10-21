import 'package:flutter/material.dart';

abstract class BaseProvider<T extends BaseModel> with ChangeNotifier {
  OnCallbackListener? listener;
}

abstract class BaseModel {}

abstract class OnCallbackListener {
  void onSuccess(dynamic any, {int reqId});
  void onFailure(String message);
}

abstract class BaseState<T extends StatefulWidget> extends State<T>
    implements OnCallbackListener {
  @override
  void onFailure(String error) {
    // DialogUtils.instance.dismissProgressbar();
    // ErrorHandling.errorValidation(context, error);
  }

  @override
  void onSuccess(any, {int? reqId}) {
    // DialogUtils.instance.dismissProgressbar();
  }
}
