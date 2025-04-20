import 'package:core/resources/data_state.dart';
import 'package:core/utils/models/user_model.dart';

/// [AddMemberRepository] is an abstract class that defines the methods that must be implemented by the concrete implementation of this class.
abstract class AddMemberRepository {
  /// [addNewMember] is a method that adds a new member to the database.
  Future<DataState<UserModel>> addNewMember(UserModel userModel);

  /// Fetches all the members without a mentor.
  Future<DataState<List<UserModel>>> fetchMembersWithoutMentor();

  /// Fetches all mentors without a mentat.
  Future<DataState<List<UserModel>>> fetchMentorsWithoutMentat();

  /// Fetches all the mentors.
  Future<DataState<List<UserModel>>> fetchMentors();

  /// Fetches all the mentats.
  Future<DataState<List<UserModel>>> fetchMentats();
}
