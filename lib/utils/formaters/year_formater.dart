String yearStringFormater(String date){
  DateTime dateTime = DateTime.parse(date);
  return dateTime.year.toString();
}