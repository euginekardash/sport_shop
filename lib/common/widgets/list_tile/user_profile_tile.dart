import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:iconsax/iconsax.dart';
import 'package:sport_shop/common/styles/shimmer.dart';
import 'package:sport_shop/common/widgets/images/circular_image.dart';
import 'package:sport_shop/features/personalization/controllers/user_controller.dart';

class MyUserProfileTile extends StatelessWidget {
  const MyUserProfileTile({
    super.key,required this.onPressed,
  });

  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    final controller = UserController.instance;
    return ListTile(
      leading: Obx(() {
        final networkImage = controller.user.value.profilePicture;
        final image = networkImage.isNotEmpty ? networkImage : 'assets/images/user/user.png';
        return controller.imageUploading.value
            ? const ShimmerEffect(width: 50, height: 50, radius: 50,)
            : MyCircularImage(image: image, width: 50, height: 50, isNetworkImage: networkImage.isNotEmpty,);
      }),
      title: Text(controller.user.value.fullName, style: Theme.of(context).textTheme.headlineSmall!.apply(color: Colors.white),),
      subtitle: Text(controller.user.value.email, style: Theme.of(context).textTheme.bodyMedium!.apply(color: Colors.white),),
      trailing: IconButton(onPressed: onPressed, icon: const Icon(Iconsax.edit, color: Colors.white,),),
    );
  }
}