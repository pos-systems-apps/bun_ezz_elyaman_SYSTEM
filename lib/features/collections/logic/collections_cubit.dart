import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';

import '../data/repo/collections_repo.dart';
import 'collections_state.dart';

class CollectionsCubit extends Cubit<CollectionsState> {
  final CollectionsRepo _collectionsRepo;

  CollectionsCubit(this._collectionsRepo) : super(InitialState());
  final TextEditingController billNumberController = TextEditingController();
  final TextEditingController moneyController = TextEditingController();
  final TextEditingController notesController = TextEditingController();
  final TextEditingController searchUserController = TextEditingController();
  List<BB> banks = [
    BB(id: 1, name: "بنك الراجحي "),
    BB(
      id: 2,
      name: "البنك الاهلي  ",
    ),
    BB(id: 3, name: "البنك قطر  "),
  ];
  BB? selectedBank;

  changeSelectedBank(BB value) {
    selectedBank = value;
    emit(OnChangeBankSelectState());
  }

  clearSelectedBank() {
    selectedBank = null;
    emit(OnChangeBankSelectState());
  }

  List<BB> pays = [
    BB(id: 1, name: "اجل"),
    BB(id: 2, name: "شبكة"),
    BB(id: 3, name: "كاش "),
  ];
  BB? selectedPay;

  changeSelectedPay(BB value) {
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
    clearSelectedBank();
    clearSelectedPay();
    clearImage();
  }

  static CollectionsCubit get(context) => BlocProvider.of(context);
}

class BB {
  int id;
  String name;

  BB({required this.id, required this.name});
}
