// import 'package:easy_localization/easy_localization.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:image_picker/image_picker.dart';
// import 'package:pos_system/features/add_transfer_section/data/models/add_transfer_section_request.dart';
// import 'package:pos_system/features/add_transfer_section/data/repo/add_transfer_section_repo.dart';
// import 'package:pos_system/features/add_transfer_section/logic/add_transfer_section_state.dart';
// import 'package:pos_system/features/splash/data/models/bank_accounts_response_model.dart';
// import 'package:pos_system/features/splash/data/repo/splash_repo.dart';
//
// class AddTransferSectionCubit extends Cubit<AddTransferSectionState> {
//   final AddTransferSectionRepo _addTransferSectionRepo;
//   final SplashRepo _splashRepo;
//
//   AddTransferSectionCubit(this._addTransferSectionRepo, this._splashRepo)
//       : super(InitialState());
//
//   TextEditingController moneyController = TextEditingController();
//   TextEditingController noteController = TextEditingController();
//   GlobalKey<FormState> transferKey = GlobalKey();
//   String? selectedImagePath;
//
//   uploadImage() async {
//     final ImagePicker picker = ImagePicker();
//     final XFile? image = await picker.pickImage(source: ImageSource.gallery);
//     if (image != null) {
//       selectedImagePath = image.path;
//       emit(OnChangeSelectedImageState());
//     }
//   }
//
//   clearImageSelected() {
//     selectedImagePath = null;
//     emit(OnChangeSelectedImageState());
//   }
//
//   List<AccountsResponseData> accounts = [];
//
//   getAccounts() {
//     emit(OnGetBankAccountLoadingState());
//     _splashRepo.getBankAccounts().then((value) {
//       value.fold((l) {
//         emit(OnGetBankAccountErrorState());
//       }, (r) {
//         accounts = r.accounts;
//         emit(OnGetBankAccountSuccessState());
//       });
//     }).catchError((error) {
//       emit(OnGetBankAccountCatchErrorState());
//     });
//   }
//
//   AccountsResponseData? selectedBankAccount;
//
//   onChangeSelectedBankAccount(AccountsResponseData value) {
//     selectedBankAccount = value;
//     emit(OnChangeSelectedBankAccountState());
//   }
//
//   clearAccountSelected() {
//     selectedBankAccount = null;
//     emit(OnChangeSelectedBankAccountState());
//   }
//
//   addTransferSection() {
//     emit(OnAddTransferSectionLoadingState());
//     _addTransferSectionRepo
//         .addTransferSection(
//       AddTransferSectionRequest(
//           bankAccountId: selectedBankAccount!.id,
//           amount: moneyController.text,
//           note: noteController.text,
//           image: selectedImagePath),
//     )
//         .then((value) {
//       value.fold((l) {
//         emit(OnAddTransferSectionErrorState());
//       }, (r) async {
//         emit(OnAddTransferSectionSuccessState());
//       });
//     }).catchError((error) {
//       emit(OnAddTransferSectionCatchErrorState(error: "error".tr()));
//     });
//   }
//
//   clearSelectedData() {
//     noteController.clear();
//     clearAccountSelected();
//     clearImageSelected();
//     moneyController.clear();
//   }
//
//   static AddTransferSectionCubit get(context) => BlocProvider.of(context);
// }
