import 'package:flutter/material.dart';
import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';

mixin Messages<T extends StatefulWidget> on State<T> {
  void showError(String message) {
    _showSnackbar(
      AwesomeSnackbarContent(
        title: 'Ocorreu um Erro.',
        message: message,
        contentType: ContentType.failure,
        titleFontSize: 18,
        messageFontSize: 14,
      ),
    );
  }

  void showWarning(String message) {
    _showSnackbar(
      AwesomeSnackbarContent(
        title: 'Atenção',
        message: message,
        contentType: ContentType.warning,
        titleFontSize: 20,
        messageFontSize: 16,
      ),
    );
  }

  void showInfo(String message) {
    _showSnackbar(
      AwesomeSnackbarContent(
        title: 'Informação',
        message: message,
        contentType: ContentType.help,
        titleFontSize: 20,
        messageFontSize: 16,
      ),
    );
  }

  void showSuccess(String message) {
    _showSnackbar(
      AwesomeSnackbarContent(
        title: 'Sucesso',
        message: message,
        contentType: ContentType.success,
        titleFontSize: 20,
        messageFontSize: 16,
      ),
    );
  }

  void _showSnackbar(AwesomeSnackbarContent content) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        elevation: 0,
        behavior: SnackBarBehavior.floating,
        padding: const EdgeInsets.only(top: 72.0),
        backgroundColor: Colors.transparent,
        content: content,
      ),
    );
  }
}
