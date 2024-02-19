import 'package:flutter/animation.dart';
import 'package:flutter/scheduler.dart';

class MultiTickerProvider implements TickerProvider {
  List<Ticker> _tickers = [];

  @override
  Ticker createTicker(TickerCallback onTick) {
    final ticker = Ticker(onTick);
    _tickers.add(ticker);
    return ticker;
  }

  void disposeAll() {
    for (final ticker in _tickers) {
      ticker.dispose();
    }
    _tickers.clear();
  }
}