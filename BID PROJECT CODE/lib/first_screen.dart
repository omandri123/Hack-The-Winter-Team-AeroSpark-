import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:file_picker/file_picker.dart';
import 'package:http/http.dart' as http;
import 'package:image_picker_windows/image_picker_windows.dart';
import 'package:image_picker_platform_interface/image_picker_platform_interface.dart';
import 'dart:io';
import 'package:qr_flutter/qr_flutter.dart';

class PersonalDetailsForm extends StatefulWidget {
  const PersonalDetailsForm({super.key});

  @override
  State<PersonalDetailsForm> createState() => _PersonalDetailsFormState();
}

class _PersonalDetailsFormState extends State<PersonalDetailsForm> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _aadhaarController = TextEditingController();
  final TextEditingController _panController = TextEditingController();
  final TextEditingController _dobController = TextEditingController();
  final TextEditingController _mobileController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  PlatformFile? aadhaarFile;
  PlatformFile? panFile;
  PlatformFile? dobFile;
  PlatformFile? addressFile;
  PlatformFile? passportFile;

  Future<void> _pickFile(String docType) async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: ['pdf'],
    );

    if (result != null) {
      setState(() {
        switch (docType) {
          case "aadhaar":
            aadhaarFile = result.files.first;
            break;
          case "pan":
            panFile = result.files.first;
            break;
          case "dob":
            dobFile = result.files.first;
            break;
          case "address":
            addressFile = result.files.first;
            break;
          case "passport":
            passportFile = result.files.first;
            break;
        }
      });
    }
  }

  // Submit details to Firebase (only text data)
  Future<void> _submitToBlockchain() async {
    final url = Uri.parse('http://127.0.0.1:5000/add_block');

    final dataBlock = {
      "fullName": _nameController.text.trim(),
      "aadhaarNumber": _aadhaarController.text.trim(),
      "panNumber": _panController.text.trim(),
      "dob": _dobController.text.trim(),
      "mobile": _mobileController.text.trim(),
      "email": _emailController.text.trim(),
    };

    try {
      final response = await http.post(
        url,
        headers: {"Content-Type": "application/json"},
        body: jsonEncode(dataBlock),
      );

      if (response.statusCode == 200) {
        final jsonData = jsonDecode(response.body);
        final bid = jsonData["BID"];

        // ✅ Show success SnackBar
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text("✅ Block Added Successfully!"),
            backgroundColor: Colors.green,
            duration: const Duration(seconds: 3),
          ),
        );

        // 🪩 Show Dialog with BID
        showDialog(
          context: context,
          builder: (context) => AlertDialog(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15),
            ),
            title: const Text("✅ Blockchain ID Generated"),
            content: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  "Your BID has been generated successfully!",
                  style: const TextStyle(fontSize: 16),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 15),
                SelectableText(
                  "BID: $bid",
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 14,
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 20),
                SizedBox(
                  width: 150,
                  height: 150,
                  child: QrImageView(
                    data: bid,
                    version: QrVersions.auto,
                    size: 150.0,
                  ),
                ),
              ],
            ),
            actions: [
              TextButton(
                onPressed: () => Navigator.pop(context),
                child: const Text("Close"),
              ),
            ],
          ),
        );

        print("BID: $bid"); // For debugging
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text("❌ Server Error: ${response.statusCode}"),
            backgroundColor: Colors.redAccent,
          ),
        );
      }
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text("⚠️ Network Error: $e"),
          backgroundColor: Colors.redAccent,
        ),
      );
      print("Error: $e");
    }
  }

  File? _image;

  void takepicture() async {
    final image_picker = ImagePickerWindows();
    final picked_image = await image_picker.pickImage(
      source: ImageSource.gallery,
    );
    if (picked_image != null) {
      setState(() {
        _image = File(picked_image.path);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          "(BID) Block-Chain Identification",
          style: TextStyle(
            color: Color.fromARGB(255, 3, 20, 121),
            fontWeight: FontWeight.bold,
            fontSize: 40,
          ),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset("lib/images/bg1.PNG", fit: BoxFit.contain),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    "lib/images/bg6.PNG",
                    fit: BoxFit.cover,
                    scale: 2,
                  ),
                  SizedBox(width: 30),
                  Image.asset(
                    "lib/images/bg7.PNG",
                    fit: BoxFit.cover,
                    scale: 2,
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    "BID Registration",
                    style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              const Text(
                "Enter Personal Details",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 20),

              _buildTextField(_nameController, "* Full Name", Icons.person),
              _buildTextField(
                _aadhaarController,
                "* Aadhaar Number",
                Icons.credit_card,
                keyboardType: TextInputType.number,
              ),
              _buildTextField(
                _panController,
                "* PAN Number",
                Icons.badge,
                textCapitalization: TextCapitalization.characters,
              ),
              _buildTextField(
                _dobController,
                "* Date of Birth (DD/MM/YYYY)",
                Icons.calendar_today,
                keyboardType: TextInputType.datetime,
              ),
              _buildTextField(
                _mobileController,
                "* Mobile Number",
                Icons.phone,
                keyboardType: TextInputType.phone,
              ),
              _buildTextField(
                _emailController,
                "* Email ID",
                Icons.email,
                keyboardType: TextInputType.emailAddress,
              ),

              const SizedBox(height: 25),
              const Divider(thickness: 1),
              const SizedBox(height: 10),
              const Text(
                "Upload Verification Documents (PDF only)",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 15),

              _buildFileUploadTile(
                title: "Upload Aadhaar Card",
                file: aadhaarFile,
                onTap: () => _pickFile("aadhaar"),
              ),

              // Data //
              // Container(
              //   margin: EdgeInsets.all(10),
              //   height: 100,
              //   width: double.infinity,
              //   alignment: Alignment.center,
              //   decoration: BoxDecoration(
              //     borderRadius: BorderRadius.circular(10),
              //     border: Border.all(
              //       width: 1,
              //       color: const Color.fromARGB(123, 255, 255, 255),
              //     ),
              //   ),
              //   child: (_image == null)
              //       ? TextButton.icon(
              //           onPressed: takepicture,
              //           label: Text("Picture"),
              //           icon: Icon(Icons.camera),
              //         )
              //       : Image.file(_image!, height: 600, fit: BoxFit.cover),
              // ),
              // Data //
              _buildFileUploadTile(
                title: "Upload PAN Card",
                file: panFile,
                onTap: () => _pickFile("pan"),
              ),
              _buildFileUploadTile(
                title: "Upload DOB Certificate",
                file: dobFile,
                onTap: () => _pickFile("dob"),
              ),
              _buildFileUploadTile(
                title: "Upload Electricity/Utility Bill (Address Proof)",
                file: addressFile,
                onTap: () => _pickFile("address"),
              ),
              _buildFileUploadTile(
                title: "Upload Passport/Voter ID (Optional)",
                file: passportFile,
                onTap: () => _pickFile("passport"),
              ),

              const SizedBox(height: 25),

              SizedBox(
                width: double.infinity,
                child: ElevatedButton.icon(
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(vertical: 15),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  onPressed: () {
                    //if (_formKey.currentState!.validate()) {
                    //if (aadhaarFile == null ||
                    //  panFile == null ||
                    //dobFile == null ||
                    //addressFile == null) {
                    //ScaffoldMessenger.of(context).showSnackBar(
                    //const SnackBar(
                    //content: Text(
                    //"Please upload all required documents.",
                    //),
                    //),
                    //);
                    //return;
                    //}

                    // Submit the data block
                    _submitToBlockchain();
                    //}
                  },
                  icon: const Icon(Icons.cloud_upload_rounded),
                  label: const Text(
                    "Submit to Blockchain",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                ),
              ),
              SizedBox(height: 100),
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Image.asset("lib/images/bg2.PNG", fit: BoxFit.cover),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTextField(
    TextEditingController controller,
    String label,
    IconData icon, {
    TextInputType keyboardType = TextInputType.text,
    TextCapitalization textCapitalization = TextCapitalization.none,
  }) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16),
      child: TextFormField(
        controller: controller,
        keyboardType: keyboardType,
        textCapitalization: textCapitalization,
        decoration: InputDecoration(
          labelText: label,
          prefixIcon: Icon(icon),
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
        ),
        validator: (v) => v!.isEmpty ? "Please enter $label" : null,
      ),
    );
  }

  Widget _buildFileUploadTile({
    required String title,
    required PlatformFile? file,
    required VoidCallback onTap,
  }) {
    return Card(
      elevation: 2,
      margin: const EdgeInsets.only(bottom: 15),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: ListTile(
        leading: const Icon(Icons.picture_as_pdf, color: Colors.redAccent),
        title: Text(title),
        subtitle: file != null
            ? Text("Selected: ${file.name}")
            : const Text("No file selected"),
        trailing: ElevatedButton(onPressed: onTap, child: const Text("Upload")),
      ),
    );
  }
}
