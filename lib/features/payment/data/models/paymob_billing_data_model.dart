class PaymobBillingDataModel {
  final String apartment;
  final String firstName;
  final String lastName;
  final String street;
  final String building;
  final String phoneNumber;
  final String city;
  final String country;
  final String email;
  final String floor;
  final String state;

  PaymobBillingDataModel({
    this.apartment = 'NA',
    this.firstName = 'John',
    this.lastName = 'Doe',
    this.street = 'NA',
    this.building = 'NA',
    this.phoneNumber = '201234567890',
    this.city = 'NA',
    this.country = 'NA',
    this.email = 'john.doe@example.com',
    this.floor = 'NA',
    this.state = 'NA',
  });

  // Convert to JSON
  Map<String, dynamic> toJson() {
    return {
      'apartment': apartment,
      'first_name': firstName,
      'last_name': lastName,
      'street': street,
      'building': building,
      'phone_number': phoneNumber,
      'city': city,
      'country': country,
      'email': email,
      'floor': floor,
      'state': state,
    };
  }
}
