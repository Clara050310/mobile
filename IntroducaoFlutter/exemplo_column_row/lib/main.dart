import 'package:flutter/material.dart';
 
void main() {
  runApp( MainApp());
}
 
class MainApp extends StatelessWidget {
  const MainApp({super.key});
 
  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text("Exemplo Colunas(column) linhas(row)")),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,//vertical
          crossAxisAlignment: CrossAxisAlignment.center,//horizontal
          children: [
            Text("linha 1"),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text("coluna 1"),
                Text("coluna 2")
              ],
            ),
            Text("Linha 3"),
            Stack(
              alignment:Alignment.center,
              children: [
                Container(
                  width: 200,
                  height: 200,
                  color: Colors.pink,
                ),
                Positioned(
                  top:20,
                  right: 20,
                  child: Icon(Icons.person), )
                
              ],
            )
          ],
        )
        ),
      );