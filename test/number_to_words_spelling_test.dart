import 'package:flutter_test/flutter_test.dart';
import 'package:number_to_words_spelling/number_to_words_spelling.dart';

void main() {
  test('adds one to input values', () {
    expect(NumberWordsSpelling.toWord('3','en_US'), 'three');
    expect(NumberWordsSpelling.toWord('750','en_US'), 'seven hundred and fifty');
    expect(NumberWordsSpelling.toWord('0','en_US'), 'zero');
    expect(() => NumberWordsSpelling.toWord(null,'en_US'), throwsNoSuchMethodError);
  });
}
