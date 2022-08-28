part of 'chats.dart';

class DetailChatPage extends StatefulWidget {
  final String name, imageUrl;

  const DetailChatPage({Key? key, required this.name, required this.imageUrl})
      : super(key: key);

  @override
  State<DetailChatPage> createState() => _DetailChatPageState();
}

class _DetailChatPageState extends State<DetailChatPage> {
  TextEditingController _controllerMessage = TextEditingController();
  List<ChatMessage> messages = [
    ChatMessage(messageContent: "Hello, ", messageType: "receiver"),
    ChatMessage(messageContent: "How have you been?", messageType: "receiver"),
    ChatMessage(
        messageContent: "Hey, I am doing fine dude. wbu?",
        messageType: "sender"),
    ChatMessage(messageContent: "ehhhh, doing OK.", messageType: "receiver"),
    ChatMessage(
        messageContent: "Is there any thing wrong?", messageType: "sender"),
  ];

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(80.0),
        child: SafeArea(
            bottom: false,
            child: Container(
                padding: const EdgeInsets.symmetric(horizontal: edge / 2),
                child: ListView(primary: false, shrinkWrap: true, children: [
                  SizedBox(
                    height: size.height / edge,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: edge / 2),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        CircleAvatar(
                          backgroundImage: NetworkImage(widget.imageUrl),
                          maxRadius: 20,
                        ),
                        SizedBox(
                          width: size.width / edge,
                        ),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Text(
                                widget.name,
                                style: regularTextStyle.copyWith(
                                    fontSize: 16, fontWeight: FontWeight.w600),
                              ),
                              const SizedBox(
                                height: 6,
                              ),
                              Text(
                                "Online",
                                style: regularTextStyle.copyWith(
                                    color: Colors.grey.shade600, fontSize: 13),
                              ),
                            ],
                          ),
                        ),
                        Align(
                          alignment: Alignment.centerRight,
                          child: Icon(
                            Icons.settings,
                            color: blackColor.withAlpha(200),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: size.height / edge,
                  ),
                ]))),
      ),
      body: Stack(
        children: <Widget>[
          ListView.builder(
            itemCount: messages.length,
            shrinkWrap: true,
            padding: const EdgeInsets.only(top: 10, bottom: 10),
            physics: const BouncingScrollPhysics(),
            itemBuilder: (context, index) {
              return Container(
                padding: const EdgeInsets.symmetric(
                    horizontal: edge / 2, vertical: edge / 3),
                child: Align(
                  alignment: (messages[index].messageType == "receiver"
                      ? Alignment.topLeft
                      : Alignment.topRight),
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: (messages[index].messageType == "receiver"
                          ? grayColor.withAlpha(50)
                          : blueColor.withAlpha(100)),
                    ),
                    padding: const EdgeInsets.all(edge / 2),
                    child: Text(
                      messages[index].messageContent,
                      style: regularTextStyle.copyWith(fontSize: 13),
                    ),
                  ),
                ),
              );
            },
          ),
          Align(
            alignment: Alignment.bottomLeft,
            child: Container(
              padding: const EdgeInsets.symmetric(
                  horizontal: edge / 2, vertical: edge / 3),
              height: 60,
              width: double.infinity,
              color: Colors.white,
              child: Row(
                children: <Widget>[
                  GestureDetector(
                    onTap: () {},
                    child: Container(
                      height: 30,
                      width: 30,
                      decoration: BoxDecoration(
                        color: blueColor.withAlpha(200),
                        borderRadius: BorderRadius.circular(30),
                      ),
                      child: Icon(
                        Icons.add,
                        color: whiteColor,
                        size: 20,
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 15,
                  ),
                  Flexible(
                    child: TextField(
                      controller: _controllerMessage,
                      decoration: const InputDecoration(
                          hintText: "Write message...",
                          hintStyle: TextStyle(color: Colors.black54),
                          border: InputBorder.none),
                    ),
                  ),
                  const SizedBox(
                    width: 15,
                  ),
                  FloatingActionButton(
                    onPressed: () {
                      if (_controllerMessage.text == '') return;

                      ChatMessage chatMessage = ChatMessage(
                          messageContent: _controllerMessage.text,
                          messageType: 'sender');

                      setState(() {
                        messages.add(chatMessage);
                        _controllerMessage.text = '';
                      });
                    },
                    child: Icon(
                      Icons.send,
                      color: whiteColor,
                      size: 18,
                    ),
                    backgroundColor: blueColor,
                    elevation: 0,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
