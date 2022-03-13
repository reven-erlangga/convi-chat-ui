part of 'chats.dart';

class ChatPage extends StatefulWidget {
  const ChatPage({Key? key}) : super(key: key);

  @override
  State<ChatPage> createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  List<ChatUsers> chatUsers = [
    ChatUsers(
        name: "Jane Russel",
        messageText: "Awesome Setup",
        imageURL: "https://randomuser.me/api/portraits/women/1.jpg",
        time: "Now"),
    ChatUsers(
        name: "Glady's Murphy",
        messageText: "That's Great",
        imageURL: "https://randomuser.me/api/portraits/men/1.jpg",
        time: "Yesterday"),
    ChatUsers(
        name: "Jorge Henry",
        messageText: "Hey where are you?",
        imageURL: "https://randomuser.me/api/portraits/men/2.jpg",
        time: "31 Mar"),
    ChatUsers(
        name: "Philip Fox",
        messageText: "Busy! Call me in 20 mins",
        imageURL: "https://randomuser.me/api/portraits/men/3.jpg",
        time: "28 Mar"),
    ChatUsers(
        name: "Debra Hawkins",
        messageText: "Thankyou, It's awesome",
        imageURL: "https://randomuser.me/api/portraits/women/2.jpg",
        time: "23 Mar"),
    ChatUsers(
        name: "Jacob Pena",
        messageText: "will update you in evening",
        imageURL: "https://randomuser.me/api/portraits/men/4.jpg",
        time: "17 Mar"),
    ChatUsers(
        name: "Andrey Jones",
        messageText: "Can you please share the file?",
        imageURL: "https://randomuser.me/api/portraits/men/5.jpg",
        time: "24 Feb"),
    ChatUsers(
        name: "John Wicks",
        messageText: "How are you?",
        imageURL: "https://randomuser.me/api/portraits/men/6.jpg",
        time: "18 Feb"),
  ];

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(edge / 2),
        child: SafeArea(
            bottom: false,
            child: SingleChildScrollView(
                primary: true,
                child: ListView(
                  primary: false,
                  shrinkWrap: true,
                  children: [
                    SizedBox(
                      height: size.height / edge,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(left: edge),
                              child: Text(
                                'Chats',
                                style: blackTextStyle.copyWith(fontSize: 24.0),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: edge),
                              child: Text(
                                'Chat with your frieds!',
                                style: grayTextStyle.copyWith(fontSize: 16.0),
                              ),
                            ),
                          ],
                        ),
                        Container(
                          padding: const EdgeInsets.only(
                              left: 8, right: 8, top: 2, bottom: 2),
                          height: 30,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(30),
                            color: blueColor.withAlpha(50),
                          ),
                          child: Row(
                            children: <Widget>[
                              Icon(
                                Icons.add,
                                color: blueColor,
                                size: 20,
                              ),
                              const SizedBox(
                                width: 2,
                              ),
                              Text(
                                "Add",
                                style: regularTextStyle.copyWith(
                                  fontSize: 14.0,
                                ),
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                    SizedBox(
                      height: size.height / edge,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: edge / 2),
                      child: TextField(
                        decoration: InputDecoration(
                          hintText: "Search...",
                          hintStyle: TextStyle(color: Colors.grey.shade600),
                          prefixIcon: Icon(
                            Icons.search,
                            color: Colors.grey.shade600,
                            size: 20,
                          ),
                          filled: true,
                          fillColor: Colors.grey.shade100,
                          contentPadding: const EdgeInsets.all(8),
                          enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20),
                              borderSide:
                                  BorderSide(color: Colors.grey.shade100)),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: size.height / edge,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: edge / 2),
                      child: ListView.builder(
                        itemCount: chatUsers.length,
                        primary: false,
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemBuilder: (context, index) {
                          return Column(
                            children: [
                              ConversationList(
                                name: chatUsers[index].name,
                                messageText: chatUsers[index].messageText,
                                imageUrl: chatUsers[index].imageURL,
                                time: chatUsers[index].time,
                                isMessageRead:
                                    (index == 0 || index == 3) ? true : false,
                              ),
                              const Divider()
                            ],
                          );
                        },
                      ),
                    ),
                  ],
                ))),
      ),
    );
  }
}
