/// The type of skeleton to show when the state is [AsyncLoading].
///
/// [single] - Shows a single skeleton
///
/// [list] - Shows a list of skeletons
enum SkeletonType {
  /// [single] - Shows a single skeleton
  ///
  /// When you want to display single item on the skeleton , use this type
  single,

  /// [list] - Shows a list of skeletons
  ///
  /// When you want to display list of items on the skeleton , use this type
  list,

  /// [text] - Shows a text skeleton
  ///
  /// When you want to display single text skeleton , use this type
  text,
}
