import 'package:agenda/app/dominio/entidades/contato.dart';
import 'package:flutter/cupertino.dart';
import 'package:url_launcher/url_launcher.dart';

class ContatoDetalhesBack {
  BuildContext context;
  Contato contato;

  ContatoDetalhesBack(this.context) {
    contato = ModalRoute.of(context).settings.arguments;
  }

  goToBack() {
    Navigator.of(context).pop();
  }

  _launchApp(
      String url, Function(BuildContext context) mostrarErroModal) async {
    await canLaunch(url) ? await launch(url) : mostrarErroModal(context);
  }

  launchTelefone(Function(BuildContext context) mostrarErroModal) {
    _launchApp('tel:${contato.telefone}', mostrarErroModal);
  }

  launchSMS(Function(BuildContext context) mostrarErroModal) {
    _launchApp('sms:${contato.telefone}', mostrarErroModal);
  }

  launchEmail(Function(BuildContext context) mostrarErroModal) {
    _launchApp('mailto:${contato.email}', mostrarErroModal);
  }
}
