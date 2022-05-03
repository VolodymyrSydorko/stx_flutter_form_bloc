import 'package:flutter/material.dart';
import 'package:stx_form_bloc/stx_form_bloc.dart';

typedef FormBlocListenerCallback<SuccessResponse, FailureResponse>
    = void Function(BuildContext context,
        FormBlocState<SuccessResponse, FailureResponse> state);
