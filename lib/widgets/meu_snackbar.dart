import "package:flutter/material.dart";

mostrarSnackBar({
  required BuildContext context,
  required texto,
  bool isErro = true,
}) {
  SnackBar snackBar = SnackBar(
    content: Text(texto),
    backgroundColor: (isErro) ? Colors.red : Colors.green,
    shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(16))),
    duration: Duration(seconds: 3),
    action: SnackBarAction(
      label: "Ok",
      textColor: Colors.white,
      onPressed: () {
        ScaffoldMessenger.of(context).hideCurrentMaterialBanner();
      },
    ),
  );

  ScaffoldMessenger.of(context).showSnackBar(snackBar);
}

mostrarSnackBar2({
  required BuildContext context,
  required texto,
  bool isErro = true,
}) {
  SnackBar snackBar = SnackBar(
    content: Text(texto),
    backgroundColor: (isErro) ? Colors.red : Colors.green,
    shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(16))),
    duration: Duration(seconds: 1),
  );

  ScaffoldMessenger.of(context).showSnackBar(snackBar);
}
