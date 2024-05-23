import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class BaseController extends ChangeNotifier {
  late String error;
  late bool _isLoading;

  bool get isLoading => _isLoading;
}
