abstract class RequestResourcesInvoicesState {}

class InitialState extends RequestResourcesInvoicesState {}

class OnGetInvoicesLoadingState extends RequestResourcesInvoicesState {}
class OnGetInvoicesSuccessState extends RequestResourcesInvoicesState {}
class OnGetInvoicesErrorState extends RequestResourcesInvoicesState {}
class OnGetInvoicesCatchErrorState extends RequestResourcesInvoicesState {}
