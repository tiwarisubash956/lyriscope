import 'dart:io';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';
import 'package:image_picker/image_picker.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lyriscope/Features/AdminHomeScreen/Presentation/bloc/admin_home_screen_bloc.dart';
import 'package:lyriscope/Features/Auth/Widgets/CustomTextFromField.dart';
import 'package:path/path.dart' as p;

class AdminHomeScreen extends StatefulWidget {
  const AdminHomeScreen({super.key});

  @override
  State<AdminHomeScreen> createState() => _AdminHomeScreenState();
}

class _AdminHomeScreenState extends State<AdminHomeScreen>
    with SingleTickerProviderStateMixin {
  final TextEditingController bookNameController = TextEditingController();
  final TextEditingController authorNameController = TextEditingController();
  final TextEditingController genreController = TextEditingController();
  final TextEditingController pdfcontroller = TextEditingController();
  final TextEditingController coverimagecontroller = TextEditingController();

  File? coverImage;
  File? pdfFile;
  bool isPickedpdf = false;
  bool isPickedCover = false;

  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
  }

  Future pickCoverImage() async {
    final ImagePicker picker = ImagePicker();
    final XFile? image = await picker.pickImage(source: ImageSource.gallery);
    if (image != null) {
      setState(() {
        coverImage = File(image.path);
        coverimagecontroller.text = p.basename(coverImage!.path);
        isPickedCover = true;
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

        pdfcontroller.text = p.basename(pdfFile!.path);
        isPickedpdf = true;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return PlatformScaffold(
      appBar: PlatformAppBar(
        title: const Text("Admin Dashboard"),
        material: (_, __) => MaterialAppBarData(
          bottom: TabBar(
            controller: _tabController,
            tabs: const [
              Tab(text: "Upload Book"),
              Tab(text: "Delete Book"),
              Tab(text: "Edit Book"),
            ],
          ),
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: [
          _uploadBookTab(context),
          _deleteBookTab(context),
          _editBookTab(context),
        ],
      ),
    );
  }

  Widget _uploadBookTab(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            "Upload Book",
            style: GoogleFonts.acme(fontSize: 20),
          ),
          const SizedBox(height: 20),
          CustomTextField(
            label: 'Book Name',
            controller: bookNameController,
            validator: (p0) {
              return null;
            },
          ),
          const SizedBox(height: 20),
          CustomTextField(
            label: 'Author Name',
            controller: authorNameController,
            validator: (p0) {
              return null;
            },
          ),
          const SizedBox(height: 20),
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
          isPickedCover
              ? CustomTextField(
                  label: 'cover Image',
                  controller: coverimagecontroller,
                  validator: (p0) {
                    return null;
                  },
                )
              : const SizedBox(height: 20),
          const SizedBox(
            height: 20,
          ),
          isPickedpdf
              ? CustomTextField(
                  label: 'pdf',
                  controller: pdfcontroller,
                  validator: (p0) {
                    return null;
                  },
                )
              : const SizedBox(height: 20),
          AnimatedSwitcher(
            duration: const Duration(milliseconds: 3),
            child: ElevatedButton(
              onPressed: pickCoverImage,
              child: const Text("Select Cover Image"),
            ),
          ),
          const SizedBox(height: 20),
          ElevatedButton(
            onPressed: pickPdf,
            child: const Text("Select PDF"),
          ),
          const SizedBox(height: 20),
          ElevatedButton(
            onPressed: () {
              if (bookNameController.text.isEmpty ||
                  authorNameController.text.isEmpty ||
                  genreController.text.isEmpty ||
                  coverImage == null ||
                  pdfFile == null) {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                      content: Text("Please fill all fields and select files")),
                );
                return;
              }

              context.read<AdminHomeScreenBloc>().add(UploadBookEvent(
                  authorName: authorNameController.text,
                  genre: genreController.text,
                  title: bookNameController.text,
                  bookpdf: pdfFile,
                  coverimage: coverImage));
            },
            child: const Text("Upload"),
          ),
        ],
      ),
    );
  }

  Widget _deleteBookTab(BuildContext context) {
    return Center(
      child: Text(
        "Delete Book Functionality Coming Soon",
        style: GoogleFonts.acme(fontSize: 20),
      ),
    );
  }

  Widget _editBookTab(BuildContext context) {
    return Center(
      child: Text(
        "Edit Book Functionality Coming Soon",
        style: GoogleFonts.acme(fontSize: 20),
      ),
    );
  }
}
