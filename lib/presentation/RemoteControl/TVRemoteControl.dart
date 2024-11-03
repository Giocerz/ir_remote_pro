import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:ir_remote_pro/presentation/RingButton.dart';

class TVRemoteControl extends StatelessWidget {
  const TVRemoteControl({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Titulo de remote'),
      ),
      body: Padding(
        padding: EdgeInsets.all(MediaQuery.of(context).size.width * 0.1),
        child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                      width: 70,
                      height: 70,
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.grey),
                        borderRadius: BorderRadius.circular(100),
                      ),
                      child: IconButton(
                        onPressed: () {},
                        icon: const Icon(Icons.power_settings_new),
                      )),
                  Container(
                    width: 70,
                    height: 70,
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey),
                      borderRadius: BorderRadius.circular(100),
                    ),
                    child: IconButton(
                      onPressed: () {},
                      icon: const Icon(Icons.exit_to_app),
                    ),
                  ),
                  Container(
                    width: 70,
                    height: 70,
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey),
                      borderRadius: BorderRadius.circular(100),
                    ),
                    child: IconButton(
                      onPressed: () {},
                      icon: const Icon(Icons.menu),
                    ),
                  ),
                ],
              ),
              _buildCircularButtons(context),
              _buildBottomControl(context)
            ]),
      ),
    );
  }

  Widget _buildCircularButtons(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: 100,
              height: 60,
              decoration: BoxDecoration(
                border: Border.all(color: Colors.grey),
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(100),
                  topRight: Radius.circular(100),
                ),
              ),
              child: IconButton(
                onPressed: () {},
                icon: const Icon(Icons.keyboard_arrow_up),
              ),
            )
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: 60,
              height: 100,
              decoration: BoxDecoration(
                border: Border.all(color: Colors.grey),
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(100),
                  bottomLeft: Radius.circular(100),
                ),
              ),
              child: IconButton(
                onPressed: () {},
                icon: const Icon(Icons.keyboard_arrow_left),
              ),
            ),
            SizedBox(
              width: 100,
              height: 100,
              child: TextButton(
                onPressed: () {},
                child: const Text('OK'),
              ),
            ),
            Container(
              width: 60,
              height: 100,
              decoration: BoxDecoration(
                border: Border.all(color: Colors.grey),
                borderRadius: const BorderRadius.only(
                  topRight: Radius.circular(100),
                  bottomRight: Radius.circular(100),
                ),
              ),
              child: IconButton(
                onPressed: () {},
                icon: const Icon(Icons.keyboard_arrow_right),
              ),
            )
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: 100,
              height: 60,
              decoration: BoxDecoration(
                border: Border.all(color: Colors.grey),
                borderRadius: const BorderRadius.only(
                  bottomLeft: Radius.circular(100),
                  bottomRight: Radius.circular(100),
                ),
              ),
              child: IconButton(
                onPressed: () {},
                icon: const Icon(Icons.keyboard_arrow_down),
              ),
            )
          ],
        ),
      ],
    );
  }

  Widget _buildBottomControl(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            _buildChannelButtons(context),
            _buildVolumeButtons(context)
          ],
        ),
        Gap(10),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              width: 70,
              height: 70,
              decoration: BoxDecoration(
                border: Border.all(color: Colors.grey),
                borderRadius: BorderRadius.circular(100),
              ),
              child: TextButton(
                onPressed: () {},
                child: const Text('TV/AV'),
              ),
            ),
            Container(
              width: 70,
              height: 70,
              decoration: BoxDecoration(
                border: Border.all(color: Colors.grey),
                borderRadius: BorderRadius.circular(100),
              ),
              child: IconButton(
                onPressed: () {},
                icon: const Icon(Icons.volume_off),
              ),
            ),
          ],
        )
      ],
    );
  }

  Widget _buildChannelButtons(BuildContext context) {
    return Container(
      width: 70,
      height: 130,
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey),
        borderRadius: BorderRadius.circular(100),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          IconButton(onPressed: () {}, icon: Icon(Icons.keyboard_arrow_up)),
          Text('CH'),
          IconButton(onPressed: () {}, icon: Icon(Icons.keyboard_arrow_down))
        ],
      ),
    );
  }

  Widget _buildVolumeButtons(BuildContext context) {
    return Container(
      width: 70,
      height: 130,
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey),
        borderRadius: BorderRadius.circular(100),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          IconButton(onPressed: () {}, icon: Icon(Icons.add)),
          Text('VOL'),
          IconButton(onPressed: () {}, icon: Icon(Icons.remove))
        ],
      ),
    );
  }
}
