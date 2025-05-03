import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'membersip_rates_event.dart';
part 'membersip_rates_state.dart';

class MembersipRatesBloc extends Bloc<MembersipRatesEvent, MembersipRatesState> {
  MembersipRatesBloc() : super(MembersipRatesInitial()) {
    on<MembersipRatesEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
