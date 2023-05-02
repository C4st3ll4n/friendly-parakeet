import 'package:flutter/material.dart';
import 'package:mottu_marvel/domain/entity/entities.dart';

import 'character_presenter.dart';

class CharacterPage extends StatelessWidget {
  final CharacterPresenter presenter;

  const CharacterPage({Key? key, required this.presenter}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Size _size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: const Text("Mottu"),
      ),
      body: Builder(
        builder: (BuildContext buildContext) {
          presenter.loadData();
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
                      return SizedBox(
                        height: _size.height,
                        width: double.infinity,
                        child: ListView.builder(
                        itemCount: snapshot.data?.length??0,
                        itemBuilder: (BuildContext context, int indice) {
                          final CharacterEntity c = snapshot.data![indice];
                          return ListTile(
                            leading: Text(c.name),
                            trailing: CircleAvatar(
                              child: ClipOval(
                                child: Hero(
                                  tag: c.id,
                                  child: Image.network(
                                    c.image,
                                    width: 100,
                                    height: 100,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                            ),
                          );
                        },
                    ),
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
