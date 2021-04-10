// ignore: import_of_legacy_library_into_null_safe
import 'package:flutter_flexible_toast/flutter_flexible_toast.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class ToastService {
  
  show(String message) {
    FlutterFlexibleToast.showToast(
        message: message, radius: 8);
  }

  showInCenter(String message) {
    FlutterFlexibleToast.showToast(
        message: message,
        radius: 8,
        toastGravity: ToastGravity.CENTER);
  }
}
