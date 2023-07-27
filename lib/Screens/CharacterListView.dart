import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../Models/CharacterModel.dart';
import '../Providers/characterProvider.dart';
import 'CharacterDetailView.dart';



class CharacterListView extends StatefulWidget {
  @override
  _CharacterListViewState createState() => _CharacterListViewState();
}

class _CharacterListViewState extends State<CharacterListView> {
  late TextEditingController _searchController;
  String _searchText = '';

  @override
  void initState() {
    super.initState();
    _searchController = TextEditingController();
    // Fetching the characters here
    Provider.of<CharacterProvider>(context, listen: false).fetchCharacters();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: TextField(
          controller: _searchController,
          onChanged: (value) {
            setState(() {
              _searchText = value;
            });
          },
          decoration: InputDecoration(hintText: 'Search Characters...'),
        ),
      ),
      body: Consumer<CharacterProvider>(
        builder: (context, charactersProvider,  child) {
          return ListView.builder(
            itemCount: charactersProvider.characters.length,
            itemBuilder: (context, index) {
              final character = charactersProvider.characters[index];
              if (character.title.contains(_searchText) ||
                  character.description.contains(_searchText)) {
                return ListTile(
                  title: Text(character.title),
                  onTap: () {
                    Provider.of<CharacterProvider>(context, listen: false)
                        .selectCharacter(character);
                    if (MediaQuery.of(context).size.width <= 600) {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => CharacterDetailView(),
                        ),
                      );
                    }
                  },
                );
              } else {
                return SizedBox.shrink();
              }
            },
          );
        },
      ),
    );
  }
}
