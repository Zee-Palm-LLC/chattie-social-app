import 'package:rive/rive.dart';

class Menu {
  final String title;
  final RiveModel rive;

  Menu({required this.title, required this.rive});
}

List<Menu> bottomNavBarMenu = [
  Menu(
    title: 'Home',
    rive: RiveModel(
      src: 'assets/rive/icons.riv',
      artboard: 'HOME',
      stateMachineName: 'HOME_interactivity',
    ),
  ),
  Menu(
    title: 'History',
    rive: RiveModel(
      src: 'assets/rive/icons.riv',
      artboard: 'TIMER',
      stateMachineName: 'TIMER_Interactivity',
    ),
  ),
  Menu(
    title: 'Search',
    rive: RiveModel(
      src: 'assets/rive/icons.riv',
      artboard: 'SEARCH',
      stateMachineName: 'SEARCH_Interactivity',
    ),
  ),
  Menu(
    title: 'Notifications',
    rive: RiveModel(
      src: 'assets/rive/icons.riv',
      artboard: 'BELL',
      stateMachineName: 'BELL_Interactivity',
    ),
  ),
  Menu(
    title: 'Settings',
    rive: RiveModel(
      src: 'assets/rive/icons.riv',
      artboard: 'SETTINGS',
      stateMachineName: 'SETTINGS_Interactivity',
    ),
  ),
];

class RiveModel {
  final String src;
  final String artboard;
  final String stateMachineName;
  late SMIBool? status;

  // ignore: avoid_setters_without_getters
  set setStatus(SMIBool state) {
    status = state;
  }

  RiveModel({
    required this.src,
    required this.artboard,
    required this.stateMachineName,
    this.status,
  });
}
