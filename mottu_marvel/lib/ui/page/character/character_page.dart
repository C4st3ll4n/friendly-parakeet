import 'package:flutter/material.dart';
import 'package:mottu_marvel/domain/entity/entities.dart';

import 'character_presenter.dart';

class CharacterPage extends StatelessWidget {
  final CharacterPresenter presenter;

  const CharacterPage({Key? key, required this.presenter}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Mottu"),
      ),
      body: Builder(
        builder: (BuildContext buildContext) {
          return SingleChildScrollView(
            child: Column(
              children: [
                StreamBuilder<List<CharacterEntity>>(
                  stream: presenter.characterStream,
                  builder: (context, snapshot) {
                    if (snapshot.hasError) {
                      return const Text("Algo deu errado");
                    }
                    if(snapshot.hasData) {
                      return ListView.builder(
                      itemCount: snapshot.data?.length??0,
                      itemBuilder: (BuildContext context, int indice) {
                        return const ListTile(
                          leading: Text("Personagem"),
                          trailing: Icon(Icons.person),
                        );
                      },
                    );
                    }

                    return const CircularProgressIndicator();
                  },
                )
              ],
            ),
          );
        },
      ),
    );
  }
}
