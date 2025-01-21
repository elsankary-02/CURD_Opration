import 'package:auto_route/auto_route.dart';
import 'package:crud_opration/home/page/home_page.dart';

part 'router.gr.dart';

final router = AppRouter();

@AutoRouterConfig()
class AppRouter extends RootStackRouter {
  @override
  List<AutoRoute> get routes =>
      [AutoRoute(page: HomeRoute.page, initial: true)];
}
