import 'package:internet_connection_checker/internet_connection_checker.dart';

abstract class NetworkInfos {
  Future<bool> get isConnected;
}

class NetworkInfosImpl implements NetworkInfos {
  final InternetConnectionChecker connectionChecker;

  NetworkInfosImpl({required this.connectionChecker});

  @override
  Future<bool> get isConnected async =>
      await InternetConnectionChecker().hasConnection;
}
