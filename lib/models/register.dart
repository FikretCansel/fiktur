class Register{
  late String firstName;
  late String lastName;
  late String email;
  late String password;

  Register(this.firstName,this.lastName,this.email,this.password);

  Register.profileInfo(String? firstName,String? lastName,String? email){
    this.firstName=firstName!;
    this.lastName=lastName!;
    this.email=email!;
  }
}