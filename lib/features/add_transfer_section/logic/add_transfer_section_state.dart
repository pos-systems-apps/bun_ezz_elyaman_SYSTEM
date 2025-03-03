abstract class AddTransferSectionState {}

class InitialState extends AddTransferSectionState {}

class OnChangeSelectedImageState extends AddTransferSectionState {}

class OnChangeSelectedBankAccountState extends AddTransferSectionState {}

class OnGetBankAccountLoadingState extends AddTransferSectionState {}

class OnGetBankAccountErrorState extends AddTransferSectionState {}

class OnGetBankAccountSuccessState extends AddTransferSectionState {}

class OnGetBankAccountCatchErrorState extends AddTransferSectionState {}

class OnAddTransferSectionLoadingState extends AddTransferSectionState {}

class OnAddTransferSectionSuccessState extends AddTransferSectionState {}

class OnAddTransferSectionErrorState extends AddTransferSectionState {}

class OnAddTransferSectionCatchErrorState extends AddTransferSectionState {
  String error;

  OnAddTransferSectionCatchErrorState({required this.error});
}
