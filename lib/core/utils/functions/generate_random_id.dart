import 'dart:math';

String generateRandomId([int length = 20]) {
  const chars = 'abcdefghijklmnopqrstuvwxyz0123456789';
  final rand = Random.secure();

  return List.generate(length, (_) => chars[rand.nextInt(chars.length)]).join();
}
