class Payment {
  final String idDevice;
  final String keyIdempotent;
  final String nameUser;
  final String email;
  final String rateId;
  final String amount;
  final String currency;
  final String description;
  final String nameRate;

  const Payment({
    required this.idDevice,
    required this.keyIdempotent,
    required this.nameUser,
    required this.email,
    required this.rateId,
    required this.amount,
    required this.currency,
    required this.description,
    required this.nameRate
});

  Map toJson() => {
      'id_device': idDevice,
      'key_idempotent': keyIdempotent,
      'name_user': nameUser,
      'email': email,
      'rate_id': rateId,
      'amount': amount,
      'currency': currency,
      'description': description,
      'name_rate': nameRate
    };
}
