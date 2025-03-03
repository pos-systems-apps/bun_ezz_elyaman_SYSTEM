import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pos_system/features/transfers_section/data/models/transaction_section_response_model.dart';
import 'package:pos_system/features/transfers_section/data/repo/transfer_section_repo.dart';
import 'package:pos_system/features/transfers_section/logic/transfer_section_state.dart';

class TransferSectionCubit extends Cubit<TransferSectionState> {
  final TransferSectionRepo _transferSectionRepo;

  TransferSectionCubit(this._transferSectionRepo) : super(InitialState());

  List<TransactionSectionResponseModel> transactionSection = [];

  getTransactionSection() {
    emit(OnGetTransactionSectionLoadingState());
    _transferSectionRepo.getTransactionSection().then((value) {
      value.fold((l) {
        emit(OnGetTransactionSectionErrorState());
      }, (r) {
        transactionSection = r;
        emit(OnGetTransactionSectionSuccessState());
      });
    }).catchError((error) {
      emit(OnGetTransactionSectionCatchErrorState());
    });
  }

  static TransferSectionCubit get(context) => BlocProvider.of(context);
}
