part of 'members_table.dart';

///
mixin _TableColumnBuilderMixin {
  final List<MemberTableNames> _tableNames = [
    MemberTableNames.memberNumber,
    MemberTableNames.memberName,
    MemberTableNames.gender,
    MemberTableNames.age,
    MemberTableNames.livingCity,
    MemberTableNames.role,
    MemberTableNames.mentor,
    MemberTableNames.membershipType,
    MemberTableNames.membershipDuration,
    MemberTableNames.membershipEndDate,
    MemberTableNames.fees,
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
          case MemberTableNames.gender:
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
