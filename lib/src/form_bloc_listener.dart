import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:stx_flutter_form_bloc/src/typedefs.dart';
import 'package:stx_form_bloc/stx_form_bloc.dart';

class FormBlocListener<T extends FormBloc<SuccessResponse, FailureResponse>,
        SuccessResponse, FailureResponse>
    extends BlocListener<T, FormBlocState<SuccessResponse, FailureResponse>> {
  FormBlocListener({
    Key? key,
    this.formBloc,
    Widget? child,
    this.onSubmitting,
    this.onSuccess,
    this.onFailure,
    this.onCancel,
    this.customListener,
  }) : super(
          key: key,
          bloc: formBloc,
          child: child,
          listener: customListener ??
              (context, state) {
                if (state.status.isLoading && onSubmitting != null) {
                  onSubmitting(context, state);
                } else if (state.status.isSuccess && onSuccess != null) {
                  onSuccess(context, state);
                } else if (state.status.isFailure && onFailure != null) {
                  onFailure(context, state);
                } else if (state.status.isCancelled && onCancel != null) {
                  onCancel(context, state);
                }
              },
        );

  final FormBlocListenerCallback<SuccessResponse, FailureResponse>?
      onSubmitting;

  final FormBlocListenerCallback<SuccessResponse, FailureResponse>? onSuccess;

  final FormBlocListenerCallback<SuccessResponse, FailureResponse>? onFailure;

  final FormBlocListenerCallback<SuccessResponse, FailureResponse>? onCancel;

  final T? formBloc;

  final BlocWidgetListener<FormBlocState<SuccessResponse, FailureResponse>>?
      customListener;

  @override
  Widget? get child => super.child;
}
