class Vinyl{
  int id;
  int albumId;
  String alternativeName;
  int releaseYear;
  String label;
  String catalogCode;
  bool firstPrint;
  String country;
  String notes;
  DateTime createDate;
  DateTime updateDate;

  Vinyl({required this.id, required this.albumId, required this.alternativeName, required this.releaseYear, required this.label, required this.catalogCode, required this.firstPrint, required this.country, required this.notes, required this.createDate, required this.updateDate});
}