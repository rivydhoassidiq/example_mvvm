import 'package:bloc/bloc.dart';
import 'package:example_mvm_architecture/model/user.dart';

class UserBloc extends Bloc<int, User> {
  UserBloc() : super(UninitializedUser());

  // @override
  // User get initialState => UninitializedUser();

  @override
  Stream<User> mapEventToState(int event) async* {
    try {
      User user = await User.getUserFormAPI(event);
      yield user;
    } catch (_) {}
  }
}
