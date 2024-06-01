// ignore_for_file: public_member_api_docs, sort_constructors_first
class NavBarState {
  final int selectedIndex;
  NavBarState({
    required this.selectedIndex,
  });

  factory NavBarState.init() => NavBarState(selectedIndex: -3);

  NavBarState copyWith({
    int? selectedIndex,
  }) {
    return NavBarState(
      selectedIndex: selectedIndex ?? this.selectedIndex,
    );
  }
}
