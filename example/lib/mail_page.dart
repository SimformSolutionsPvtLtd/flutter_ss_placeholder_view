import 'package:example/mail_tile.dart';
import 'package:example/values/vectors.dart';
import 'package:flutter/material.dart';
import 'package:rive/rive.dart';
import 'package:ss_placeholder_view/ssplaceholderview.dart';

class MailPage extends StatefulWidget {
  const MailPage({Key? key}) : super(key: key);

  @override
  _MailPageState createState() => _MailPageState();
}

class _MailPageState extends State<MailPage> {
  List<Mail> mails = [];
  PlaceHolderState placeholderState = PlaceHolderState.loading;
  String selectedMenuItem = 'GIF';
  String placeholderImage = 'assets/christmas.gif';
  Widget? placeholderWidget;
  int id = 1;

  @override
  void initState() {
    super.initState();
  }

  void _addData() {
    mails.addAll(
      [
        Mail(
          sender: 'Medium',
          sub: 'Showcase View',
          msg: 'Check new showcase View',
          date: '25 May',
          isUnread: false,
        ),
        Mail(
          sender: 'Quora',
          sub: 'New Question for you',
          msg: 'Hi, There is new question for you',
          date: '22 May',
          isUnread: false,
        ),
        Mail(
          sender: 'Google',
          sub: 'Flutter 1.5',
          msg: 'We have launched Flutter 1.5',
          date: '20 May',
          isUnread: true,
        ),
        Mail(
          sender: 'Github',
          sub: 'Showcase View',
          msg: 'New star on your showcase view.',
          date: '21 May ',
          isUnread: false,
        ),
        Mail(
          sender: 'Simform',
          sub: 'Credit card Plugin',
          msg: 'Check out our credit card plugin',
          date: '19 May',
          isUnread: true,
        ),
      ],
    );
  }

  void _clearData() => mails.clear();

  void _getData() {
    _addData();
    Future.delayed(const Duration(milliseconds: 1500));
    setState(() {
      placeholderState = PlaceHolderState.success;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xffEE5366),
        centerTitle: true,
        title: const Text(
          'Empty PlaceHolder',
          style: TextStyle(color: Colors.white),
        ),
        actions: [
          PopupMenuButton(
            icon: const Icon(
              Icons.more_vert,
              color: Colors.white,
            ),
            onSelected: (value) {
              setState(() {
                selectedMenuItem = value as String;
                _changePlaceHolderImage(selectedMenuItem);
              });
            },
            itemBuilder: (context) => [
              const PopupMenuItem(
                child: Text("Image"),
                value: "Image",
              ),
              const PopupMenuItem(
                child: Text("SVG"),
                value: "SVG",
              ),
              const PopupMenuItem(
                child: Text("Custom"),
                value: "Custom",
              ),
              const PopupMenuItem(
                child: Text("GIF"),
                value: "GIF",
              ),
            ],
          )
        ],
      ),
      body: SafeArea(
        bottom: false,
        child: Column(
          children: <Widget>[
            const SizedBox(
              height: 10,
            ),
            const Padding(padding: EdgeInsets.only(top: 8)),
            Row(
              children: [
                const SizedBox(width: 8),
                Expanded(
                  child: ElevatedButton(
                    onPressed: () {
                      _clearData();
                      setState(() {
                        placeholderState = PlaceHolderState.loading;
                      });
                    },
                    child: const Text('Loading'),
                    style: ButtonStyle(
                      backgroundColor:
                          MaterialStateProperty.all<Color>(Colors.white),
                    ),
                  ),
                ),
                const SizedBox(width: 8),
                Expanded(
                  child: ElevatedButton(
                    onPressed: () {
                      _clearData();
                      setState(() {
                        placeholderState = PlaceHolderState.success;
                      });
                    },
                    child: const Text('Success'),
                    style: ButtonStyle(
                      backgroundColor:
                          MaterialStateProperty.all<Color>(Colors.white),
                    ),
                  ),
                ),
                const SizedBox(width: 8),
                Expanded(
                  child: ElevatedButton(
                    onPressed: () {
                      _clearData();
                      setState(() {
                        placeholderState = PlaceHolderState.error;
                      });
                    },
                    child: const Text('Error'),
                    style: ButtonStyle(
                      backgroundColor:
                          MaterialStateProperty.all<Color>(Colors.white),
                    ),
                  ),
                ),
                const SizedBox(width: 8),
              ],
            ),
            Expanded(
              child: SSPlaceholder(
                state: placeholderState,
                child: ListView.builder(
                    physics: const BouncingScrollPhysics(),
                    itemBuilder: (context, index) {
                      return MailTile(mails[index % mails.length]);
                    }),
                showPlaceHolder: mails.isEmpty,
                placeHolderImageConfig: PlaceHolderImageConfig(
                  extraPadding: const EdgeInsets.only(bottom: 10),
                  image: placeholderImage,
                  widget: placeholderWidget,
                  animationName: 'walk',
                ),
                loadingConfig: LoadingConfig(
                  title: 'Please Wait...',
                  subtitle: 'Loading your data...',
                  widgetName: LoaderName.threeBounce,
                  color: const Color(0xffee5366),
                  size: 40,
                  isLoadingOnTop: false,
                ),
                errorConfig: ErrorConfig(
                  emptyTitle: 'No Data Found',
                  emptySubtitle: 'Try again..!',
                  errorTitle: 'Error...',
                  errorSubtitle:
                      'An error occurred while loading data. Please retry.',
                ),
                buttonConfig: ButtonConfig(
                  buttonColor: const Color(0xffee5366),
                  buttonText: 'Refresh',
                  buttonWidth: 130,
                  buttonHeight: 46,
                  buttonTextStyle: const TextStyle(
                    fontSize: 18,
                    fontFamily: 'RobotoMono',
                    color: Colors.white,
                  ),
                ),
                titleTextStyle: const TextStyle(
                  fontSize: 25,
                  fontFamily: 'RobotoMono',
                ),
                subTitleTextStyle: const TextStyle(
                  fontSize: 20,
                  fontFamily: 'RobotoMono',
                ),
                onButtonClick: _getData,
              ),
            )
          ],
        ),
      ),
    );
  }

  void _changePlaceHolderImage(String? newValue) {
    switch (newValue) {
      case 'Image':
        placeholderWidget = null;
        placeholderImage = 'assets/loading.png';
        break;

      case 'SVG':
        placeholderWidget = null;
        placeholderImage = Vectors.drawLoading;
        break;

      case 'Custom':
        placeholderImage = '';
        placeholderWidget = const SizedBox(
          child: RiveAnimation.asset(
            'assets/riv/liquid_download.riv',
            fit: BoxFit.contain,
          ),
        );
        break;

      case 'GIF':
        placeholderWidget = null;
        placeholderImage = 'assets/christmas.gif';
        break;

      default:
        placeholderWidget = null;
        placeholderImage = 'assets/loading.png';
        break;
    }
  }
}

class Mail {
  String sender;
  String sub;
  String msg;
  String date;
  bool isUnread;

  Mail({
    required this.sender,
    required this.sub,
    required this.msg,
    required this.date,
    required this.isUnread,
  });
}
