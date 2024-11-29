import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';
import 'package:lyriscope/Core/app_export.dart';

@RoutePage()
class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return PlatformScaffold(
      backgroundColor: Colors.amber[100],
      appBar: PlatformAppBar(
          backgroundColor: Colors.amber[50], title: const Text("Home Page")),
      body: Container(
          height: double.infinity,
          width: double.infinity,
          decoration: const BoxDecoration(
            image: DecorationImage(
              fit: BoxFit.cover,
              image: AssetImage("lib/assets/images/Book2.jpg"),
            ),
          ),
          child: PageView(
            scrollDirection: Axis.horizontal,
            allowImplicitScrolling: true,
            children: [
              Container(
                color: Colors.red,
              ),
              Container(
                color: Colors.green,
              )
            ],
          )),
    );
  }
}
