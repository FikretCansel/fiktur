class Profile{
  late String firstName;
  late String lastName;
  late String email;

  Profile(String? firstName,String? lastName,String? email){
    this.firstName=firstName!;
    this.lastName=lastName!;
    this.email=email!;
  }
}