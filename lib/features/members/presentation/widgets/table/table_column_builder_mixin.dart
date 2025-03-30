part of 'members_table.dart';

///
mixin _TableColumnBuilderMixin {
  final List<MemberTableNames> _tableNames = [
    MemberTableNames.memberNumber,
    MemberTableNames.memberName,
    MemberTableNames.membershipEndDate,
    MemberTableNames.role,
    MemberTableNames.age,
    MemberTableNames.membershipDuration,
  ];

  ///
  List<GridColumn> buildColumns() {
    return _tableNames
        .map(
          (e) => GridColumn(
            columnName: e.name,
            label: ColumnTitle(
              title: e.toLocale,
            ),
            columnWidthMode: ColumnWidthMode.auto,
          ),
        )
        .toList();
  }
}
