import 'package:fluid_bottom_nav_bar/fluid_bottom_nav_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/modules/search.dart';
import 'package:news_app/shared/component/component.dart';
import 'file:///D:/Flutter_Projects/news_app/lib/shared/component/constants.dart';
import 'package:news_app/shared/cubit/cubit.dart';
import 'package:news_app/shared/cubit/states.dart';

class HomeLayout extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NewsCubit, NewsStates>(
      listener: (context, states) {},
      builder: (context, states){
        var cubit =NewsCubit.get(context);
        return Scaffold(
        // backgroundColor: primaryBackground,
        appBar: AppBar(
          title: Text(
            'News App',
          ),
          actions: [
            IconButton(icon: Icon(Icons.search_outlined), onPressed: (){pushPage(context,SearchPage());NewsCubit.get(context).search=[];}),
            IconButton(icon: Icon(Icons.brightness_4), onPressed: (){cubit.changeAppMode();}),
          ],
        ),
        bottomNavigationBar: FluidNavBar(
          style: FluidNavBarStyle(barBackgroundColor: barBackgroundColor),
          icons: cubit.navBarIcons,
          defaultIndex: cubit.currentIndex,
          scaleFactor: 1,
          animationFactor: 1,
          onChange: cubit.changeNavBar,
        ),
          body: cubit.screens[cubit.currentIndex],
      );
      }
    );
  }
}
