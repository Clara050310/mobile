import 'package:flutter/material.dart';
import 'package:sa04_cadastro_3telas/view/Tela_Boas_Vindas_view.dart';
import 'package:sa04_cadastro_3telas/view/Tela_cadastro_view.dart';

import 'view/tela_confirmacao_view.dart';

void main(){
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    initialRoute: "/",
    routes: {
      "/":(context)=> TelaBoasVindas(),
     "/cadastro":(context)=>TelaCadastro(),
    "/confirmação":(context)=>TelaConfirmacao()
    },
  ));
}