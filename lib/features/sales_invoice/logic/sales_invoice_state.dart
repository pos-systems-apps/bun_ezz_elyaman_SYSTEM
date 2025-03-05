abstract class SalesInvoiceState {}

class InitialState extends SalesInvoiceState {}

class OnGetInvoicesLoadingState extends SalesInvoiceState {}
class OnGetInvoicesSuccessState extends SalesInvoiceState {}
class OnGetInvoicesErrorState extends SalesInvoiceState {}
class OnGetInvoicesCatchErrorState extends SalesInvoiceState {}
