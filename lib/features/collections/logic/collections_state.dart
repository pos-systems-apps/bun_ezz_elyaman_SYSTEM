abstract class CollectionsState {}

class InitialState extends CollectionsState {}

class OnChangeBankSelectState extends CollectionsState {}
class OnChangePaySelectState extends CollectionsState {}
class OnChangeSelectedImageState extends CollectionsState {}


class OnGetUsersLoadingState extends CollectionsState {}
class OnGetUsersErrorState extends CollectionsState {}
class OnGetUsersCatchErrorState extends CollectionsState {}
class OnGetUsersSuccessState extends CollectionsState {}


class OnGetBankAccountsLoadingState extends CollectionsState {}
class OnGetBankAccountsErrorState extends CollectionsState {}
class OnGetBankAccountsCatchErrorState extends CollectionsState {}
class OnGetBankAccountsSuccessState extends CollectionsState {}


