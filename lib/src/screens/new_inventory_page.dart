import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import '../models/new_inventory_item.dart';
import '../models/sample_data.dart';
import '../widgets/image_picker_widget.dart';

class NewInventoryPage extends StatefulWidget {
  final SampleDataService data;
  const NewInventoryPage({super.key, required this.data});

  @override
  State<NewInventoryPage> createState() => _NewInventoryPageState();
}

class _NewInventoryPageState extends State<NewInventoryPage> {
  final _formKey = GlobalKey<FormState>();
  File? _selectedImage;
  final _supplierIdController = TextEditingController();
  final _storageIdController = TextEditingController();
  final _itemIdController = TextEditingController();
  final _itemNameController = TextEditingController();
  final _itemCategoryController = TextEditingController();
  final _descriptionController = TextEditingController();
  
  // Track which fields have been touched for error display
  final Map<String, bool> _touchedFields = {};
  void _markTouched(String field) => _touchedFields[field] = true;
  
  Future<void> _pickImage(ImageSource source) async {
    final picker = ImagePicker();
    try {
      final image = await picker.pickImage(source: source);
      if (image != null) {
        setState(() {
          _selectedImage = File(image.path);
        });
      }
    } catch (e) {
      // Handle error or show message
    }
  }

  void _handleSave() {
    // Mark all fields as touched when trying to save
    ['supplierId', 'storageId', 'itemId', 'itemName', 'itemCategory']
        .forEach(_markTouched);

    if (_formKey.currentState?.validate() ?? false) {
      final item = NewInventoryItem(
        itemId: _itemIdController.text.trim(),
        itemName: _itemNameController.text.trim(),
        itemCategory: _itemCategoryController.text.trim(),
        description: _descriptionController.text.trim(),
        supplierId: _supplierIdController.text.trim(),
        storageId: _storageIdController.text.trim(),
        image: _selectedImage,
      );

      if (item.hasRequiredFields) {
        // TODO: Add to data service
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Item successfully inserted!'),
            backgroundColor: Colors.green,
          ),
        );
        Navigator.pop(context);
      }
    }
  }

  String? _validateField(String? value, String fieldName) {
    if (_touchedFields[fieldName] != true) return null;
    if (value?.trim().isEmpty ?? true) {
      return 'This field is required';
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('New Inventory')),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Image picker
                Center(
                  child: ImagePickerWidget(
                    selectedImage: _selectedImage,
                    onTakePhoto: () => _pickImage(ImageSource.camera),
                    onChooseImage: () => _pickImage(ImageSource.gallery),
                  ),
                ),
                const SizedBox(height: 24),

                // Form fields
                TextFormField(
                  controller: _supplierIdController,
                  decoration: InputDecoration(
                    labelText: 'Supplier ID',
                    errorText: _validateField(_supplierIdController.text, 'supplierId'),
                  ),
                  onChanged: (_) => setState(() => _markTouched('supplierId')),
                ),
                const SizedBox(height: 16),

                TextFormField(
                  controller: _storageIdController,
                  decoration: InputDecoration(
                    labelText: 'Storage ID',
                    errorText: _validateField(_storageIdController.text, 'storageId'),
                  ),
                  onChanged: (_) => setState(() => _markTouched('storageId')),
                ),
                const SizedBox(height: 16),

                TextFormField(
                  controller: _itemIdController,
                  decoration: InputDecoration(
                    labelText: 'Item ID',
                    errorText: _validateField(_itemIdController.text, 'itemId'),
                  ),
                  onChanged: (_) => setState(() => _markTouched('itemId')),
                ),
                const SizedBox(height: 16),

                TextFormField(
                  controller: _itemNameController,
                  decoration: InputDecoration(
                    labelText: 'Item Name',
                    errorText: _validateField(_itemNameController.text, 'itemName'),
                  ),
                  onChanged: (_) => setState(() => _markTouched('itemName')),
                ),
                const SizedBox(height: 16),

                TextFormField(
                  controller: _itemCategoryController,
                  decoration: InputDecoration(
                    labelText: 'Item Category',
                    errorText: _validateField(_itemCategoryController.text, 'itemCategory'),
                  ),
                  onChanged: (_) => setState(() => _markTouched('itemCategory')),
                ),
                const SizedBox(height: 16),

                TextFormField(
                  controller: _descriptionController,
                  decoration: const InputDecoration(labelText: 'Description'),
                  maxLines: 3,
                ),
                const SizedBox(height: 24),

                // Action buttons
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    TextButton(
                      onPressed: () => Navigator.pop(context),
                      child: const Text('Cancel'),
                    ),
                    const SizedBox(width: 16),
                    ElevatedButton(
                      onPressed: _handleSave,
                      child: const Text('Save'),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _supplierIdController.dispose();
    _storageIdController.dispose();
    _itemIdController.dispose();
    _itemNameController.dispose();
    _itemCategoryController.dispose();
    _descriptionController.dispose();
    super.dispose();
  }
}