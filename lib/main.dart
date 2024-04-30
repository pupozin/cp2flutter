import 'package:flutter/material.dart';
import 'contato.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        appBarTheme: AppBarTheme(
          backgroundColor: Colors.red,
        ),
      ),
      home: ContatosList(),
    );
  }
}

class ContatosList extends StatefulWidget {
  @override
  _ContatosListState createState() => _ContatosListState();
}

class _ContatosListState extends State<ContatosList> {
  final List<Contato> contatos = [
    Contato("Jonathan Calleri", "calleri@spfc.com", "https://pbs.twimg.com/media/GFIZcD4WEAAjN40?format=jpg&name=small"),
    Contato("Rafael", "rafael@spfc.com", "https://pbs.twimg.com/media/GLTI5usWEAo03rL?format=jpg&name=large"),
    Contato("James Rodríguez", "james@spfc.com", "https://pbs.twimg.com/media/GK--hc8WQAAdA3l?format=jpg&name=large"),
    Contato("Lucas Moura", "lucas@spfc.com", "https://pbs.twimg.com/media/GKLks4IWAAAClsh?format=jpg&name=large"),
    Contato("Ferreirinha", "ferreira@spfc.com", "https://pbs.twimg.com/media/GI55PZUW8AE_WFR?format=jpg&name=large"),
  ];

  
  List<bool> favoritos = List.generate(5, (_) => false);

  int get contatosFavoritadosCount {
    return favoritos.where((favorito) => favorito).length;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          '$contatosFavoritadosCount Contatos favoritos',
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: ListView.builder(
        itemCount: contatos.length,
        itemBuilder: (BuildContext context, int index) {
          return ListTile(
            title: Text(contatos[index].nome),
            subtitle: Text(contatos[index].email),
            leading: CircleAvatar(
              backgroundImage: NetworkImage(contatos[index].imagem),
            ),
            trailing: IconButton(
              icon: Icon(
                favoritos[index] ? Icons.favorite : Icons.favorite_border,
                color: favoritos[index] ? Colors.red : null,
              ),
              onPressed: () {
                setState(() {
                  favoritos[index] = !favoritos[index];
                });
              },
            ),
          );
        },
      ),
    );
  }
}
