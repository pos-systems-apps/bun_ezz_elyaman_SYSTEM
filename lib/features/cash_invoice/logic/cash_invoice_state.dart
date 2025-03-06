abstract class CashInvoiceState {}

class InitialState extends CashInvoiceState {}

class OnGetInvoicesLoadingState extends CashInvoiceState {}
class OnGetInvoicesSuccessState extends CashInvoiceState {}
class OnGetInvoicesErrorState extends CashInvoiceState {}
class OnGetInvoicesCatchErrorState extends CashInvoiceState {}
