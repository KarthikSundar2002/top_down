import 'package:web_socket_channel/web_socket_channel.dart';
import 'package:uuid/uuid.dart';

class GameSockets {
  late String serverUrl;
  late final channel;

  GameSockets(String url) {
    this.serverUrl = url;
  }

  void init() {
    var uuid = Uuid().v1();
    channel = WebSocketChannel.connect(Uri.parse(serverUrl + "/" + uuid));
  }

  void listen() {
    channel.stream.listen((data) {
      print(data);
    });
  }

  void send(String message) {
    print(message);
    channel.sink.add(message);
    print(channel);
  }
}
