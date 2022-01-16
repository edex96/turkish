library turkish;

final _Turkish turkish = _Turkish();

class _Turkish {
  final int _latinCapitalLetterICode = 0x49;
  final int _latinSmallLetterICode = 0x69;

  ///
  String toCamelCase(String? input) {
    if (input == null) {
      return '';
    }
    if (input.isEmpty) {
      return '';
    }
    if (input.length == 1) {
      return _toUpper1Length(input);
    }

    final List<String> words = input.split(' ');
    if (words.length == 1) {
      final String _t1 = _toUpper1Length(words[0].substring(0, 1));
      final String _t2 = toLowerCase(words[0].substring(1));
      return _t1 + _t2;
    }

    String result = '';
    for (final String word in words) {
      result += _toUpper1Length(word.substring(0, 1)) +
          toLowerCase(word.substring(1)) +
          ' ';
    }
    return result;
  }

  /*
    Returns upper case form of a Turkish String.
  */
  String toUpperCase(String input) {
    if (input.isEmpty) return "";
    if (input.length == 1) return _toUpper1Length(input);
    var buffer = StringBuffer();
    List<int> toAppend = <int>[];
    for (int codeUnit in input.codeUnits) {
      if (codeUnit == _latinSmallLetterICode) {
        if (toAppend.isNotEmpty) {
          buffer.write(String.fromCharCodes(toAppend).toUpperCase());
          toAppend.clear();
        }
        buffer.write("İ");
      } else {
        toAppend.add(codeUnit);
      }
    }
    if (toAppend.isNotEmpty) {
      buffer.write(String.fromCharCodes(toAppend).toUpperCase());
    }
    return buffer.toString();
  }

  String _toUpper1Length(String input) {
    if (input.codeUnitAt(0) == _latinSmallLetterICode) {
      return "İ";
    } else {
      return input.toUpperCase();
    }
  }

  /*
    Returns lower case form of a Turkish String.
  */
  String toLowerCase(String input) {
    if (input.isEmpty) return "";
    if (input.length == 1) return _toLower1Length(input);
    var buffer = StringBuffer();
    List<int> toAppend = <int>[];
    for (int codeUnit in input.codeUnits) {
      if (codeUnit == _latinCapitalLetterICode) {
        if (toAppend.isNotEmpty) {
          buffer.write(String.fromCharCodes(toAppend).toLowerCase());
          toAppend.clear();
        }
        buffer.write("ı");
      } else {
        toAppend.add(codeUnit);
      }
    }
    if (toAppend.isNotEmpty) {
      buffer.write(String.fromCharCodes(toAppend).toLowerCase());
    }
    return buffer.toString();
  }

  String _toLower1Length(String input) {
    if (input.codeUnitAt(0) == _latinCapitalLetterICode) {
      return "ı";
    } else {
      return input.toLowerCase();
    }
  }

  /*
    Returns Title cased form of a Turkish String.
  */
  String toTitleCase(String input) {
    if (input.isEmpty) return "";
    if (input.length == 1) return _toUpper1Length(input);
    return "${_toUpper1Length(input.substring(0, 1))}${toLowerCase(input.substring(1))}";
  }
}
