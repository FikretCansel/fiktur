class PacketPropertyNew{
  int id=0;
  String description="";
  int packageId=0;

  PacketPropertyNew(this.id,this.description,this.packageId);

  factory PacketPropertyNew.fromJson(Map<String, dynamic> json) {
    return PacketPropertyNew(
        json['id'],
        json['description'],
        json['packageId']
    );
  }
}