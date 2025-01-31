import 'dart:io';


Future isConnected() async {
  // var connectivityResult = await (Connectivity().checkConnectivity());

  // switch (connectivityResult) {
  //   case ConnectivityResult.mobile:
  //     return true;
  //   case ConnectivityResult.wifi:
  //     return true;
  //   case ConnectivityResult.ethernet:
  //     return true;
  //   case ConnectivityResult.none:
  //     return false;
  //   default:
  //     return false;
  // }
  try {
    final result = await InternetAddress.lookup('www.google.com');
    if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
      return true;
    }
  } on SocketException catch (_) {
    return false;
  }
}
