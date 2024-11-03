import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:ir_remote_pro/logic/appConstants.dart';
import 'package:ir_remote_pro/presentation/RemoteControl/TVRemoteControl.dart';

class DeviceSelect extends StatelessWidget {
  const DeviceSelect({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Dispositivo"),
      ),
      body: Padding(
        padding: EdgeInsets.all(10.0),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                GestureDetector(
                  onTap: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => const TVRemoteControl()));
                  },
                  child: SizedBox(
                    height: 120,
                    width: 120,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image(image: AssetImage(appConstants.TV_ICON_URL)),
                        Text('TV'),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: 120,
                  width: 120,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image(image: AssetImage(appConstants.DECODER_ICON_URL)),
                      Text('Decoder'),
                    ],
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
