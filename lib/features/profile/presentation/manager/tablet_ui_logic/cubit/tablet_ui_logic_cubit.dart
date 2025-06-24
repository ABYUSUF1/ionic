import 'package:flutter_bloc/flutter_bloc.dart';

enum ProfileButtonEnum {
  editProfile,
  myAddresses,
  notifications,
  accountPrivacy,
  myFavorites,
}

class TabletUiLogic extends Cubit<ProfileButtonEnum?> {
  TabletUiLogic() : super(null);

  void select(ProfileButtonEnum section) => emit(section);

  void reset() => emit(null);
}
