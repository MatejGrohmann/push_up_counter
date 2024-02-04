import 'package:flutter/material.dart';

mixin class NotificationUtil {
  static void showSnackBarMessage({
    required BuildContext context,
    required String message,
    SnackBarAction? action,
  }) {
    final snackBar = SnackBar(
      content: Text(message),
      action: action,
    );
    ScaffoldMessenger.maybeOf(context)
      ?..hideCurrentSnackBar()
      ..showSnackBar(snackBar);
  }

  static void showSnackBarError({
    required BuildContext context,
    required String message,
    SnackBarAction? action,
  }) {
    final ThemeData theme = Theme.of(context);
    final snackBar = SnackBar(
      content: Text(
        message,
        style: TextStyle(color: theme.colorScheme.onErrorContainer),
      ),
      action: action,
      backgroundColor: theme.colorScheme.errorContainer,
    );
    ScaffoldMessenger.maybeOf(context)
      ?..hideCurrentSnackBar()
      ..showSnackBar(snackBar);
  }

  static Future<bool> showConfirmationDialog({
    required BuildContext context,
    required String title,
    required String content,
  }) async {
    return await showDialog<bool?>(
          context: context,
          builder: (context) {
            return AlertDialog(
              title: Text(title),
              content: Text(content),
              actions: [
                TextButton(
                  onPressed: () => Navigator.pop(context, false),
                  child: const Text('Cancel'),
                ),
                TextButton(
                  onPressed: () {
                    Navigator.pop(context, true);
                  },
                  child: const Text('Confirm'),
                ),
              ],
            );
          },
        ) ??
        false;
  }
}
