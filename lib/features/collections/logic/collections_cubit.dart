import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:pos_system/core/services/services_locator.dart';
import 'package:pos_system/core/utils/app_constant.dart';
import 'package:pos_system/core/widgets/error_alert_dialog.dart';
import 'package:pos_system/features/collections/data/models/confirm_collection_request_model.dart';
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
  // TextEditingController billNumberController = TextEditingController();
  // TextEditingController moneyController = TextEditingController();
  TextEditingController notesController = TextEditingController();
  TextEditingController searchUserController = TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  ///customers
  List<CustomerModel> users = [];

  getUsers() {
    emit(OnGetUsersLoadingState());
    _splashRepo.getUsers(searchUserController.text).then((value) {
      value.fold((l) {
        emit(OnGetUsersErrorState());
      }, (r) {
        users = r.data;
        emit(OnGetUsersSuccessState());
      });
    }).catchError((error) {
      emit(OnGetUsersCatchErrorState());
    });
  }

  CustomerModel? selectedUser;

  onSelectUser(CustomerModel vale) {
    searchUserController.text = vale.name;
    selectedUser = vale;
    users.clear();
    emit(OnSelectUserState());
  }

  clearSelectedUSer() {
    selectedUser = null;
    users.clear();
    emit(OnSelectUserState());
  }





  final TextEditingController itemController = TextEditingController();

  List<String> items = [];

  void addItem(String item) {
    final text = item.trim();

    if (text.isEmpty) return;

    items.add(text);

    emit(OnAddItemState());
  }

  void removeItem(int index) {
    if (index < 0 || index >= items.length) return;

    items.removeAt(index);

    emit(OnRemoveItemState());
  }

  void clearItems() {
    items.clear();

    emit(OnClearItemsState());
  }



  ///bank account
  // List<AccountsResponseData> bankAccounts = [];
  //
  // getBankAccounts() {
  //   emit(OnGetBankAccountsLoadingState());
  //   _splashRepo.getBankAccounts().then((value) {
  //     value.fold((l) {
  //       emit(OnGetBankAccountsErrorState());
  //     }, (r) {
  //       bankAccounts = r.accounts;
  //       emit(OnGetBankAccountsSuccessState());
  //     });
  //   }).catchError((error) {
  //     emit(OnGetBankAccountsCatchErrorState());
  //   });
  // }

  // AccountsResponseData? selectedBankAccount;
  //
  // changeSelectedBankAccount(AccountsResponseData value) {
  //   selectedBankAccount = value;
  //   emit(OnChangeBankSelectState());
  // }
  //
  // clearSelectedBankAccount() {
  //   selectedBankAccount = null;
  //   emit(OnChangeBankSelectState());
  // }

  // ///pays
  // List<PayClass> pays =
  //     getIt<AppConstant>().pays.where((item) => item.isShown).toList();
  // PayClass? selectedPay;
  //
  // changeSelectedPay(PayClass value) {
  //   selectedPay = value;
  //   emit(OnChangePaySelectState());
  // }
  //
  // clearSelectedPay() {
  //   selectedPay = null;
  //   emit(OnChangePaySelectState());
  // }

  // ///upload image
  //
  // String? selectedImagePath;
  //
  // uploadImage() async {
  //   final ImagePicker picker = ImagePicker();
  //   final XFile? image = await picker.pickImage(source: ImageSource.gallery);
  //   if (image != null) {
  //     selectedImagePath = image.path;
  //     emit(OnChangeSelectedImageState());
  //   }
  // }
  //
  // clearImage() async {
  //   selectedImagePath = null;
  //   emit(OnChangeSelectedImageState());
  // }

  cancelCollection() {
    // billNumberController.clear();
    // moneyController.clear();
    notesController.clear();
    searchUserController.clear();
    // clearSelectedBankAccount();
    clearSelectedUSer();
    // clearSelectedPay();
    // clearImage();
  }

  confirmCollection() {
    emit(OnConfirmCollectionLoadingState());
    _collectionsRepo
        .confirmCollection(ConfirmCollectionRequestModel(
            customerID: selectedUser!.id,
            noteText: notesController.text,
            items: items))
        .then((value) {
      value.fold((l) {
        emit(OnConfirmCollectionErrorState(error: l.message));
      }, (r) {
        emit(OnConfirmCollectionSuccessState(message: r.message ?? ""));
      });
    }).catchError((error) {
      emit(OnConfirmCollectionCatchErrorState(error: "error"));
    });
  }

  static CollectionsCubit get(context) => BlocProvider.of(context);
}
