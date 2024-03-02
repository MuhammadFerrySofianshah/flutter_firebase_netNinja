import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_firebase_netninja/screens/authenticate/authenticate.dart';

class Wrapper extends StatelessWidget {
  const Wrapper({super.key});

  @override
  Widget build(BuildContext context) {
    // Return either Home or Authenticate Widget
    return Authenticate();
  }
}
