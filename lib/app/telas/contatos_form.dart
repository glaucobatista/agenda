import 'package:flutter/material.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:agenda/app/telas/contatos_form_back.dart';

class ContatosForm extends StatefulWidget {
  @override
  _ContatosFormState createState() => _ContatosFormState();
}

class _ContatosFormState extends State<ContatosForm> {
  final _form = GlobalKey<FormState>();
  Widget campoNome(ContatosFormBack back) {
    return TextFormField(
      validator: back.validarNome,
      onSaved: (newValue) => back.contato.nome = newValue,
      decoration: InputDecoration(labelText: 'Nome'),
    );
  }

  Widget campoEmail(ContatosFormBack back) {
    return TextFormField(
      validator: back.validarEmail,
      onSaved: (newValue) => back.contato.email = newValue,
      decoration: InputDecoration(labelText: 'Email'),
    );
  }

  Widget campoTelefone(ContatosFormBack back) {
    var mascara = MaskTextInputFormatter(mask: '(##) # ####-####');
    return TextFormField(
      validator: back.validarTelefone,
      inputFormatters: [mascara],
      keyboardType: TextInputType.number,
      onSaved: (newValue) => back.contato.telefone = newValue,
      decoration:
          InputDecoration(labelText: 'Telefone', hintText: '(99) 9 9999-9999'),
    );
  }

  Widget campoUrlImagem(ContatosFormBack back) {
    return TextFormField(
      onSaved: (newValue) => back.contato.urlAvatar = newValue,
      decoration: InputDecoration(labelText: 'Endereço da Foto'),
    );
  }

  @override
  Widget build(BuildContext context) {
    var _back = ContatosFormBack(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('Cadastro de Contatos'),
        actions: [
          IconButton(
              icon: Icon(Icons.save),
              onPressed: () {
                _form.currentState.validate();
                _form.currentState.save();
                if (_back.ehValido) {
                  _back.save();
                  Navigator.of(context).pop();
                }
              })
        ],
      ),
      body: Padding(
        padding: EdgeInsets.all(10),
        child: Form(
            key: _form,
            child: Column(
              children: [
                campoNome(_back),
                campoEmail(_back),
                campoTelefone(_back),
                campoUrlImagem(_back)
              ],
            )),
      ),
    );
  }
}
