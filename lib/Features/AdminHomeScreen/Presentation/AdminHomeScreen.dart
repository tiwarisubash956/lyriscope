import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';
import 'package:image_picker/image_picker.dart';
import 'package:lyriscope/Core/app_export.dart';

@RoutePage()
class AdminHomeScreen extends StatefulWidget {
  const AdminHomeScreen({super.key});

  @override
  State<AdminHomeScreen> createState() => _AdminHomeScreenState();
}

class _AdminHomeScreenState extends State<AdminHomeScreen> {
  final TextEditingController bookNameController = TextEditingController();
  final TextEditingController authorNameController = TextEditingController();
  final TextEditingController genreController = TextEditingController();
  final TextEditingController contentPdfController = TextEditingController();
  File? coverimage;
  File? pdfFile;

  Future pickCoverImage() async {
    final ImagePicker picker = ImagePicker();
    final XFile? image = await picker.pickImage(source: ImageSource.gallery);
    if (image != null) {
      setState(() {
        pdfFile = File(image.path);
      });
    }
  }

  Future pickPdf() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: ['pdf'],
    );
    if (result != null) {
      setState(() {
        pdfFile = File(result.files.single.path!);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return PlatformScaffold(
      appBar: PlatformAppBar(
        title: const Text("Admin DashBoard"),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Center(
                  child: Text(
                "Upload Book",
                style: GoogleFonts.acme(fontSize: 20),
              )),
              CustomTextField(
                label: 'Book Name',
                controller: bookNameController,
                validator: (p0) {
                  return null;
                },
              ),
              const SizedBox(
                height: 20,
              ),
              CustomTextField(
                label: 'Author Name',
                controller: authorNameController,
                validator: (p0) {
                  return null;
                },
              ),
              const SizedBox(
                height: 20,
              ),
              CustomTextField(
                label: 'Genre',
                controller: genreController,
                validator: (p0) {
                  return null;
                },
              ),
              const SizedBox(
                height: 20,
              ),
              ElevatedButton(
                  onPressed: () async {
                    XFile? coverimage = await pickCoverImage();
                    if (coverimage == null) {
                      return;
                    }
                  },
                  child: const Text("Select Cover Image")),
              const SizedBox(
                height: 20,
              ),
              ElevatedButton(
                  onPressed: () async {
                    XFile? pdf = await pickPdf();
                    if (pdf == null) {
                      return;
                    }
                  },
                  child: const Text("Select Pdf ")),
              const SizedBox(
                height: 20,
              ),
              ElevatedButton(onPressed: () {}, child: const Text("Upload"))
            ],
          ),
        ),
      ),
    );
  }
}
