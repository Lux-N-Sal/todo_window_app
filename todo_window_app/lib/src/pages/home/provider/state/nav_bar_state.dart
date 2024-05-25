// ignore_for_file: public_member_api_docs, sort_constructors_first
class NavBarState {
  final bool isExpanded;
  final int selectedIndex;
  NavBarState({
    required this.isExpanded,
    required this.selectedIndex,
  });

  factory NavBarState.init() =>
      NavBarState(isExpanded: false, selectedIndex: 0);

  NavBarState copyWith({
    bool? isExpanded,
    int? selectedIndex,
  }) {
    return NavBarState(
      isExpanded: isExpanded ?? this.isExpanded,
      selectedIndex: selectedIndex ?? this.selectedIndex,
    );
  }
}
