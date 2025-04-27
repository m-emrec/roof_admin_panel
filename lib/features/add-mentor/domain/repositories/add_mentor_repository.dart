import 'package:core/resources/data_state.dart';
import 'package:roof_admin_panel/features/add-mentor/domain/entities/user_entity.dart';

abstract class AddMentorRepository {
  Future<DataState<List<AddMentorEntity>>> fetchMentors();
  Future<DataState<List<AddMentorEntity>>> fetchMentorsWithoutMentat();
  Future<DataState<List<AddMentorEntity>>> fetchMembersWithoutMentor();
  Future<DataState<List<AddMentorEntity>>> fetchMentats();
}
