import 'dart:typed_data';

import 'package:bencode_dart/bencode_dart.dart';

mixin MetaDataMessager {}

Uint8List? createRequestMessage(int piece) {
  // {'msg_type': 0, 'piece': 0}
  var message = {};
  message['msg_type'] = 0;
  message['piece'] = piece;
  return encode(message);
}

Uint8List? createRejectMessage(int piece) {
  // {'msg_type': 2, 'piece': 0}
  var message = {};
  message['msg_type'] = 2;
  message['piece'] = piece;
  return encode(message);
}

Uint8List? createDataMessage(int piece, List<int> bytes) {
  // {'msg_type': 1, 'piece': 0 , 'total_size' : xxxx}xxxx
  var message = {};
  message['msg_type'] = 1;
  message['piece'] = piece;
  message['total_size'] = bytes.length;
  return encode(message);
}
