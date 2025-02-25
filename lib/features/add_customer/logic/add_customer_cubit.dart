import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:pos_system/features/add_customer/data/repo/add_customer_repo.dart';
import 'package:pos_system/features/add_customer/logic/add_customer_state.dart';

class AddCustomerCubit extends Cubit<AddCustomersState> {
  final AddCustomerRepo _addCustomerRepo;

  AddCustomerCubit(this._addCustomerRepo) : super(InitialState());

  TextEditingController nameArabicController = TextEditingController();
  TextEditingController nameEnglishController = TextEditingController();
  TextEditingController locationController = TextEditingController();
  TextEditingController classificationController = TextEditingController();
  TextEditingController numberTaxController = TextEditingController();
  TextEditingController commercialNumberController = TextEditingController();

  TextEditingController phoneController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController statusController = TextEditingController();

  TextEditingController countryCodeController = TextEditingController();
  TextEditingController countryController = TextEditingController();
  TextEditingController addressController = TextEditingController();


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






  clearAddCustomerData() {
    nameArabicController.clear();
    nameEnglishController.clear();
    locationController.clear();
    classificationController.clear();
    numberTaxController.clear();
    commercialNumberController.clear();
    phoneController.clear();
    emailController.clear();
    statusController.clear();
    countryCodeController.clear();
    countryController.clear();
    addressController.clear();
    selectedImagePath = null;
  }
  ///customers
  // List<UserResponseData> customers = [];

  // getUsers() {
  //   emit(OnGetUsersLoadingState());
  //   _splashRepo.getUsers(searchUserController.text).then((value) {
  //     value.fold((l) {
  //       emit(OnGetUsersErrorState());
  //     }, (r) {
  //       customers = r.userResponseData;
  //       emit(OnGetUsersSuccessState());
  //     });
  //   }).catchError((error) {
  //     emit(OnGetUsersCatchErrorState());
  //   });
  // }
  //
  // UserResponseData? selectedUser;
  //
  // onSelectUser(UserResponseData vale) {
  //   searchUserController.text = vale.nameAr;
  //   selectedUser = vale;
  //   customers.clear();
  //   emit(OnSelectUserState());
  // }
  //
  // clearSelectedUSer() {
  //   selectedUser = null;
  //   customers.clear();
  //   emit(OnSelectUserState());
  // }
  //
  // TextEditingController notesController = TextEditingController();
  //
  // createVisit() {
  //   emit(OnCreateVisitLoadingState());
  //   _createVisitRepo
  //       .createVisit(CreateVisitRequest(
  //           customerId: selectedUser!.id, note: notesController.text))
  //       .then((value) {
  //     value.fold((l) {
  //       emit(OnCreateVisitErrorState());
  //     }, (r) async {
  //       emit(OnCreateVisitSuccessState());
  //     });
  //   }).catchError((error) {
  //     emit(OnCreateVisitCatchErrorState(error: "error".tr()));
  //   });
  // }
  //
  // clearSelectedData() {
  //   notesController.clear();
  //   selectedUser = null;
  //   searchUserController.clear();
  //   customers = [];
  // }

  static AddCustomerCubit get(context) => BlocProvider.of(context);
}
