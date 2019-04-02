class id {
  static String toWord(String _pnum, [int _power = 0, String _powsuffix = '']) {
    String _minus = 'minus'; // minus sign
    Map<int, String> _exponent = {
      0: '',
      3: 'ribu',
      6: 'juta',
      9: 'milyar',
      12: 'trilyun',
      24: 'quadrillion',
      30: 'quintillion',
      36: 'sextillion',
      42: 'septillion',
      48: 'octillion',
      54: 'nonillion',
      60: 'decillion',
      66: 'undecillion',
      72: 'duodecillion',
      78: 'tredecillion',
      84: 'quattuordecillion',
      90: 'quindecillion',
      96: 'sexdecillion',
      102: 'septendecillion',
      108: 'octodecillion',
      114: 'novemdecillion',
      120: 'vigintillion',
      192: 'duotrigintillion',
      600: 'centillion'
    };

    List<String> _digits = [
      'nol',
      'satu',
      'dua',
      'tiga',
      'empat',
      'lima',
      'enam',
      'tujuh',
      'delapan',
      'sembilan'
    ];

    String _sep = ' ';

    String _num = _pnum;
    String _ret = '';
    if (_num.substring(0, 1) == '-') {
      _ret = _sep + _minus;
      _num = _num.substring(1);
    }

    _num = _num.trim().replaceAll("^0+", "");
    if (_num.length > 4) {
      int _maxp = _num.length - 1;
      int _curp = _maxp;
      int _p=0;
      for (_p = _maxp; _p > 0; --_p) {
        // power
        if (_exponent[_p] != null) {
          String _snum = subStr(_num,_maxp - _curp, _maxp - _curp+_curp - _p + 1);
          _snum = _snum.replaceAll("^0+", "");
          if (_snum != '') {
//            String _cursuffix = _exponent[_power][count(_exponent[_power])-1];
            String _cursuffix = _exponent[_power];
            if (_powsuffix != '') {
              _cursuffix = _cursuffix + _sep + _powsuffix;
            }
            _ret = _ret + toWord(_snum, _p, _cursuffix);
          }
          _curp = _p - 1;
          continue;
        }
      }
      _num = subStr(_num,_maxp - _curp, _curp - _p + 1);
      if (_num == 0) {
        return _ret;
      }
    } else if (_num == 0 || _num == '') {
      return _sep + _digits[0];
    }
    int _h = 0;
    int _t = 0;
    int _d = 0;
    int _th = 0;

    if (_num.length == 0) {
      return '';
    }

    if (_num.length >= 4) {
      _th = int.parse(subStr(_num,-4, 1));
      if (_th != 0) {
        _ret =
            _ret + _sep + (_th == 1 ? 'seribu' : _digits[_th] + _sep + 'ribu');
      }
    }

    if (_num.length >= 3) {
      _h = int.parse(subStr(_num,-3, 1));
      if (_h != 0) {
        _ret =
            _ret + _sep + (_h == 1 ? 'seratus' : _digits[_h] + _sep + 'ratus');
      }
    }
    if (_num.length >= 1) {
      _d = int.parse(subStr(_num,-1, 1));
    }

    if (_num.length >= 2) {
      _t = int.parse(subStr(_num,-2, 1));
      if (_t == 1) {
        if (_d == 0) {
          _ret = _ret + _sep + 'sepuluh';
        } else if (_d == 1) {
          _ret = _ret + _sep + 'sebelas';
        } else {
          _ret = _ret + _sep + _digits[_d] + ' belas';
        }
      } else {
        _ret = _ret + _sep + _digits[_t] + ' puluh';
      }
    }

    if (_t != 1 && _d > 0) {
      // add digits only in <0>,<1,9> and <21,inf>
      // add minus sign between [2-9] and digit
      if (_t > 1) {
        _ret = _ret + ' ' + _digits[_d];
      } else {
        _ret = _ret + _sep + _digits[_d];
      }
    }

    if (_power > 0) {
      if (_exponent[_power] != null) {
        _ret = _ret + _sep + _exponent[_power];
      } else {
        return null;
      }
    }

    if (_powsuffix != '') {
      _ret = _ret + _sep + _powsuffix;
    }

    return _ret;
  }
  static String subStr(String str, int pos, int len) {
    if(pos>=0) {
      return str.substring(pos, pos+len);
    }
    else {
      String ret = str.substring(str.length+pos,str.length+pos+len);
      return ret;
    }
  }
}
