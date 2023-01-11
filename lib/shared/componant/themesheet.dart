import 'package:flutter/material.dart';
import 'package:news_shehab/Provider/myprovider.dart';
import 'package:news_shehab/shared/componant/showMasseges.dart';
import 'package:provider/provider.dart';


class Themesheet extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var pro=Provider.of<myprovider>(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        InkWell(
        onTap: (){
          pro.changeThemes(ThemeMode.light);
          hideLoading(context);
    },
        child: items(context, "light", pro.themeMode==ThemeMode.light)),
        SizedBox(
          height: 20,
        ),
        InkWell(
            onTap: (){
              pro.changeThemes(ThemeMode.dark);
              hideLoading(context);
            },
            child: items(context, "dark", pro.themeMode==ThemeMode.dark)),
      ],
    );
  }

  Widget items(context, String name, bool isSelected) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Container(
        width: double.infinity,
        padding: EdgeInsets.all(20),
        color: (isSelected) ? Colors.grey : Colors.white,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              name,
              style: Theme.of(context).textTheme.headline1?.copyWith(
                    color: Colors.black,
                  ),
            ),
            Icon(Icons.done),
          ],
        ),
      ),
    );
  }
}
