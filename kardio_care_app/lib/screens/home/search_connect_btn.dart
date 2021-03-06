import 'package:flutter/material.dart';
import 'package:kardio_care_app/app_theme.dart';
import 'package:kardio_care_app/util/device_scanner.dart';

class SearchAndConnectBtn extends StatefulWidget {
  const SearchAndConnectBtn({
    Key key,
    @required this.size,
    this.deviceScannerProvider,
  }) : super(key: key);

  final Size size;
  final DeviceScanner deviceScannerProvider;

  @override
  _SearchAndConnectBtnState createState() => _SearchAndConnectBtnState();
}

class _SearchAndConnectBtnState extends State<SearchAndConnectBtn> {
  bool buttonEnabled = true;
  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 0,
      child: Container(
        constraints: BoxConstraints.expand(
          width: widget.size.width,
          height: widget.size.height / 2 - 50,
        ),
        alignment: Alignment.center,
        // decoration: BoxDecoration(
        //   color: const Color(0xffeeee00),
        //   border: Border.all(color: Colors.yellow, width: 5),
        //   borderRadius: BorderRadius.all(
        //     Radius.circular(20),
        //   ),
        // ),
        color: KardioCareAppTheme.actionBlue,
        child: !isLoading
            ? TextButton(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: FittedBox(
                        fit: BoxFit.fitHeight,
                        child: Text(
                          "Tap here to connect",
                          style: TextStyle(
                            fontSize: 22,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      child: Container(
                        alignment: Alignment.center,
                        child: Image.asset(
                          "assets/disconnected.png",
                        ),
                      ),
                    ),
                  ],
                ),
                onPressed: pressBtn,
              )
            : Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  FittedBox(
                    fit: BoxFit.fitHeight,
                    child: Text(
                      "Searching ...",
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.w600,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  CircularProgressIndicator(
                    color: Colors.white,
                  ),
                ],
              ),
      ),
    );
  }

  void pressBtn() {
    setState(() {
      buttonEnabled = false;
      isLoading = true;
    });

    widget.deviceScannerProvider.connectToModule().then((value) {
      if (value) {
        print("Device connected successfully");
      } else {
        print("Couldn't find device");
      }
      setState(() {
        buttonEnabled = true;
        isLoading = false;
      });
    });
  }
}
