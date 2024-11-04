// ignore_for_file: use_build_context_synchronously

import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:ir_remote_pro/db/remoteControlDatabase.dart';
import 'package:ir_remote_pro/db/remoteControlModel.dart';
import 'package:ir_remote_pro/presentation/RingButton.dart';
import 'package:ir_remote_pro/presentation/widgets/ShowSnackBarHelper.dart';
import 'package:ir_remote_pro/services/TcpSocket.dart';

class TVRemoteControl extends StatefulWidget {
  const TVRemoteControl({super.key, required this.name});
  final String name;
  @override
  State<TVRemoteControl> createState() => _TVRemoteControlState();
}

class _TVRemoteControlState extends State<TVRemoteControl> {
  List<int> _powerCode = [];
  int _mode = 0;
  final TcpSocket _socket = TcpSocket('192.168.4.1', 2020);
  StreamSubscription? _tcpListen;
  List<List<int>?> _remoteCodes = List.filled(14, null);

  @override
  void initState() {
    _connectSocket();
    super.initState();
  }

  void _connectSocket() async {
    String response = await _socket.connect();
    if (response == 'Conectado') {
      if (mounted) {
        ShowSnackBarHelper.success(context, message: 'Conectado');
        _listenInit();
      }
    } else {
      if (mounted) {
        ShowSnackBarHelper.error(context, message: 'Error al conectar');
      }
    }
  }

  void _listenInit() {
    _tcpListen = _socket.listen((List<int> data) {
      _powerCode = data;
      _tcpListen?.cancel();
    });
  }

  void _powerBtnAction() {
    if (_mode == 0) {
      showTimedDialog(context);
      _captureInit();
    } else {}
  }

  void _captureInit() {
    const String code = 'S';
    final List<int> codeBytes = code.codeUnits;
    _socket.sendRawData(codeBytes);
  }

  void _sendPower() {
    const String code = 'T,';
    final List<int> message = [...code.codeUnits, ..._powerCode];
    _socket.sendRawData(message);
  }

  void showTimedDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        // Iniciar un temporizador para cerrar el diálogo después de 5 segundos
        Future.delayed(Duration(seconds: 5), () {
          Navigator.of(context).pop();
        });
        return AlertDialog(
          title: Text("Popup Temporal"),
          content: Text("Este popup se cerrará en 5 segundos."),
        );
      },
    );
  }

  @override
  void dispose() {
    _tcpListen?.cancel(); // Cancela el listener al destruir el widget
    _socket.disconnect(); // Cierra la conexión
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.name),
        actions: [
          if (_mode == 1) IconButton(onPressed: () {}, icon: Icon(Icons.edit)),
          if (_mode == 0) IconButton(onPressed: () {}, icon: Icon(Icons.check)),
        ],
      ),
      body: Stack(
        children: [
          Padding(
            padding: EdgeInsets.all(MediaQuery.of(context).size.width * 0.1),
            child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Badge(
                        label: _mode == 0 ? Text('Editar') : Text(''),
                        backgroundColor:
                            _mode == 0 ? Colors.red : Colors.transparent,
                        child: Container(
                            width: 70,
                            height: 70,
                            decoration: BoxDecoration(
                              border: Border.all(color: Colors.grey),
                              borderRadius: BorderRadius.circular(100),
                            ),
                            child: IconButton(
                              onPressed: _powerBtnAction,
                              icon: const Icon(Icons.power_settings_new),
                            )),
                      ),
                      Badge(
                        label: _mode == 0 ? Text('Editar') : Text(''),
                        backgroundColor:
                            _mode == 0 ? Colors.red : Colors.transparent,
                        child: Container(
                          width: 70,
                          height: 70,
                          decoration: BoxDecoration(
                            border: Border.all(color: Colors.grey),
                            borderRadius: BorderRadius.circular(100),
                          ),
                          child: IconButton(
                            onPressed: _sendPower,
                            icon: const Icon(Icons.exit_to_app),
                          ),
                        ),
                      ),
                      Badge(
                        label: _mode == 0 ? Text('Editar') : Text(''),
                        backgroundColor:
                            _mode == 0 ? Colors.red : Colors.transparent,
                        child: Container(
                          width: 70,
                          height: 70,
                          decoration: BoxDecoration(
                            border: Border.all(color: Colors.grey),
                            borderRadius: BorderRadius.circular(100),
                          ),
                          child: IconButton(
                            onPressed: () async {
                              RemoteControlParams remoteControlParams = RemoteControlParams.basic(name: 'Moto', brand: 'LG', category: 'TV');
                              int id = await RemoteControlDB.insertBasic(remoteControlParams);
                              print('Identificador: ${id}');                              
                            },
                            icon: const Icon(Icons.menu),
                          ),
                        ),
                      ),
                    ],
                  ),
                  _buildCircularButtons(context),
                  _buildBottomControl(context)
                ]),
          ),
          //_buildPopup(context),
        ],
      ),
    );
  }

  Widget _buildCircularButtons(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Badge(
              label: _mode == 0 ? Text('Editar') : Text(''),
              backgroundColor: _mode == 0 ? Colors.red : Colors.transparent,
              child: Container(
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
              ),
            )
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Badge(
              label: _mode == 0 ? Text('Editar') : Text(''),
              backgroundColor: _mode == 0 ? Colors.red : Colors.transparent,
              child: Container(
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
            ),
            Badge(
              label: _mode == 0 ? Text('Editar') : Text(''),
              backgroundColor: _mode == 0 ? Colors.red : Colors.transparent,
              child: SizedBox(
                width: 100,
                height: 100,
                child: TextButton(
                  onPressed: () {},
                  child: const Text('OK'),
                ),
              ),
            ),
            Badge(
              label: _mode == 0 ? Text('Editar') : Text(''),
              backgroundColor: _mode == 0 ? Colors.red : Colors.transparent,
              child: Container(
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
              ),
            )
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Badge(
              label: _mode == 0 ? Text('Editar') : Text(''),
              backgroundColor: _mode == 0 ? Colors.red : Colors.transparent,
              child: Container(
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
        const Gap(10),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Badge(
              label: _mode == 0 ? Text('Editar') : Text(''),
              backgroundColor: _mode == 0 ? Colors.red : Colors.transparent,
              child: Container(
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
            ),
            Badge(
              label: _mode == 0 ? Text('Editar') : Text(''),
              backgroundColor: _mode == 0 ? Colors.red : Colors.transparent,
              child: Container(
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
          Badge(
            label: _mode == 0 ? Text('Editar') : Text(''),
            backgroundColor: _mode == 0 ? Colors.red : Colors.transparent,
            child: IconButton(
                onPressed: () {}, icon: const Icon(Icons.keyboard_arrow_up)),
          ),
          const Text('CH'),
          Badge(
            label: _mode == 0 ? Text('Editar') : Text(''),
            backgroundColor: _mode == 0 ? Colors.red : Colors.transparent,
            child: IconButton(
                onPressed: () {}, icon: const Icon(Icons.keyboard_arrow_down)),
          )
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
          Badge(
            label: _mode == 0 ? Text('Editar') : Text(''),
            backgroundColor: _mode == 0 ? Colors.red : Colors.transparent,
            child: IconButton(onPressed: () {}, icon: const Icon(Icons.add)),
          ),
          const Text('VOL'),
          Badge(
            label: _mode == 0 ? Text('Editar') : Text(''),
            backgroundColor: _mode == 0 ? Colors.red : Colors.transparent,
            child: IconButton(onPressed: () {}, icon: const Icon(Icons.remove)),
          )
        ],
      ),
    );
  }

  Widget _buildPopup(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      color: Colors.black38,
      child: Center(
        child: Container(
          width: 240,
          height: 200,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(30),
          ),
          child: Column(
            children: [
              Text('Capture la trama del control')
            ],
          ),
        ),
      ),
    );
  }
}
