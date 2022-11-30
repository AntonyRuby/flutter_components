import 'package:flutter/material.dart';
import 'package:flutter_components/color_resource.dart';
import 'package:flutter_speech/flutter_speech.dart';

// ignore: must_be_immutable
class FlutterSearchField extends StatefulWidget {
  final String? searchHint;
  Function(String)? callback;
  bool isCancelButton;
  bool isMic;
  bool isPrefix;
  final Widget? prefixIcon;
  Function(String str)? onChanged;
  TextEditingController controller;
  Function(String val)? onClose;

  FlutterSearchField(
      {Key? key,
      this.searchHint = 'Search hint',
      this.isCancelButton = false,
      this.isMic = false,
      this.isPrefix = false,
      this.callback,
      required this.controller,
      this.prefixIcon,
      this.onClose,
      this.onChanged})
      : super(key: key);

  @override
  FlutterSearchFieldState createState() => FlutterSearchFieldState();
}

class FlutterSearchFieldState extends State<FlutterSearchField>
    with TickerProviderStateMixin {
  FocusNode focusNode = FocusNode();
  bool isCancelButtonShow = false;
  bool isValues = false;
  late SpeechRecognition _speech;

  bool _speechRecognitionAvailable = false;
  bool _isListening = false;
  bool isValidAlert = false;

  AnimationController? _controller;
  String? searchVal;

  Language selectedLang = languages.first;
  // TextEditingController toolBarTextController = TextEditingController();

  @override
  void initState() {
    focusNode.unfocus();
    focusNode.addListener(onFocusChange);
    widget.controller.addListener(() {
      if (widget.controller.text.trim().isNotEmpty) {
        setState(() {
          isValues = true;
        });
      }
    });
    super.initState();
    activateSpeechRecognizer();
    _controller = AnimationController(
      vsync: this,
      lowerBound: 0.5,
      duration: Duration(seconds: 3),
    )..repeat();
  }

  @override
  void dispose() {
    focusNode.removeListener(onFocusChange);
    focusNode.dispose();
    // widget.controller.dispose();
    _controller!.dispose();

    super.dispose();
  }

  void onFocusChange() {
    setState(() {
      isCancelButtonShow = focusNode.hasFocus;
    });
  }

  // Platform messages are asynchronous, so we initialize in an async method.
  void activateSpeechRecognizer() {
    print('_MyAppState.activateSpeechRecognizer... ');
    _speech = SpeechRecognition();
    _speech.setAvailabilityHandler(onSpeechAvailability);
    _speech.setRecognitionStartedHandler(onRecognitionStarted);
    _speech.setRecognitionResultHandler(onRecognitionResult);
    _speech.setRecognitionCompleteHandler(onRecognitionComplete);
    _speech.setErrorHandler(errorHandler);
    _speech.activate('en_US').then((res) {
      setState(() => _speechRecognitionAvailable = res);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Padding(
          padding: widget.isCancelButton
              ? EdgeInsets.only(left: 8.0)
              : EdgeInsets.all(0.0),
          child: Container(
            margin: EdgeInsets.all(0),
            alignment: Alignment.center,
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(5.0)),
            ),
            height: 50,
            constraints: BoxConstraints(
                minWidth: 200,
                maxWidth:
                    widget.isCancelButton && isCancelButtonShow ? 270 : 320),
            // width: widget.isCancelButton && isCancelButtonShow
            //     ? MediaQuery.of(context).size.width - 90
            //     : MediaQuery.of(context).size.width - 60,
            child: TextFormField(
              focusNode: focusNode,
              controller: widget.controller,
              cursorColor: Color(0xFF151515),
              cursorWidth: 0.5,
              textAlign: TextAlign.left,
              onTap: () {
                setState(() {
                  focusNode.requestFocus(FocusNode());
                });
              },
              decoration: InputDecoration(
                filled: true,
                //#DAF0F3
                contentPadding: EdgeInsets.all(5.0),
                hintMaxLines: 1,
                isDense: true,
                hintText: widget.searchHint,

                // border: InputBorder.none,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide(color: Color(0xFF151515), width: 1),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide(color: Color(0xFF151515), width: 1),
                ),
                //#898A8B Color(0xFF898A8B)
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide(color: Color(0xFF151515), width: 1),
                ),
                suffixIconConstraints: BoxConstraints.tight(const Size(55, 24)),
                prefixIconConstraints: BoxConstraints.tight(
                    widget.isPrefix ? const Size(44, 94) : const Size(14, 94)),

                suffixIcon: isValues
                    ? Container(
                        decoration: BoxDecoration(
                          // borderRadius: BorderRadius.circular(2),
                          shape: BoxShape.circle,
                          border: Border.all(
                            color: Color(0xFF151515),
                            width: 1,
                          ),
                          // color: Colors.white.withOpacity(0.2),
                        ),
                        // padding: const EdgeInsets.all(1.0),
                        child: Center(
                            child: GestureDetector(
                          onTap: () {
                            if (widget.onClose != null) {
                              widget.onClose!('canceled');
                            }
                            setState(() {
                              widget.controller.clear();
                              isValues = false;
                            });
                          },
                          child: Icon(
                            Icons.clear,
                            color: Color(0xFF151515),
                            size: 16,
                          ),
                        )),
                      )
                    : Center(
                        child: GestureDetector(
                          onTap: () {
                            activateSpeechRecognizer();

                            _showMyDialog();
                          },
                          child: Icon(
                            Icons.mic_none,
                            color: Colors.grey,
                            size: 28,
                          ),
                        ),
                      ),

                prefixIcon: widget.isPrefix
                    ? widget.prefixIcon ??
                        Container(
                          height: 25,
                          width: 30,
                          child: GestureDetector(
                            onTap: () {
                              setState(() {});
                            },
                            child: Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 5),
                              child: Icon(
                                Icons.search,
                                color: Colors.grey,
                                size: Theme.of(context).iconTheme.size,
                              ),
                            ),
                          ),
                        )
                    : SizedBox(),

                hintStyle: Theme.of(context).textTheme.subtitle1!.copyWith(
                      fontWeight: FontWeight.w400,
                      backgroundColor: Colors.transparent,
                    ),
              ),
              keyboardType: TextInputType.text,
              style: Theme.of(context).textTheme.subtitle1!.copyWith(
                    fontWeight: FontWeight.w400,
                    height: 1.5,
                    backgroundColor: Colors.transparent,
                    fontSize: 21,
                  ),
              onFieldSubmitted: (String stringValues) {
                widget.callback!(stringValues);

                FocusScope.of(context).requestFocus(FocusNode());
              },
              onChanged: widget.onChanged,
            ),
          ),
        ),
        widget.isCancelButton && isCancelButtonShow
            ? GestureDetector(
                onTap: () {
                  setState(() {
                    widget.controller.clear();
                    focusNode.unfocus();
                    isValues = false;
                  });
                },
                child: Padding(
                  padding: const EdgeInsets.only(left: 8.0),
                  child: Text(
                    'Cancel',
                    style: Theme.of(context).textTheme.titleSmall!.copyWith(
                        color: ColorResource.color0071EB,
                        fontSize: 14,
                        fontWeight: FontWeight.w400),
                  ),
                ),
              )
            : SizedBox()
      ],
    );
  }

  Future<void> _showMyDialog() async {
    return showDialog<void>(
      context: context,

      barrierDismissible: false, // user must tap button!

      builder: (BuildContext context) {
        Future.delayed(Duration(seconds: 5), () {
          Navigator.of(context).pop;
        });

        return AlertDialog(
          actions: [
            GestureDetector(
              onTap: () => Navigator.pop(context), // passing true
              child: Text('ok'),
            ),
          ],
          content: Padding(
              padding: EdgeInsets.all(8.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  TextField(
                    decoration: InputDecoration(
                      border: InputBorder.none,
                    ),
                    controller: widget.controller,
                  ),
                  Center(
                    child: SizedBox(
                      width: 60,
                      height: 60,
                      child: _buildButton(
                        onPressed: _speechRecognitionAvailable && !_isListening
                            ? () => start()
                            : null,
                        label: _isListening
                            ? 'Listening...'
                            : 'Listen (${selectedLang.code})',
                      ),
                    ),
                  ),
                ],
              )),
        );
      },
    );
  }

  List<CheckedPopupMenuItem<Language>> get _buildLanguagesWidgets => languages
      .map((l) => CheckedPopupMenuItem<Language>(
            value: l,
            checked: selectedLang == l,
            child: Text(l.name),
          ))
      .toList();

  void _selectLangHandler(Language lang) {
    setState(() => selectedLang = lang);
  }

  Widget _buildButton({required String label, VoidCallback? onPressed}) =>
      AnimatedBuilder(
        animation:
            CurvedAnimation(parent: _controller!, curve: Curves.fastOutSlowIn),
        builder: (context, child) {
          return Stack(
            alignment: Alignment.center,
            children: <Widget>[
              _buildContainer(150 * _controller!.value),
              _buildContainer(200 * _controller!.value),
              _buildContainer(250 * _controller!.value),
              _buildContainer(300 * _controller!.value),
              _buildContainer(350 * _controller!.value),
              GestureDetector(
                  onTap: onPressed,
                  child: Icon(
                    Icons.mic,
                    size: 44,
                  )),
            ],
          );
        },
      );

  Widget _buildContainer(double radius) {
    return Container(
      width: radius,
      height: radius,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: Colors.blue.withOpacity(1 - _controller!.value),
      ),
    );
  }

  void start() => _speech.activate(selectedLang.code).then((_) {
        return _speech.listen().then((result) {
          print('_MyAppState.start => result $result');
          setState(() {
            _isListening = result;
          });
        });
      });

  void onSpeechAvailability(bool result) =>
      setState(() => _speechRecognitionAvailable = result);

  void onCurrentLocale(String locale) {
    print('_MyAppState.onCurrentLocale... $locale');
    setState(
        () => selectedLang = languages.firstWhere((l) => l.code == locale));
  }

  void onRecognitionStarted() {
    setState(() => _isListening = true);
  }

  void onRecognitionResult(String text) {
    print('_MyAppState.onRecognitionResult... $text');
    setState(() => widget.controller.text = text);
  }

  void onRecognitionComplete(String text) {
    print('_MyAppState.onRecognitionComplete... $text');
    setState(() {
      _isListening = false;
    });
  }

  void errorHandler() => activateSpeechRecognizer();
}

const languages = const [
  const Language('English', 'en_US'),
];

class Language {
  final String name;
  final String code;

  const Language(this.name, this.code);
}
