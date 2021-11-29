class TourOrder{
  final int id;
  final int fromCityId;
  final int toCityId;
  final DateTime startDate;
  final DateTime finishDate;
  final int userId;
  final int packetId;
  final String description;
  final String name;


  TourOrder({
    required this.id,
    required this.fromCityId,
    required this.toCityId,
    required this.startDate,
    required this.finishDate,
    required this.description,
    required this.userId,
    required this.packetId,
    required this.name,
  });

  // TourOrder.id({
  //   required this.fromCityId,
  //   required this.toCityId,
  //   required this.startDate,
  //   required this.finishDate,
  //   required this.description,
  //   required this.name,
  // });

  factory TourOrder.fromJson(Map<String, dynamic> json) {
    return TourOrder(
        id : json['id'],
        fromCityId : json['fromCityId'],
        toCityId : json['toCityId'],
        startDate : DateTime.parse(json['startDate'].toString()),
        finishDate : DateTime.parse(json['finishDate'].toString()),
        description : json['description'],
        name : json['name'],
        userId:json['userId'],
        packetId:json['packetId']
    );
  }
}