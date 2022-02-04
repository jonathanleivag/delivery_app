import 'package:intl/intl.dart' show NumberFormat;
import 'package:intl/number_symbols.dart' show NumberSymbols;
import 'package:intl/number_symbols_data.dart' show numberFormatSymbols;

class NumberToPriceHelper {
  final _clCLP = const NumberSymbols(
    NAME: "cl_CLP",
    DECIMAL_SEP: ',',
    GROUP_SEP: '.',
    PERCENT: '%',
    ZERO_DIGIT: '0',
    PLUS_SIGN: '+',
    MINUS_SIGN: '-',
    EXP_SYMBOL: 'E',
    PERMILL: '\u2030',
    INFINITY: '\u221E',
    NAN: 'NaN',
    DECIMAL_PATTERN: '#,##0.###',
    SCIENTIFIC_PATTERN: '#E0',
    PERCENT_PATTERN: '#,##0%',
    CURRENCY_PATTERN: '\u00A4\u00A0#,##0.00',
    DEF_CURRENCY_CODE: 'CLP',
  );

  String clp(int price, {bool symbol = false}) {
    numberFormatSymbols['cl_CLP'] = _clCLP;

    final formatCurrency = NumberFormat.currency(
      decimalDigits: 0,
      locale: 'cl_CLP',
      symbol: symbol ? '\$' : null,
    );
    return formatCurrency.format(price);
  }
}
