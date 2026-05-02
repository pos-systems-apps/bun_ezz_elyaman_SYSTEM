// import 'package:easy_localization/easy_localization.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:geolocator/geolocator.dart';
// import 'package:pos_system/core/services/location_service.dart';
// import 'package:pos_system/core/widgets/error_alert_dialog.dart';
// import 'package:pos_system/features/create_visit/data/models/create_visit_request.dart';
// import 'package:pos_system/features/create_visit/data/repo/create_visit_repo.dart';
// import 'package:pos_system/features/create_visit/logic/create_visit_state.dart';
// import 'package:pos_system/features/splash/data/models/users_response_model.dart';
// import 'package:pos_system/features/splash/data/repo/splash_repo.dart';
//
// class CreateVisitCubit extends Cubit<CreateVisitState> {
//   final CreateVisitRepo _createVisitRepo;
//   final SplashRepo _splashRepo;
//
//   CreateVisitCubit(this._createVisitRepo, this._splashRepo)
//       : super(InitialState());
//
//   TextEditingController searchUserController = TextEditingController();
//   GlobalKey<FormState> visitKey = GlobalKey();
//
//   ///customers
//   List<CustomerModel> users = [];
//
//   getUsers() {
//     emit(OnGetUsersLoadingState());
//     _splashRepo.getUsers(searchUserController.text).then((value) {
//       value.fold((l) {
//         emit(OnGetUsersErrorState());
//       }, (r) {
//         users = r.data;
//         emit(OnGetUsersSuccessState());
//       });
//     }).catchError((error) {
//       emit(OnGetUsersCatchErrorState());
//     });
//   }
//
//   CustomerModel? selectedUser;
//
//   onSelectUser(CustomerModel vale) {
//     searchUserController.text = vale.name;
//     selectedUser = vale;
//     users.clear();
//     emit(OnSelectUserState());
//   }
//
//   clearSelectedUSer() {
//     selectedUser = null;
//     users.clear();
//     emit(OnSelectUserState());
//   }
//
//   TextEditingController notesController = TextEditingController();
//
//   createVisit(BuildContext context) async{
//     emit(OnCreateVisitLoadingState());
//     Position? position = await YourLocation.getCurrentLocation();
//     if (position == null) {
//       ErrorAlertDialog.getDialog(context, "قم باختيار الموقع ");
//     } else {
//       _createVisitRepo
//           .createVisit(CreateVisitRequest(
//           lang: position.longitude,
//           lat: position.latitude,
//           customerId: selectedUser!.id,
//           note: notesController.text))
//           .then((value) {
//         value.fold((l) {
//           emit(OnCreateVisitErrorState());
//         }, (r) async {
//           emit(OnCreateVisitSuccessState());
//         });
//       }).catchError((error) {
//         emit(OnCreateVisitCatchErrorState(error: "error".tr()));
//       });
//     }
//   }
//
//   clearSelectedData() {
//     notesController.clear();
//     selectedUser = null;
//     searchUserController.clear();
//     users = [];
//   }
//
//   static CreateVisitCubit get(context) => BlocProvider.of(context);
// }
