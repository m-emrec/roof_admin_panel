import 'package:core/utils/models/user_model.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:roof_admin_panel/config/localization/lang/locale_keys.g.dart';
import 'package:roof_admin_panel/features/members/presentation/enums/table_names_enum.dart';
import 'package:roof_admin_panel/product/utility/extensions/date_time_extensions.dart';
import 'package:syncfusion_flutter_datagrid/datagrid.dart';

mixin DataGridRowGenerator on DataGridSource {
  // DataGridRowGenerator({required super.users, required super.ref});
  List<DataGridRow> _dataGridRows = [];
  @override
  List<DataGridRow> get rows => _dataGridRows;

  /// Builds the data grid rows from the [users].
  ///
  /// This method is called when the data source is initialized.
  void generateUserDataGridRows(List<UserModel> users) {
    _dataGridRows = users
        .map<DataGridRow>(
          (e) => DataGridRow(
            cells: [
              DataGridCell<int>(
                columnName: MemberTableNames.memberNumber.name,
                value: int.tryParse(e.memberNumber.toString()),
              ),
              DataGridCell<List<String?>>(
                columnName: MemberTableNames.memberName.name,
                value: [e.name, e.phoneNumber],
              ),
              DataGridCell<DateTime>(
                columnName: MemberTableNames.membershipEndDate.name,
                value: e.membershipEndDate,
              ),
              DataGridCell<List<String?>>(
                columnName: MemberTableNames.role.name,
                value: e.role?.map((e) => e?.localizedText()).toList(),
              ),
              DataGridCell<int>(
                columnName: MemberTableNames.age.name,
                value: e.birthDate?.getAge(),
              ),
              DataGridCell<String>(
                columnName: MemberTableNames.membershipDuration.name,
                value:
                    "${e.membershipStartDate?.getMembershipDuration().inDays} ${LocaleKeys.common_date_day.tr()}",
              ),
            ],
          ),
        )
        .toList();
  }
}
