library number_words_spelling;
import 'src/en.dart';
import 'src/id.dart';

class NumberWordsSpelling {
  static String toWord(String number, String lang) {
    String _words = "";
    String _result = "";
    if(number==null || number=="") {
      return '';
    }
    switch(lang) {
      case 'en_US' :
        _words = en_US.toWord(number);
        break;
      case 'id'    :
        _words = id.toWord(number);
        break;
    }

    _result = _words.replaceAll("^\\s+", "").replaceAll("\\b\\s{2,}\\b", " ");
    return _result.trim();
  }
}
