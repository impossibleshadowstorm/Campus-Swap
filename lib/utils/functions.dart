import 'dart:math';

class Functions {
  static int generateRandomNumber(int from, int to) {
    Random random = Random();
    return random.nextInt(to) + from;
  }
}
