import 'package:chola_first/constants/styles.dart';
import 'package:file_picker/_internal/file_picker_web.dart';
import 'package:flutter/material.dart';
import 'package:file_picker/file_picker.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:gap/gap.dart';
import 'package:universal_platform/universal_platform.dart';

class FileUploadWidget extends StatefulWidget {
  final String label;
  final void Function(List<PlatformFile>) onFilesSelected;

  FileUploadWidget({required this.label, required this.onFilesSelected});

  @override
  _FileUploadWidgetState createState() => _FileUploadWidgetState();
}

class _FileUploadWidgetState extends State<FileUploadWidget> {
  List<PlatformFile>? _selectedFiles;

  Future<void> _pickFiles() async {
    try {
      if (UniversalPlatform.isWeb) {
        // Handle file picking for web
        FilePickerResult? result = await FilePickerWeb.platform.pickFiles(
          allowMultiple: true,
          type: FileType.custom,
          allowedExtensions: ['jpg', 'pdf', 'doc'],
        );

        if (result != null) {
          setState(() {
            _selectedFiles = result.files;
          });
          widget.onFilesSelected(result.files);
        }
      } else if (UniversalPlatform.isAndroid ||
          UniversalPlatform.isIOS ||
          UniversalPlatform.isMacOS ||
          UniversalPlatform.isWindows ||
          UniversalPlatform.isLinux) {
        // Handle file picking for other platforms
        FilePickerResult? result = await FilePicker.platform.pickFiles(
          allowMultiple: true,
        );

        if (result != null) {
          setState(() {
            _selectedFiles = result.files;
          });
          widget.onFilesSelected(result.files);
        }
      } else {
        print("File picking is not supported on this platform.");
      }
    } catch (e) {
      print("Error picking files: $e");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Text(
          widget.label,
          style: Theme.of(context).textTheme.labelMedium,
        ),
        SizedBox(
          height: MediaQuery.sizeOf(context).height / 16,
          child: DottedBorder(
            color: Colors.black26,
            child: Row(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                InkWell(
                  onTap: _pickFiles,
                  child: Container(
                    height: MediaQuery.sizeOf(context).height / 18,
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.black26),
                      borderRadius: BorderRadius.circular(4),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        const Icon(
                          Icons.file_upload_outlined,
                          color: Colors.pink,
                          size: 18,
                        ),
                        const Gap(2),
                        Text(
                          "Upload Files",
                          style:
                              Theme.of(context).textTheme.labelSmall?.copyWith(
                                    fontSize: 12,
                                    color: Colors.pink,
                                  ),
                        ),
                        const Gap(2),
                      ],
                    ),
                  ),
                ),
                const Gap(10),
                Text(
                  "Or drop files",
                  style: Theme.of(context).textTheme.titleSmall,
                ),
                const Gap(10),
              ],
            ),
          ),
        ),
        if (_selectedFiles != null)
          Container(
            height: 40,
            width: MediaQuery.of(context).size.width /4,
            child: ListView.builder(
              itemCount: _selectedFiles?.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(_selectedFiles![index].name,
                    style: Theme.of(context).textTheme.labelSmall?.copyWith(
                    fontWeight: bold,
                    fontSize: 12
                  ),),
                );
              },
            ),
          ),
      ],
    );
  }
}
