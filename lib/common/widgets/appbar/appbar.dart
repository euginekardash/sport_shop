import 'package:flutter/material.dart';
import 'package:sport_shop/utils/constants/sizes.dart';
import 'package:sport_shop/utils/device/device_utility.dart';
import 'package:get/get.dart';
import 'package:sport_shop/utils/helpers/helper_functions.dart';

class MyAppBar extends StatelessWidget implements PreferredSizeWidget{
  const MyAppBar({
    super.key,
    this.title,
    this.showBackArrow = false,
    this.leadingIcon,
    this.actions,
    this.leadingOnPressed});

  final Widget? title;
  final bool showBackArrow;
  final IconData? leadingIcon;
  final List<Widget>? actions;
  final VoidCallback? leadingOnPressed;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: MySizes.md),
      child: AppBar(
        centerTitle: false,
        automaticallyImplyLeading: false,
        leading: showBackArrow
            ? IconButton(onPressed: () => Get.back(), icon: CircleAvatar(child: Icon (Icons.arrow_back, color:MyHelperFunctions.isDarkMode(context) ? Colors.black : Colors.white,)))
            : leadingIcon != null ?  IconButton(onPressed: leadingOnPressed, icon: Icon (leadingIcon)) : null,
        title: title,
        actions: actions,
      ),
    );
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => Size.fromHeight(MyDeviceUtils.getAppBarHeight());
}
