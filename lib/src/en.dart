import 'package:intl/intl.dart';

class en_US{
  static String toWord(String pnumber) {
    int number = int.parse(pnumber);
// 0 to 999 999 999 999
    if (number == 0) {
      return "zero";
    }
// pad with "0"
    String mask = "000000000000";
    final df = new NumberFormat(mask);
    String snumber = df.format(number);
// XXXnnnnnnnnn
    int billions = int.parse(snumber.substring(0, 3));
// nnnXXXnnnnnn
    int millions = int.parse(snumber.substring(3, 6));
// nnnnnnXXXnnn
    int hundredThousands = int.parse(snumber.substring(6, 9));
// nnnnnnnnnXXX
    int thousands = int.parse(snumber.substring(9, 12));

    String tradBillions;

    switch (billions) {
      case 0:
        tradBillions = "";
        break;
      case 1:
        tradBillions = _convertLessThanOneThousand(billions) + " billion ";
        break;
      default:
        tradBillions = _convertLessThanOneThousand(billions) + " billion ";
    }
    String result = tradBillions;

    String tradMillions;

    switch (millions) {
      case 0:
        tradMillions = "";
        break;
      case 1:
        tradMillions = _convertLessThanOneThousand(millions) + " million ";
        break;
      default:
        tradMillions = _convertLessThanOneThousand(millions) + " million ";
    }
    result = result + tradMillions;

    String tradHundredThousands;
    switch (hundredThousands) {
      case 0:
        tradHundredThousands = "";
        break;
      case 1:
        tradHundredThousands = "one thousand ";
        break;
      default:
        tradHundredThousands =
            _convertLessThanOneThousand(hundredThousands) + " thousand ";
    }
    result = result + tradHundredThousands;

    String tradThousand;
    tradThousand = _convertLessThanOneThousand(thousands);
    result = result + tradThousand;
    return result;
  }

  static String _convertLessThanOneThousand(int number) {
    List<String> tensNames = [
      "",
      " ten",
      " twenty",
      " thirty",
      " forty",
      " fifty",
      " sixty",
      " seventy",
      " eighty",
      " ninety"
    ];

    List<String> numNames = [
      "",
      " one",
      " two",
      " three",
      " four",
      " five",
      " six",
      " seven",
      " eight",
      " nine",
      " ten",
      " eleven",
      " twelve",
      " thirteen",
      " fourteen",
      " fifteen",
      " sixteen",
      " seventeen",
      " eighteen",
      " nineteen"
    ];
    String soFar;
    if (number % 100 < 20) {
      soFar = numNames[number % 100];
      number = number ~/ 100;
    } else {
      soFar = numNames[number % 10];
      number = number ~/ 10;
      soFar = tensNames[number % 10] + soFar;
      number = number ~/ 10;
    }
    if (number == 0) return soFar;
    return numNames[number] + " hundred" + soFar;
  }
}
