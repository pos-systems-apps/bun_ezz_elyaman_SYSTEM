import 'dart:convert';
import '../../../../core/api/api_consumer.dart';
import '../../../../core/api/status_code.dart';
import '../../../../core/exceptions/exceptions.dart';
import '../../../../core/exceptions/failure.dart';
import '../models/confirm_collection_request_model.dart';
import '../models/confirm_collection_response_model.dart';
import 'collections_api_end_points.dart';

class CollectionsService {
  ApiConsumer apiConsumer;

  CollectionsService({required this.apiConsumer});

  Future<ConfirmCollectionResponseModel> confirmCollection(
      ConfirmCollectionRequestModel parameter) async {
    final response = await apiConsumer.post(
        CollectionsApiEndPoints.appSettingUrl,
        ConfirmCollectionRequestModel(
          billID: parameter.billID,
          bankAccountID: parameter.bankAccountID,
          paymentWayID: parameter.paymentWayID,
          customerID: parameter.customerID,
          price: parameter.price,
          noteText: parameter.noteText,
          image: parameter.image,
        ).toJson(),
        null);
    if (response.statusCode == StatusCode.ok) {
      return ConfirmCollectionResponseModel.fromJson(jsonDecode(response.body));
    } else {
      throw ServerException(
          serverFailure: ServerFailure.fromJson(jsonDecode(response.body)));
    }
  }
}
