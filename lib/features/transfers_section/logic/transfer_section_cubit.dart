import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pos_system/features/create_visit/data/repo/create_visit_repo.dart';
import 'package:pos_system/features/transfers_section/logic/transfer_section_state.dart';

class TransferSectionCubit extends Cubit<TransferSectionState> {
  final CreateVisitRepo _createVisitRepo;

  TransferSectionCubit(this._createVisitRepo) : super(InitialState());



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

  static TransferSectionCubit get(context) => BlocProvider.of(context);
}
