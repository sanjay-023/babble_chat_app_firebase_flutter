class MessageModel {
  String? message;
  String? sendBy;
  MessageModel();

  MessageModel.fromSnapshot(snapshot)
      : message = snapshot.data()['message'],
        sendBy = snapshot.data()['sendby'];
}
