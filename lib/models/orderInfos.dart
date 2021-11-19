class OrderInfos{
   late int id;
   late String name;
   late int fromCity;
   late int toCity;
   late DateTime startDate;
   late DateTime finishDate;
   late String description;

   OrderInfos.empty();
   OrderInfos(this.id,this.fromCity,this.toCity,this.startDate,this.finishDate,this.description,this.name);

}