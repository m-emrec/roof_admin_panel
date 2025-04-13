part of 'members_table.dart';

///
mixin _TableColumnBuilderMixin {
  final List<MemberTableNames> _tableNames = [
    MemberTableNames.memberNumber,
    MemberTableNames.memberName,
    MemberTableNames.membershipEndDate,
    MemberTableNames.role,
    MemberTableNames.x,
    MemberTableNames.age,
    MemberTableNames.membershipDuration,
  ];

  ///
  List<GridColumn> buildColumns() {
    return _tableNames.map(
      (e) {
        final columnWidthMode = e == MemberTableNames.x
            ? ColumnWidthMode.none
            : ColumnWidthMode.auto;

        return GridColumn(
          columnName: e.name,
          label: ColumnTitle(
            title: e.toLocale,
          ),
          columnWidthMode: columnWidthMode,
        );
      },
    ).toList();
  }
}
