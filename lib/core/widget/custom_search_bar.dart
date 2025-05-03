import 'package:flutter/material.dart';
import 'package:test/core/utils/app_style.dart';

class CommonSearchBar extends StatelessWidget {
  final String? text;
  final bool enabled, ishsow;
  final double height;
  final IconData? iconData;

  const CommonSearchBar(
      {super.key,
      this.text,
      this.enabled = false,
      this.height = 48,
      this.iconData,
      this.ishsow = true});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 16.0, right: 16.0),
      child: SizedBox(
        height: height,
        child: Center(
          child: Row(
            children: <Widget>[
              ishsow == true
                  ? Icon(
                      iconData,
                      // FontAwesomeIcons.search,
                      size: 18,
                      color: Theme.of(context).primaryColor,
                    )
                  : SizedBox(),
              ishsow == true
                  ? SizedBox(
                      width: 8,
                    )
                  : SizedBox(),
              Expanded(
                child: TextField(
                  maxLines: 1,
                  enabled: enabled,
                  onChanged: (String txt) {},
                  cursorColor: Theme.of(context).primaryColor,
                  decoration: InputDecoration(
                      contentPadding: EdgeInsets.all(0),
                      errorText: null,
                      border: InputBorder.none,
                      hintText: text,
                //       hintStyle: TextStyles(context)
                //           .getDescriptionStyle()
                //           .copyWith(
                //               color: Colors.red,
                //               fontSize: 18)),
                // ),
              ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}