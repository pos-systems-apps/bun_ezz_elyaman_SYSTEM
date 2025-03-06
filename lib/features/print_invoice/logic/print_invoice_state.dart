abstract class PrintInvoiceState {}

class InitialState extends PrintInvoiceState {}


class OnGetInvoiceDetailsLoadingState extends PrintInvoiceState {}
class OnGetInvoiceDetailsErrorState extends PrintInvoiceState {}
class OnGetInvoiceDetailsSuccessState extends PrintInvoiceState {}
class OnGetInvoiceDetailsCatchErrorState extends PrintInvoiceState {}
