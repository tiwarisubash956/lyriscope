import 'dart:typed_data';
import 'package:http/http.dart' as http;
import 'package:lyriscope/Core/app_export.dart';
import 'package:lyriscope/Features/Auth/Widgets/CustomProgressIndicatore.dart';
import 'package:pdfx/pdfx.dart';


@RoutePage()

class BookViewerPage extends StatefulWidget {
  const BookViewerPage({super.key});

  @override
  State<BookViewerPage> createState() => _BookViewerPageState();
}

class _BookViewerPageState extends State<BookViewerPage> {
  late PdfController _pdfController;
  bool isLoading = true;
  final String pdfUrl =
      "https://www.cet.edu.in/noticefiles/285_OOPS%20lecture%20notes%20Complete.pdf";

  @override
  void initState() {
    super.initState();
    _initializePdfController();
  }

  Future<void> _initializePdfController() async {
    try {
      final http.Response response = await http.get(Uri.parse(pdfUrl));
      if (response.statusCode == 200) {
        Uint8List pdfBytes = response.bodyBytes;

        _pdfController = PdfController(
          document: PdfDocument.openData(pdfBytes),
          viewportFraction: 1.0, // Ensures one page fits the screen
        );

        setState(() {
          isLoading = false;
        });
      } else {
        setState(() {
          isLoading = false;
        });
        // Handle download error
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text("Failed to load PDF")),
        );
      }
    } catch (e) {
      setState(() {
        isLoading = false;
      });
      // Handle unexpected errors
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
            content: Text("An error occurred while loading the PDF")),
      );
    }
  }

  @override
  void dispose() {
    _pdfController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: isLoading
          ? const Center(child: LottieProgressIndicator())
          : PdfView(
              controller: _pdfController,
              scrollDirection: Axis.horizontal,
              // backgroundDecoration: const BoxDecoration(
              //   image: DecorationImage(image: AssetImage("lib/assets/images/book.jpg"))),
              onPageChanged: (page) {
                
                // Handle page change if needed
              },
              builders: PdfViewBuilders<DefaultBuilderOptions>(
                options: const DefaultBuilderOptions(),
                documentLoaderBuilder: (_) =>
                    const Center(child: LottieProgressIndicator()),
                pageLoaderBuilder: (_) =>
                    const Center(child: LottieProgressIndicator()),
                errorBuilder: (_, __) => const Center(
                  child: Text("Failed to load Book"),
                ),
              ),
            ),
    );
  }
}
