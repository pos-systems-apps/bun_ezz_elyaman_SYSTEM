import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:pos_system/features/add_transfer_section/logic/add_transfer_section_state.dart';
import 'package:pos_system/features/create_visit/data/repo/create_visit_repo.dart';

class AddTransferSectionCubit extends Cubit<AddTransferSectionState> {
  final CreateVisitRepo _createVisitRepo;

  AddTransferSectionCubit(this._createVisitRepo) : super(InitialState());

  TextEditingController accountController = TextEditingController();
  TextEditingController moneyController = TextEditingController();
  TextEditingController noteController = TextEditingController();

  String? selectedImagePath;

  uploadImage() async {
    final ImagePicker picker = ImagePicker();
    final XFile? image = await picker.pickImage(source: ImageSource.gallery);
    if (image != null) {
      selectedImagePath = image.path;
      emit(OnChangeSelectedImageState());
    }
  }

  //
  // getUsers() {
  //   emit(OnGetUsersLoadingState());
  //   _splashRepo.getUsers(searchUserController.text).then((value) {
  //     value.fold((l) {
  //       emit(OnGetUsersErrorState());
  //     }, (r) {
  //       users = r.userResponseData;
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
  //   users.clear();
  //   emit(OnSelectUserState());
  // }
  //
  // clearSelectedUSer() {
  //   selectedUser = null;
  //   users.clear();
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

  // clearSelectedData() {
  //   notesController.clear();
  //   selectedUser = null;
  //   searchUserController.clear();
  //   users = [];
  // }

  static AddTransferSectionCubit get(context) => BlocProvider.of(context);
}
