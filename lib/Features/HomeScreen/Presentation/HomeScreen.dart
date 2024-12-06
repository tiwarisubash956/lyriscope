import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';
import 'package:lyriscope/Core/app_export.dart';
import 'package:lyriscope/Features/HomeScreen/Widgets/custom_searchbar.dart';

@RoutePage()
class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool issearched = false;
  
  @override
  Widget build(BuildContext context) {
    return PlatformScaffold(
      backgroundColor: Colors.amber[100],
      appBar: PlatformAppBar(
        backgroundColor: Colors.amber[50],
        title: const Text("Home"),
        trailingActions:  [
         IconButton(
            icon: const Icon(Icons.search),
            onPressed: () {
              showSearch(
                context: context,
                delegate: CustomSearchDelegate(items: []),
              );
            },
          ),
        ],
      ),
      body: Container(
          height: double.infinity,
          width: double.infinity,
          decoration: const BoxDecoration(
            image: DecorationImage(
              fit: BoxFit.cover,
              image: AssetImage("lib/assets/images/Book2.jpg"),
            ),
          ),
          child: GestureDetector(
            onDoubleTap: () {
              context.router.push(const BookViewerRoute());
            },
            child: GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                mainAxisSpacing: 4.0,
                crossAxisSpacing: 4.0,
                crossAxisCount: 2,   
                childAspectRatio: 0.75,
              ),
              itemCount: 100,
              itemBuilder: (BuildContext context, int index) {
                return Container(
                  color: Colors.white,
                  child: Text(index.toString()),
                );
              },
            ),
          )),
    );
  }
}
