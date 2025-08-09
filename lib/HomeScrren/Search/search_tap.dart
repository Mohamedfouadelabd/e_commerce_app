import 'package:flutter/material.dart';

import '../../Theme/my_Theme.dart';
import 'Cubit/brand _search_view.dart';

class SearchTap extends SearchDelegate {
  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(
        icon: Icon(Icons.clear),
        onPressed: () {
          query = '';
        },
      ),
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
      icon: Icon(Icons.arrow_back),
      onPressed: () {
        close(context, null);
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    return buildSuggestions(context);
  }

  @override
  Widget buildSuggestions(BuildContext context) {
   if(query.isEmpty){
      return  Container(
        color: MyTheme.White,
        child: Column(

          children: [
         SizedBox(
           height: MediaQuery.of(context).size.height*0.4,
         ),

          Center(child: Text('what are you looking for ?')),
            
          ],
        ),
      );
    }
 return  BrandsSearchView(name:  query,);
  }
}
