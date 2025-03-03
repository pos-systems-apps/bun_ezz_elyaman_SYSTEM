import 'dart:io';
import 'dart:typed_data';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pos_system/features/fund_list/data/models/fund_list_request.dart';
import 'package:pos_system/features/fund_list/data/models/fund_list_response_model.dart';
import 'package:pos_system/features/fund_list/data/repo/fund_list_repo.dart';
import 'package:pos_system/features/fund_list/logic/fund_list_state.dart';

import 'package:pdf/widgets.dart' as pw;
import 'package:path_provider/path_provider.dart';
import 'package:open_file/open_file.dart';
import 'dart:io';

import 'package:screenshot/screenshot.dart';

class FundListCubit extends Cubit<FundListState> {
  final FundListRepo _fundListRepo;

  FundListCubit(this._fundListRepo) : super(InitialState());

  DateTime selectedFromDate = DateTime.now();
  DateTime selectedToDate = DateTime.now();

  Future<void> selectDate(BuildContext context, bool isFrom) async {
    if (Platform.isAndroid) {
      DateTime? pickedDate = await showDatePicker(
        context: context,
        initialDate: isFrom ? selectedFromDate : selectedToDate,
        firstDate: DateTime(1900),
        lastDate: DateTime(2200),
      );
      if (pickedDate != null) {
        if (isFrom) {
          selectedFromDate = pickedDate;
        } else {
          selectedToDate = pickedDate;
        }
      }
    } else if (Platform.isIOS) {
      showModalBottomSheet(
        context: context,
        builder: (BuildContext builder) {
          return SizedBox(
            height: 250.h,
            child: CupertinoDatePicker(
              mode: CupertinoDatePickerMode.date,
              initialDateTime: isFrom ? selectedFromDate : selectedToDate,
              minimumDate: DateTime(2000),
              maximumDate: DateTime(2100),
              onDateTimeChanged: (DateTime newDate) {
                if (isFrom) {
                  selectedFromDate = newDate;
                } else {
                  selectedToDate = newDate;
                }
                emit(OnChangeDateState());
              },
            ),
          );
        },
      );
    }
    emit(OnChangeDateState());
  }

  List<BoxItem> fundList = [];
  Seller? seller;

  getFundList() {
    emit(OnGetFundListLoadingState());
    _fundListRepo
        .getFundList(FundListRequest(
            from: _formatDate(selectedFromDate),
            to: _formatDate(selectedToDate)))
        .then((value) {
      value.fold((l) {
        emit(OnGetFundListErrorState());
      }, (r) {
        fundList = r.boxList;
        seller = r.seller;
        emit(OnGetFundListSuccessState());
      });
    }).catchError((error) {
      emit(OnGetFundListCatchErrorState());
    });
  }

  ScreenshotController screenshotController =
      ScreenshotController(); // Controller to capture screenshot

  captureAndGeneratePDF() async {
    emit(OnSavePDFLoadingState());
    try {
      screenshotController.capture().then((Uint8List? image) async {
        if (image != null) {
          // Convert image to PDF
          // Create a PDF document
          final pdf = pw.Document();
          // Convert the captured screenshot (Uint8List) into a PdfImage
          final pdfImage = pw.MemoryImage(image);
          // Add image to PDF document
          pdf.addPage(
            pw.Page(
              build: (pw.Context context) {
                return pw.Image(pdfImage); // Add the screenshot as an image
              },
            ),
          );
          // Get the directory to store the PDF
          final directory = await getApplicationDocumentsDirectory();
          final filePath = '${directory.path}/${DateTime.now()}.pdf';

          // Write the PDF to the file
          final file = File(filePath);
          await file.writeAsBytes(await pdf.save());

          // Optionally, open the PDF
          OpenFile.open(filePath);
        }
      }).catchError((e) {
        print("Error capturing screenshot: $e");
      });
    } catch (error) {
      print(error);
    }
    emit(OnSavePDFDoneState());
  }

  String _formatDate(DateTime date) {
    return "${date.year}-${date.month.toString().padLeft(2, '0')}-${date.day.toString().padLeft(2, '0')}";
  }

  static FundListCubit get(context) => BlocProvider.of(context);
}
