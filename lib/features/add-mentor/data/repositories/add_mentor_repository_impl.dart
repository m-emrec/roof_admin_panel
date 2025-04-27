import 'package:core/core.dart';
import 'package:core/resources/data_state.dart';
import 'package:roof_admin_panel/features/add-mentor/data/datasources/add_mentor_service.dart';
import 'package:roof_admin_panel/features/add-mentor/data/models/add_mentor_model.dart';
import 'package:roof_admin_panel/features/add-mentor/domain/entities/user_entity.dart';
import 'package:roof_admin_panel/features/add-mentor/domain/repositories/add_mentor_repository.dart';

class AddMentorRepositoryImpl implements AddMentorRepository {
  AddMentorRepositoryImpl(this._service);
  AddMentorService _service;

  @override
  Future<DataState<List<AddMentorEntity>>> fetchMembersWithoutMentor() async {
    return DataState.handleDataState(
      () async {
        final membersWithoutMentor =
            await _service.fetchMembersWithoutMentors();

        return membersWithoutMentor.map(AddMentorModel.fromJson).toList();
      },
    );
  }

  @override
  Future<DataState<List<AddMentorEntity>>> fetchMentats() {
    return DataState.handleDataState(
      () async {
        final mentats = await _service.fetchMentats();
        return mentats.map(AddMentorModel.fromJson).toList();
      },
    );
  }

  @override
  Future<DataState<List<AddMentorEntity>>> fetchMentors() {
    return DataState.handleDataState(
      () async {
        final mentors = await _service.fetchMentors();
        return mentors.map(AddMentorModel.fromJson).toList();
      },
    );
  }

  @override
  Future<DataState<List<AddMentorEntity>>> fetchMentorsWithoutMentat() {
    return DataState.handleDataState(
      () async {
        final mentorsWithoutMentat = await _service.fetchMentorsWithoutMentat();
        return mentorsWithoutMentat.map(AddMentorModel.fromJson).toList();
      },
    );
  }
}
