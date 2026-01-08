import 'package:flutter/material.dart';

import "package:delightful_toast/delight_toast.dart";
import 'package:delightful_toast/toast/components/toast_card.dart';
import "package:flutter_screenutil/flutter_screenutil.dart";

import "package:cafey_app/utils/image_assets.dart";

enum ToastType { success, warning }

void showCafeyToast(BuildContext context, String message, ToastType type) {
  DelightToastBar(
    builder: (context) {
      return ToastCard(
        title: Center(
          child: Text(
            message,
            style: TextStyle(fontWeight: FontWeight.w700, fontSize: 15.0.sp),
          ),
        ),
        leading: ImageIcon(
          type == ToastType.warning
              ? toastAlertFilledIcon
              : toastSuccessFilledIcon,
          color: Colors.brown,
          size: 30.h,
        ),
        trailing: IconButton(
          icon: ImageIcon(
            toastCloseFilledIcon,
            color: Colors.brown,
            size: 15.h,
          ),
          padding: EdgeInsets.symmetric(vertical: 10.h, horizontal: 10.w),
          onPressed: () {
            DelightToastBar.removeAll();
          },
        ),
      );
    },
    autoDismiss: true,
    snackbarDuration: Duration(seconds: 5),
  ).show(context);
}
