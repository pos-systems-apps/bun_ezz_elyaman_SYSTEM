abstract class ReturnInvoiceState {}

class InitialState extends ReturnInvoiceState {}
class OnGetInvoicesLoadingState extends ReturnInvoiceState {}
class OnGetInvoicesErrorState extends ReturnInvoiceState {}
class OnGetInvoicesSuccessState extends ReturnInvoiceState {}
class OnGetInvoicesCatchErrorState extends ReturnInvoiceState {}
