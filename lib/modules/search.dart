import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/shared/component/component.dart';
import 'package:news_app/shared/cubit/cubit.dart';
import 'package:news_app/shared/cubit/states.dart';

class SearchPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
     var searchController = TextEditingController();
    return BlocConsumer<NewsCubit,NewsStates>(
      listener: (context,state){},
      builder:(context,state){
        var list=NewsCubit.get(context).search;
        return Scaffold(
            appBar: AppBar(),
            body:Column(
              children: [
                form(
                    controller: searchController,
                    type: TextInputType.text,
                    hint: 'Search',
                    onChange: (value){
                      NewsCubit.get(context).getSearch(value);
                    },
                    validate: (String value)
                    {
                      if(value.isEmpty)
                      {
                        return 'search must not be empty';
                      }
                      return null;
                    },
                    label: null,
                    prefix: Icons.search
                ),
                Expanded(child: articleBuilder(list,isSearch: true))
              ],
            ),
        );
      } ,
    );
  }
}
