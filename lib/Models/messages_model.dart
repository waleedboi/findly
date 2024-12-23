class MessagesModel {
  String? name;
  String? message;
  String? time;
  int? unreadMessage;
  String? image;
  bool? isRead;
  bool? isOnline;

  MessagesModel(
      {this.name,
      this.message,
      this.time,
      this.unreadMessage,
      this.image,
      this.isRead,
      this.isOnline});
}

List<MessagesModel> tempMessagesList = [
  MessagesModel(
    name: "Bella",
    message: "I’m good thanku how are you?",
    time: "3m ago",
    unreadMessage: 12,
    image: "assets/images/profile1.png",
    isRead: false,
    isOnline: true,
  ),
  MessagesModel(
    name: "Bella",
    message: "I’m good thanku how are you?",
    time: "3m ago",
    unreadMessage: 12,
    image: "assets/images/profile1.png",
    isRead: false,
    isOnline: true,
  ),
  MessagesModel(
    name: "Chris Hampton",
    message: "I will be available at 12 AM. We will discuss further ",
    time: "15m ago",
    unreadMessage: 0,
    image: "assets/images/profile2.png",
    isRead: true,
    isOnline: false,
  ),
  MessagesModel(
    name: "Erlan Sadewa",
    message: "Aight, noted",
    time: "1h ago",
    unreadMessage: 0,
    image: "assets/images/profile3.png",
    isRead: true,
    isOnline: false,
  ),
  MessagesModel(
    name: "Athalia Putri",
    message: "Good morning, did you sleep well?",
    time: "3m ago",
    unreadMessage: 12,
    image: "assets/images/profile5.png",
    isRead: false,
    isOnline: true,
  ),
  MessagesModel(
    name: "Eagle Group",
    message: "How is it going?",
    time: "15m ago",
    unreadMessage: 0,
    image: "assets/images/profile4.png",
    isRead: true,
    isOnline: false,
  ),
  MessagesModel(
    name: "Athalia Putri",
    message: "Aight, noted",
    time: "1h ago ",
    unreadMessage: 0,
    image: "assets/images/profile6.png",
    isRead: false,
    isOnline: true,
  ),
  MessagesModel(
    name: "Erlan Sadewa",
    message: "Aight, noted",
    time: "1h ago",
    unreadMessage: 0,
    image: "assets/images/profile7.png",
    isRead: true,
    isOnline: false,
  ),
];
