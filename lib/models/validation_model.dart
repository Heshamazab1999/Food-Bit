class Valid {
  String value;
  String error;

  Valid({this.value, this.error});

  bool isValid() {
    return (value != null && value.isNotEmpty && error == null);
  }
}
