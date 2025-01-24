import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';
import 'package:image_picker/image_picker.dart';

class AddButtonPage extends StatefulWidget {
  const AddButtonPage({super.key});

  @override
  _AddButtonPageState createState() => _AddButtonPageState();
}

class _AddButtonPageState extends State<AddButtonPage> {
  final TextEditingController _nameController = TextEditingController();
  File? _selectedImage;
  Color? _selectedColor;

  final ImagePicker _picker = ImagePicker();

  Future<void> _pickImage() async {
    final pickedFile = await _picker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      setState(() {
        _selectedImage = File(pickedFile.path);
      });
    }
  }

  
  Future<void> _pickColor() async {
    final Color? pickedColor = await showDialog<Color>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Select a color'),
          content: SingleChildScrollView(
            child: BlockPicker(
              pickerColor: _selectedColor ?? Colors.purple,
              onColorChanged: (Color color) {
                Navigator.of(context).pop(color);
              },
            ),
          ),
        );
      },
    );
    if (pickedColor != null) {
      setState(() {
        _selectedColor = pickedColor;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add List'),
        backgroundColor: Colors.black,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // إدخال الاسم
            TextField(
              controller: _nameController,
              decoration: InputDecoration(
                labelText: 'List Name',
                labelStyle: const TextStyle(color: Colors.grey),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),
            const SizedBox(height: 20),

           
            ElevatedButton(
              onPressed: _pickImage,
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.purple.withOpacity(0.2),
                elevation: 0,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              child: const Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(Icons.photo, color: Colors.purple),
                  SizedBox(width: 8),
                  Text(
                    'Select Photo',
                    style: TextStyle(color: Colors.purple),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),

            
            ElevatedButton(
              onPressed: _pickColor,
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.purple.withOpacity(0.2),
                elevation: 0,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              child: const Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(Icons.color_lens, color: Colors.purple),
                  SizedBox(width: 8),
                  Text(
                    'Select Color',
                    style: TextStyle(color: Colors.purple),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 40),

            
            Center(
              child: ElevatedButton(
                onPressed: () {
                  if (_nameController.text.isNotEmpty &&
                      _selectedImage != null &&
                      _selectedColor != null) {
                    Navigator.pop(context, {
                      'name': _nameController.text,
                      'imagePath': _selectedImage!.path,
                      'color': _selectedColor,
                    });
                  }
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.purple,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                child: const Padding(
                  padding: EdgeInsets.symmetric(
                      vertical: 12.0, horizontal: 32.0),
                  child: Text(
                    'Save',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
