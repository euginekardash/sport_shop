import 'package:get/get.dart';
import 'package:sport_shop/data/repositories/banners/banner_repository.dart';
import 'package:sport_shop/features/shop/models/banner_model.dart';
import 'package:sport_shop/utils/popups/loaders.dart';

class BannerController extends GetxController{

  final isLoading = false.obs;
  final carouselCurrentIndex = 0.obs;
  final RxList<BannerModel> banners = <BannerModel>[].obs;


  @override
  void onInit() {
    fetchBanners();
    super.onInit();
  }

  void updatePageIndicator(index) {
    carouselCurrentIndex.value = index;
  }

  Future<void> fetchBanners() async{
    try{

      isLoading.value = true;

      final bannerRepo = Get.put(BannerRepository());
      final banners = await bannerRepo.fetchBanners();

      this.banners.assignAll(banners);

    }catch(e){
      MyLoaders.errorSnackBar(title: 'Oh snap', message: e.toString());
    } finally{
      isLoading.value = false;
    }
  }
}