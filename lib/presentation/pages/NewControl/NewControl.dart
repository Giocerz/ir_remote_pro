import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:ir_remote_pro/presentation/pages/RemoteControl/TVRemoteControl.dart';

class NewControl extends StatefulWidget {
  const NewControl({super.key, required this.category});

  final String category;

  @override
  State<NewControl> createState() => _NewControlState();
}

class _NewControlState extends State<NewControl> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _nameTextEdit = TextEditingController();
  final TextEditingController _brandTextEdit = TextEditingController();

  void _saveNewControl() {
    final bool formValidation = _formKey.currentState!.validate();
    if(!formValidation) {
      return;
    }
    final String name = _nameTextEdit.text;
    Navigator.push(context, MaterialPageRoute(builder: (context) => TVRemoteControl(name: name)));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Nuevo Control para ${widget.category}'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                controller: _nameTextEdit,
                maxLength: 40,
                validator: (value) {
                  if(value == null || value.isEmpty) {
                    return 'Por favor ingrese el nombre del control';
                  }
                  return null;
                },
                decoration: const InputDecoration(
                  labelText: 'Nombre',
                  helperText: 'Escriba el nombre con el que guardará el control.'
                ),
              ),
              const Gap(20),
              TextFormField(
                controller: _brandTextEdit,
                maxLength: 30,
                validator: (value) {
                  if(value == null || value.isEmpty) {
                    return 'Por favor ingrese la marca del dispositivo';
                  }
                  return null;
                },
                decoration: const InputDecoration(
                  labelText: 'Marca',
                  helperText: 'Escriba la marca del dispositivo.'
                ),
              ),
              Expanded(child: Container()),
              SizedBox(
                width: 150,
                height: 100,
                  child: TextButton(onPressed: _saveNewControl, child: const Text('Siguiente'))),
              const Gap(20),
            ],
          ),
        ),
      ),
    );
  }
}
