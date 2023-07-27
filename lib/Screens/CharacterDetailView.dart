import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../Providers/characterProvider.dart';

class CharacterDetailView extends StatelessWidget {
  String imagePlaceholer = 'https://www.ivins.com/wp-content/uploads/2020/09/placeholder-1.png';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(

      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Consumer<CharacterProvider>(
          builder: (context, characterProvider, child) {
            final character = characterProvider.selectedCharacter;
            if (character == null) {
              return Text('No character selected.');
            }
            return Column(
              children: <Widget>[
                SizedBox(
                    height: 200,
                    child: Image.network(character.imageUrl.isEmpty ?
                       imagePlaceholer : character.imageUrl, errorBuilder: (BuildContext context, Object exception, StackTrace? stackTrace) {
                      return Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Icon(Icons.error,size: 50,color: Colors.redAccent,),
                          Text('Image Could Not Load')
                        ],
                      );  // Return an error icon in case of any loading error
                    },)),
                SizedBox(height: 20,),
                Text(character.title, style: TextStyle(fontWeight: FontWeight.bold, fontSize: 17),),
                Text(character.description),
              ],
            );
          },
        ),
      ),
    );
  }
}