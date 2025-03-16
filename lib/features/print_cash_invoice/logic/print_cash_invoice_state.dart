abstract class PrintCashInvoiceState {}

class InitialState extends PrintCashInvoiceState {}


class OnGetCashInvoiceDetailsLoadingState extends PrintCashInvoiceState {}
class OnGetCashInvoiceDetailsErrorState extends PrintCashInvoiceState {}
class OnGetCashInvoiceDetailsSuccessState extends PrintCashInvoiceState {}
class OnGetCashInvoiceDetailsCatchErrorState extends PrintCashInvoiceState {}
