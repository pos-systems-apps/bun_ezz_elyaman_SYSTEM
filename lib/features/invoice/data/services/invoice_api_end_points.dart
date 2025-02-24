class InvoiceApiEndPoints {
  static getInvoiceDetails(String baseUrl,int invoiceId) =>
      '${baseUrl}api/v1/pos/invoice??order_id=$invoiceId';




}
