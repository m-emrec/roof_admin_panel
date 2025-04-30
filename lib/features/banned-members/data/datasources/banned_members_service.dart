import 'package:core/resources/firebase%20utilities/firebase_cloud_functions_utils.dart';
import 'package:core/resources/firebase%20utilities/firebase_utils.dart';
import 'package:core/resources/firebase%20utilities/firestore_utils.dart';
import 'package:core/utils/constants/firebase/collection_enums.dart';
import 'package:roof_admin_panel/product/utility/constants/enums/firebase/cloud_function_names.dart';

class BannedMembersService extends FirebaseUtils
    with FirestoreUtils, FirebaseCloudFunctionsUtils {
  Future<List<Map<String, dynamic>>> fetchBannedMembers() async {
    final collection = await getCollectionRef(CollectionEnum.bannedUsers);
    final snapshot = await collection.get();
    final bannedMembers = snapshot.docs.map((doc) => doc.data()).toList();
    return bannedMembers;
  }

  Future<void> unbanMember(String memberId) async {
    final res = await functions
        .httpsCallable(CloudFunctionNames.unBanMember.name)
        .call<Map<String, dynamic>>({
      'uid': memberId,
    });

    if (!getResponseSuccess(res)) {
      throw Exception(getErrorCode(res));
    }
  }
}
