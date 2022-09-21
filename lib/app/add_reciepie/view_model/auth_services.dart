import 'package:flutter/widgets.dart';

class AddRecipiAuth with ChangeNotifier {
  final signUpKey = GlobalKey<FormState>();
  final foodname = TextEditingController();
  final description = TextEditingController();
  final time = TextEditingController();
  final email = TextEditingController();
}
