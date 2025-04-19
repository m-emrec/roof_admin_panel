part of 'members_table.dart';

///
mixin _TableColumnBuilderMixin {
  final List<MemberTableNames> _tableNames = [
    MemberTableNames.memberNumber,
    MemberTableNames.memberName,
    MemberTableNames.membershipEndDate,
    MemberTableNames.role,
    MemberTableNames.mentor,
    MemberTableNames.age,
    MemberTableNames.membershipDuration,
  ];

  ///
  List<GridColumn> buildColumns(BuildContext context) {
    return _tableNames.map(
      (e) {
        ColumnWidthMode columnWidthMode;
        switch (e) {
          case MemberTableNames.memberName:
            columnWidthMode = ColumnWidthMode.auto;
          case MemberTableNames.memberNumber:
            columnWidthMode = ColumnWidthMode.fitByColumnName;

          case MemberTableNames.mentor:
            columnWidthMode = ColumnWidthMode.none;

          ///
          // ignore: no_default_cases
          default:
            columnWidthMode = context.responsiveSelector(
              mobile: ColumnWidthMode.auto,
              tablet: ColumnWidthMode.auto,
              desktop: ColumnWidthMode.fill,
            );
        }

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
