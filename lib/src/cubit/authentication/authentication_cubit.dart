import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:untitled1/src/cubit/authentication/authentication_repository.dart';
import 'package:untitled1/src/helpers/storage_helper.dart';
import 'package:untitled1/src/models/api_response_model.dart';

part 'authentication_state.dart';

class AuthenticationCubit extends Cubit<AuthenticationState> {
  final AuthenticationRepository _repository = AuthenticationRepository();
  AuthenticationCubit() : super(AuthenticationInitial());

  login(String email, String password) async {
    emit(AuthenticationLoading());
    ApiResponseModel response = await _repository.login(email, password);
    if (response.status) {
      String? token =  response.token; // User token
      await  StorageHelper.writeData(StorageKeys.token.name, token!);
      emit(AuthenticationSuccess());
    } else {
      emit(AuthenticationFailure());
    }
  }
}
