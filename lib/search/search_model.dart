import '/components/filter_head_widget.dart';
import '/components/list_company_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'search_widget.dart' show SearchWidget;
import 'package:flutter/material.dart';

class SearchModel extends FlutterFlowModel<SearchWidget> {
  ///  State fields for stateful widgets in this page.

  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode1;
  TextEditingController? textController1;
  String? Function(BuildContext, String?)? textController1Validator;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode2;
  TextEditingController? textController2;
  String? Function(BuildContext, String?)? textController2Validator;
  // Model for FilterHead component.
  late FilterHeadModel filterHeadModel;
  // Model for listCompany component.
  late ListCompanyModel listCompanyModel;

  @override
  void initState(BuildContext context) {
    filterHeadModel = createModel(context, () => FilterHeadModel());
    listCompanyModel = createModel(context, () => ListCompanyModel());
  }

  @override
  void dispose() {
    textFieldFocusNode1?.dispose();
    textController1?.dispose();

    textFieldFocusNode2?.dispose();
    textController2?.dispose();

    filterHeadModel.dispose();
    listCompanyModel.dispose();
  }
}
