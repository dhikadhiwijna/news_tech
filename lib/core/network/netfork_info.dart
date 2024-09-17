import 'package:news_us_tech/core/network/network.dart';

class InternetInfoImpl implements InternetInfo {
  final InternetInfo connectionChecker;

  InternetInfoImpl(this.connectionChecker);

  @override
  Future<bool> get isConnected => connectionChecker.isConnected;
}
