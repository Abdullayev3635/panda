import 'package:flutter/material.dart';
import 'package:toastification/toastification.dart';

void showErrorToast(BuildContext context, {required String message}) {
  toastification.show(
    context: context,
    title: Text(message),
    type: ToastificationType.error,
    style: ToastificationStyle.fillColored,
    alignment: Alignment.topCenter,
    autoCloseDuration: const Duration(seconds: 3),
    icon: const Icon(Icons.warning_amber_rounded, color: Colors.white),
    closeButtonShowType: CloseButtonShowType.always,
  );
}

void showSuccessToast(BuildContext context, {required String message}) {
  toastification.show(
    context: context,
    title: Text(message),
    type: ToastificationType.success,
    style: ToastificationStyle.fillColored,
    alignment: Alignment.topCenter,
    autoCloseDuration: const Duration(seconds: 3),
    icon: const Icon(Icons.check, color: Colors.white),
    closeButtonShowType: CloseButtonShowType.always,
  );
}
