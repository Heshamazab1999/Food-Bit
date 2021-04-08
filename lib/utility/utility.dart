
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

class Utility{
  static displayErrorAlert(String message, String title, BuildContext context,
      {AlertType type = AlertType.error}) async {
    final alert = Alert(
      context: context,
      type: type,
      title: title,
      desc: message,
      style: AlertStyle(
        backgroundColor: Colors.white,
        alertBorder: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30),
        ),
        descStyle: TextStyle(
          color: Colors.grey,
          fontSize: 16,
        ),
        isCloseButton: false,
      ),
      buttons: [
        DialogButton(
          child: Text(
            "موافق",
            style: TextStyle(color: Colors.white, fontSize: 18),
          ),
          onPressed: () {
            Navigator.pop(context);
          },
          // color: K.PRIMARY_COLOR,
          color: Colors.red,
        ),
      ],
    );
    await alert.show();
  }


  static displayConfirmAlert(String message, String title, BuildContext context,
      Function onConfirm) async {
    final alert = Alert(
      context: context,
      type: AlertType.warning,
      title: title,
      desc: message,
      style: AlertStyle(
        backgroundColor: Colors.white,
        alertBorder: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30),
        ),
        descStyle: TextStyle(
          color: Colors.grey,
          fontSize: 16,
        ),
        isCloseButton: false,
      ),
      buttons: [
        DialogButton(
          child: Text(
            "إلغاء",
            style: TextStyle(color: Colors.white, fontSize: 18),
          ),
          onPressed: () {
            Navigator.pop(context);
          },
          color: Colors.grey,
        ),
        DialogButton(
          child: Text(
            "تأكيد",
            style: TextStyle(color: Colors.white, fontSize: 18),
          ),
          onPressed: onConfirm,
          color: Colors.red,
        ),
      ],
    );
    await alert.show();
  }

}