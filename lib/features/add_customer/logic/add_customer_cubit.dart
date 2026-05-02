import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
 import 'package:pos_system/features/add_customer/data/models/add_customer_request.dart';
import 'package:pos_system/features/add_customer/data/repo/add_customer_repo.dart';
import 'package:pos_system/features/add_customer/logic/add_customer_state.dart';

class AddCustomerCubit extends Cubit<AddCustomersState> {
  final AddCustomerRepo _addCustomerRepo;

  AddCustomerCubit(this._addCustomerRepo) : super(InitialState());

  TextEditingController nameController = TextEditingController();

  TextEditingController phoneController = TextEditingController();
  TextEditingController emailController = TextEditingController();

  TextEditingController addressController = TextEditingController();

  GlobalKey<FormState> addCustomerKey = GlobalKey();

  addCustomer() {
    emit(OnAddCustomerLoadingState());
    _addCustomerRepo
        .addCustomer(AddCustomerRequest(
      name: nameController.text,
      mobile: phoneController.text,
      email: emailController.text,
      address: addressController.text,
    ))
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
    nameController.clear();
    phoneController.clear();
    emailController.clear();
    addressController.clear();
  }

  static AddCustomerCubit get(context) => BlocProvider.of(context);
}
