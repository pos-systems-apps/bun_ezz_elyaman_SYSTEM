import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:pos_system/features/add_customer/data/models/add_customer_request.dart';
import 'package:pos_system/features/add_customer/data/repo/add_customer_repo.dart';
import 'package:pos_system/features/add_customer/logic/add_customer_state.dart';
import 'package:pos_system/features/splash/data/models/categories_and_regions_response.dart';
import 'package:pos_system/features/splash/data/repo/splash_repo.dart';

class AddCustomerCubit extends Cubit<AddCustomersState> {
  final AddCustomerRepo _addCustomerRepo;
  final SplashRepo _splashRepo;

  AddCustomerCubit(this._addCustomerRepo, this._splashRepo)
      : super(InitialState());

  TextEditingController nameArabicController = TextEditingController();
  TextEditingController nameEnglishController = TextEditingController();
  TextEditingController numberTaxController = TextEditingController();
  TextEditingController commercialNumberController = TextEditingController();

  TextEditingController phoneController = TextEditingController();
  TextEditingController emailController = TextEditingController();

  TextEditingController countryCodeController = TextEditingController();
  TextEditingController countryController = TextEditingController();
  TextEditingController addressController = TextEditingController();

  GlobalKey<FormState> addCustomerKey = GlobalKey();

  ///upload image

  String? selectedImagePath;

  uploadImage() async {
    final ImagePicker picker = ImagePicker();
    final XFile? image = await picker.pickImage(source: ImageSource.gallery);
    if (image != null) {
      selectedImagePath = image.path;
      emit(OnChangeSelectedImageState());
    }
  }

  clearSelectedImage() {
    selectedImagePath = null;
    emit(OnChangeSelectedImageState());
  }

  Region? selectedRegion;
  Category? selectedCategory;
  List<Region> regions = [];
  List<Category> categories = [];

  getCategoriesAndRegions() {
    emit(OnGetCategoriesAndRegionsLoadingState());
    _splashRepo.getCategoriesAndRegions().then((value) {
      value.fold((l) {
        emit(OnGetCategoriesAndRegionsErrorState());
      }, (r) {
        regions = r.regions;
        categories = r.categories;
        emit(OnGetCategoriesAndRegionsSuccessState());
      });
    }).catchError((error) {
      emit(OnGetCategoriesAndRegionsCatchErrorState());
    });
  }

  changeSelectedCategory(Category value) {
    selectedCategory = value;
    emit(OnChangeSelectedCategoryState());
  }

  clearSelectedCategory() {
    selectedCategory = null;
    emit(OnChangeSelectedCategoryState());
  }

  changeSelectedRegion(Region value) {
    selectedRegion = value;
    emit(OnChangeSelectedRegionState());
  }

  clearSelectedRegion() {
    selectedRegion = null;
    emit(OnChangeSelectedRegionState());
  }

  addCustomer() {
    emit(OnAddCustomerLoadingState());
    _addCustomerRepo
        .addCustomer(AddCustomerRequest(
            nameAr: nameArabicController.text,
            nameEn: nameEnglishController.text,
            regionId: selectedRegion!.id,
            mobile: phoneController.text,
            typeId: selectedCategory!.id,
            numberTax: numberTaxController.text,
            commercialNumber: commercialNumberController.text,
            email: emailController.text,
            city: countryController.text,
            countryCode: countryCodeController.text,
            address: addressController.text,
            image: selectedImagePath))
        .then((value) {
      value.fold((l) {
        emit(OnAddCustomerErrorState());
      }, (r) {
        emit(OnAddCustomerSuccessState());
      });
    }).catchError((error) {
      emit(OnAddCustomerCatchErrorState());
    });
  }

  ///
  clearAddCustomerData() {
    nameArabicController.clear();
    nameEnglishController.clear();
    numberTaxController.clear();
    commercialNumberController.clear();
    phoneController.clear();
    emailController.clear();
    countryCodeController.clear();
    countryController.clear();
    addressController.clear();
    clearSelectedImage();
    clearSelectedCategory();
    clearSelectedRegion();
  }

  static AddCustomerCubit get(context) => BlocProvider.of(context);
}
