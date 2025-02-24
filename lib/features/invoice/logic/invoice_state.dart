abstract class InvoiceState {}

class InitialState extends InvoiceState {}


class OnGetInvoiceDetailsLoadingState extends InvoiceState {}
class OnGetInvoiceDetailsErrorState extends InvoiceState {}
class OnGetInvoiceDetailsSuccessState extends InvoiceState {}
class OnGetInvoiceDetailsCatchErrorState extends InvoiceState {}
