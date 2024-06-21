import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:slash_task/core/constants.dart';
import 'package:slash_task/core/globals.dart';
import 'package:slash_task/home/blocs/home_bloc.dart';

class HomeAppBar extends StatelessWidget implements PreferredSizeWidget{
  const HomeAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: lightColor,
      elevation: 1,
      actions: [
        const SizedBox(width: screenPadding,),
        // App Title
        const Padding(
          padding: EdgeInsets.only(top: 8.0),
          child: Text(
            "Slash.",
            style: TextStyle(
              fontSize: 20,
              fontWeight: boldWeight,
              color: darkColor
            ),
          ),
        ),
        const Expanded(child: SizedBox()),
        // Location
        Padding(
          padding: const EdgeInsets.only(top: 8.0),
          child: PopupMenuButton<String>(
            initialValue: locations.first,
            itemBuilder: (context) => locations.map((e) => PopupMenuItem<String>(
              value: e,
              child: Text(e),)
            ).toList(),
            onSelected: (location){
              BlocProvider.of<HomeBloc>(context).add(UpdateLocation(location));
            },
            child: Row(
              children: [
                const Icon(Icons.location_on_rounded, size: 24,color: darkColor,),
                Column(
                  children: [
                    Text(currLocation,
                        style:const TextStyle(
                          fontWeight: regularWeight,
                          fontSize: 14,
                          color: darkColor
                        )
                    ),
                    const Text("Cairo",
                      style: TextStyle(
                        fontWeight:
                        boldWeight,
                        fontSize: 12,
                        color: darkColor
                      ),
                    )
                  ],
                ),
                const Icon(Icons.keyboard_arrow_down_outlined, size: 20,color: darkColor,)
              ],
            ),
          ),
        ),
        const Expanded(child: SizedBox()),
        // Notifications
        Padding(
          padding: const EdgeInsets.only(top: 8.0),
          child: IconButton(
            padding: const EdgeInsets.all(0),
            onPressed: (){},
            icon: Stack(
              alignment: Alignment.topRight,
              children: [
                const Icon(
                  Icons.notifications_outlined,
                  size: 30,
                  color: darkColor,
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 4),
                  child: Container(
                    width: 12,
                    height: 12,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.red,
                      border: Border.all(color: Colors.white)
                    ),
                  ),
                )
              ],
            )
          ),
        ),
        const SizedBox(width: screenPadding,),
      ],
      // Search bar
      bottom: PreferredSize(
        preferredSize: const Size.fromHeight(100),
        child: Padding(
          padding: const EdgeInsets.all(screenPadding),
          child: Row(
            children: [
              Expanded(
                child: SizedBox(
                  height: 45,
                  child: TextFormField(
                    decoration: const InputDecoration(
                      filled: true,
                      fillColor: greyColor,
                      hintText: "Search here.",
                      hintStyle: TextStyle(
                        color: Color(0xFF969696)
                      ),
                      prefixIcon: Icon(CupertinoIcons.search, size: 20, color: Color(0xFF5F5F5F),),
                      border: OutlineInputBorder(
                        borderSide: BorderSide.none,
                        borderRadius: BorderRadius.all(Radius.circular(8))
                      ),
                      contentPadding: EdgeInsets.symmetric(vertical: 12)
                    ),
                  ),
                )
              ),
              const SizedBox(width: 8,),
              InkWell(
                child: Container(
                  width: 47,
                  height: 45,
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(8)),
                    color: greyColor,
                  ),
                  child: const Icon(CupertinoIcons.slider_horizontal_3,size: 17,)
                ),
              )
            ],
          ),
        )
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(135);
}


