import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sport_shop/common/widgets/texts/section_heading.dart';
import 'package:sport_shop/features/personalization/models/address_model.dart';
import 'package:sport_shop/features/personalization/screens/address/add_new_address.dart';
import 'package:sport_shop/features/personalization/screens/address/widgets/single_address.dart';
import 'package:sport_shop/utils/constants/sizes.dart';
import 'package:sport_shop/utils/helpers/cloud_helper_functions.dart';
import 'package:sport_shop/utils/helpers/network_manager.dart';
import 'package:sport_shop/utils/popups/full_screen_loader.dart';
import 'package:sport_shop/utils/popups/loaders.dart';

import '../../../data/repositories/address/address_repository.dart';

class AddressController extends GetxController{
  static AddressController get instance => Get.find();

  final name = TextEditingController();
  final phoneNumber = TextEditingController();
  final street = TextEditingController();
  final postalCode = TextEditingController();
  final city = TextEditingController();
  final region = TextEditingController();
  final country = TextEditingController();
  GlobalKey<FormState> addressFormKey = GlobalKey<FormState>();

  RxBool refreshData = true.obs;
  final Rx<AddressModel> selectedAddress = AddressModel.empty().obs;
  final addressRepository = Get.put(AddressRepository());

  Future<List<AddressModel>> allUserAddresses() async{
    try{
      final addresses = await addressRepository.fetchUserAddresses();
      selectedAddress.value = addresses.firstWhere((element) => element.selectedAddress, orElse: () => AddressModel.empty());
      return addresses;
    }catch(e){
      MyLoaders.errorSnackBar(title: 'Адреса не найдены', message: e.toString());
      return [];
    }
  }

  Future selectAddress(AddressModel newSelectedAddress) async{
    try{

      if(selectedAddress.value.id.isNotEmpty){
        await addressRepository.updateSelectedField(selectedAddress.value.id, false);
      }

      newSelectedAddress.selectedAddress = true;
      selectedAddress.value = newSelectedAddress;

      await addressRepository.updateSelectedField(selectedAddress.value.id, true);

    }catch(e){
      MyLoaders.errorSnackBar(title: 'Ошибка в выборе', message: e.toString());
    }
  }

  Future addNewAddresses() async{
    try{
      MyFullScreenLoader.openLoadingDialog('Сохраняем ваш адрес...', 'assets/images/animations/loading.json');

      final isConnected = await NetworkManager.instance.isConnected();
      if(!isConnected){
        MyFullScreenLoader.stopLoading();
        return;
      }

      final address = AddressModel(
          id: '',
          name: name.text.trim(),
          phoneNumber: phoneNumber.text.trim(),
          street: street.text.trim(),
          city: city.text.trim(),
          region: region.text.trim(),
          postalCode: postalCode.text.trim(),
          country: country.text.trim(),
        selectedAddress: true,
      );
      final id = await addressRepository.addAddress(address);

      address.id = id;
      await selectAddress(address);

      MyFullScreenLoader.stopLoading();

      MyLoaders.successSnackBar(title: 'Поздравляем!', message: 'Ваш адресс успешно добавлен');

      refreshData.toggle();

      resetFormFields();

      Navigator.of(Get.context!).pop();

    }catch(e){
      MyFullScreenLoader.stopLoading();
      MyLoaders.errorSnackBar(title: 'Адресс не найден', message: e.toString());
    }
  }

  Future<dynamic> selectNewAddressPopup(BuildContext context){
    return showModalBottomSheet(
        context: context,
        builder: (_) => Container(
          padding: const EdgeInsets.all(MySizes.lg),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const MySectionHeading(title: 'Выберите адрес', showActionButton: false,),
              FutureBuilder(
                  future: allUserAddresses(),
                  builder: (_, snapshot){
                    final response = CloudHelperFunctions.checkMultiRecordState(snapshot: snapshot);
                    if(response != null) return response;

                    return ListView.builder(
                      shrinkWrap: true,
                        itemCount: snapshot.data!.length,
                        itemBuilder: (_, index) => SingleAddress(
                          address: snapshot.data![index],
                          onTap: () async{
                            await selectAddress(snapshot.data![index]);
                            Get.back();
                          },
                        )
                    );
                  }
              ),
              const SizedBox(height: MySizes.defaultSpace * 2,),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(onPressed: () => Get.to(() => const AddNewAddressScreen()), child: const Text('Добавить новый адрес'),),
              )
            ],
          ),
        )
    );
  }

  void resetFormFields(){
    name.clear();
    phoneNumber.clear();
    street.clear();
    postalCode.clear();
    city.clear();
    region.clear();
    country.clear();
    addressFormKey.currentState?.reset();
  }
}