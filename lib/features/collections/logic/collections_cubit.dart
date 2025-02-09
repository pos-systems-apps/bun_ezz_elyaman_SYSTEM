import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:pos_system/core/utils/app_constant.dart';
import 'package:pos_system/features/splash/data/models/bank_accounts_response_model.dart';
import 'package:pos_system/features/splash/data/models/pay_class.dart';
import 'package:pos_system/features/splash/data/models/users_response_model.dart';
import 'package:pos_system/features/splash/data/repo/splash_repo.dart';

import '../data/repo/collections_repo.dart';
import 'collections_state.dart';

class CollectionsCubit extends Cubit<CollectionsState> {
  final CollectionsRepo _collectionsRepo;
  final SplashRepo _splashRepo;

  CollectionsCubit(this._splashRepo, this._collectionsRepo)
      : super(InitialState());
   TextEditingController billNumberController = TextEditingController();
   TextEditingController moneyController = TextEditingController();
   TextEditingController notesController = TextEditingController();
   TextEditingController searchUserController = TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();



  ///users
  List<UserResponseData> users = [];

  //searchUserController
  getUsers() {
    emit(OnGetUsersLoadingState());
    _splashRepo.getUsers().then((value) {
      value.fold((l) {
        emit(OnGetUsersErrorState());
      }, (r) {
        users = r.userResponseData;
        emit(OnGetUsersSuccessState());
      });
    }).catchError((error) {
      emit(OnGetUsersCatchErrorState());
    });
  }

  ///bank account
  List<AccountsResponseData> bankAccounts = [];

  getBankAccounts() {
    emit(OnGetBankAccountsLoadingState());
    _splashRepo.getBankAccounts().then((value) {
      value.fold((l) {
        emit(OnGetBankAccountsErrorState());
      }, (r) {
        bankAccounts = r.accounts;
        emit(OnGetBankAccountsSuccessState());
      });
    }).catchError((error) {
      emit(OnGetBankAccountsCatchErrorState());
    });
  }

  AccountsResponseData? selectedBankAccount;

  changeSelectedBankAccount(AccountsResponseData value) {
    selectedBankAccount = value;
    emit(OnChangeBankSelectState());
  }

  clearSelectedBankAccount() {
    selectedBankAccount = null;
    emit(OnChangeBankSelectState());
  }

  ///pays
  List<PayClass> pays = AppConstant.pays;
  PayClass? selectedPay;

  changeSelectedPay(PayClass value) {
    selectedPay = value;
    emit(OnChangePaySelectState());
  }

  clearSelectedPay() {
    selectedPay = null;
    emit(OnChangePaySelectState());
  }


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

  clearImage() async {
    selectedImagePath = null;
    emit(OnChangeSelectedImageState());
  }


  cancelCollection() {
    billNumberController.clear();
    moneyController.clear();
    notesController.clear();
    searchUserController.clear();
    clearSelectedBankAccount();
    clearSelectedPay();
    clearImage();
  }

  static CollectionsCubit get(context) => BlocProvider.of(context);
}
