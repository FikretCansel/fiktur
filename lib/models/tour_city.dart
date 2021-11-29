class TourCity{
  int id=0;
  String name="";

  TourCity(this.id,this.name);

  factory TourCity.fromJson(Map<String, dynamic> json) {
    return TourCity(
      json['id'],
      json['name'],
    );
  }
}