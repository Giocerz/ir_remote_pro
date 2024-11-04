import 'dart:async';
import 'dart:convert';
import 'dart:io';

class TcpSocket {
  TcpSocket(this.host, this.port);
  final String host;
  final int port;
  Socket? _socket;
  StreamSubscription? _subscription;

  Future<String> connect() async {
    try {
      _socket =
          await Socket.connect(host, port, timeout: const Duration(seconds: 4));
      return ('Conectado');
    } catch (error) {
      return ('Error: $error');
    }
  }

  Future<void> sendRawData(List<int> message) async {
    try {
      if (_socket != null) {
        final List<int> messageCLRF = [
          ...message,
          10,
          13
        ]; 
        _socket!.add(messageCLRF);
      }
    } catch (e) {
      throw ('Error de conexion');
    }
  }

  StreamSubscription<void> listen(void Function(List<int> data)? onData,
      {void Function(dynamic error)? onError,
      void Function()? onDone,
      bool cancelOnError = false}) {
    _subscription = _socket!.listen(
      onData,
      onError: onError,
      onDone: onDone,
      cancelOnError: cancelOnError,
    );
    return _subscription!;
  }

    void cancelListen() {
    _subscription?.cancel();
  }

  void disconnect() {
    _subscription?.cancel();
    _socket?.destroy();
    _socket = null;
  }
}
