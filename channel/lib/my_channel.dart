import 'dart:async';

import 'package:flutter/services.dart';

class MyChannel {
  final String name;
  final MessageCodec codec;
  final BinaryMessenger binaryMessenger;
  const MyChannel(this.name, this.codec,
      {this.binaryMessenger = defaultBinaryMessenger});

  Future<String> send(String msg) async {
    var data = codec.encodeMessage(msg);
    var result = await defaultBinaryMessenger.send(name, data);
    return codec.decodeMessage(result);
  }

  Stream<String> eventStream(String msg) {
    var controller = StreamController<String>.broadcast();
    defaultBinaryMessenger.setMessageHandler(name, (data) {
      if (data == null) controller.close();
      var value = codec.decodeMessage(data);
      controller.add(value);
      return Future.value(data);
    });
    Future(() async {
      await for (var _ in controller.stream) {
        send(msg);
      }
    });
     send(msg);
    return controller.stream;
  }
}
