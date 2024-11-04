// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class ShowSnackBarHelper {
  static void error(BuildContext context, {required String message}) {
    _showSnackBar(
      context,
      message: message,
      icon: const Icon(
        Icons.warning_amber,
        color: Colors.red,
        size: 35,
      ),
      backgroundColor: const Color(0xfffce5e6),
      borderColor: Colors.red,
    );
  }

  static void warning(BuildContext context, {required String message}) {
    _showSnackBar(
      context,
      message: message,
      icon: const Icon(
        Icons.info_outline,
        color: Color(0xffdb9852),
        size: 35,
      ),
      backgroundColor: const Color(0xfffdeddc),
      borderColor: const Color(0xffdb9852),
    );
  }

  static void success(BuildContext context, {required String message}) {
    _showSnackBar(
      context,
      message: message,
      icon: const Icon(
        Icons.check,
        color: Colors.green,
        size: 35,
      ),
      backgroundColor: const Color(0xffc7f9cc),
      borderColor: Colors.green,
    );
  }

  static void _showSnackBar(
    BuildContext context, {
    required String message,
    required Icon icon,
    required Color backgroundColor,
    required Color borderColor,
  }) {
    // Remove any current snackbar
    ScaffoldMessenger.of(context).removeCurrentSnackBar();

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        action: SnackBarAction(
          label: 'Ok',
          onPressed: () {},
          textColor: Colors.black,
        ),
        content: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            icon,
            const Gap(20),
            SizedBox(
              width: 200,
              child: Text(
                message,
                style: const TextStyle(
                    fontWeight: FontWeight.bold, color: Colors.black),
              ),
            ),
          ],
        ),
        backgroundColor: backgroundColor,
        shape: RoundedRectangleBorder(
          side: BorderSide(
            width: 3,
            color: borderColor,
          ),
        ),
      ),
    );
  }
}
