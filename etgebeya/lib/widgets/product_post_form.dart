// ignore_for_file: library_private_types_in_public_api

import 'dart:io';

import 'package:etgebeya/measures/size_consts.dart';
import 'package:etgebeya/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class ProductPostForm extends StatefulWidget {
  const ProductPostForm({super.key});

  @override
  _ProductPostFormState createState() => _ProductPostFormState();
}

class _ProductPostFormState extends State<ProductPostForm> {
  final _formKey = GlobalKey<FormState>();
  final _productNameController = TextEditingController();
  final _productDescriptionController = TextEditingController();
  final _priceController = TextEditingController();
  final _quantityController = TextEditingController();
  final _brandController = TextEditingController();
  String? _selectedCategory;
  String? _selectedCity;
  final List<String> _selectedColors = [];
  final List<String> _selectedSizes = [];
  final ImagePicker _picker = ImagePicker();
  File? _imageFile; // To store the selected image

  Future<void> _pickImage() async {
    final XFile? pickedFile =
        await _picker.pickImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      setState(() {
        _imageFile = File(pickedFile.path); // Convert XFile to File
      });
    }
  }

  final List<String> _cities = [
    'Adama',
    'Addis Ababa',
    'Bahir Dar',
    'Dessie',
    'Dire Dawa',
    'Gambella',
    'Harar',
    'Jijiga',
    'Jimma',
    'Lalibela',
    'Mekelle',
    'Nekemte',
    'Semera',
    'Shashamane',
    'Tigray',
    'Wenchi',
    'Yedebub',
    'Zinjibar',
  ];

  final List<String> _categories = [
    'Car',
    'Electronics',
    'Fashion',
    'Furniture',
    'House',
    'Wanted/Needed Product/Services',
    'Others',
  ];

  final List<String> _colors = [
    'Red',
    'Blue',
    'Green',
    'Black',
    'White',
  ];

  final List<String> _sizes = [
    'S',
    'M',
    'L',
    'XL',
    'XXL',
  ];

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: EdgeInsets.all(AppSizes.smallGap),
      child: Form(
        key: _formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Address of the Seller
            DropdownButtonFormField<String>(
              value: _selectedCity,
              decoration: const InputDecoration(
                labelText: 'City',
                border: OutlineInputBorder(),
              ),
              items: _cities.map((city) {
                return DropdownMenuItem(
                  value: city,
                  child: Text(city),
                );
              }).toList(),
              onChanged: (value) {
                setState(() {
                  _selectedCity = value;
                });
              },
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please select a category';
                }
                return null;
              },
            ),
            SizedBox(height: AppSizes.smallGap),

            // Category Dropdown
            DropdownButtonFormField<String>(
              value: _selectedCategory,
              decoration: const InputDecoration(
                labelText: 'Category',
                border: OutlineInputBorder(),
              ),
              items: _categories.map((category) {
                return DropdownMenuItem(
                  value: category,
                  child: Text(category),
                );
              }).toList(),
              onChanged: (value) {
                setState(() {
                  _selectedCategory = value;
                });
              },
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please select a category';
                }
                return null;
              },
            ),
            SizedBox(height: AppSizes.smallGap),

            // Product Name
            TextFormField(
              controller: _productNameController,
              decoration: const InputDecoration(
                labelText: 'Product Name',
                border: OutlineInputBorder(),
              ),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter the product name';
                }
                return null;
              },
            ),
            const SizedBox(height: 16),

            //Product Image
            Padding(
              padding: EdgeInsets.all(AppSizes.smallGap),
              child: Column(
                children: [
                  // Image Upload Field
                  GestureDetector(
                    onTap: _pickImage, // Open gallery on tap
                    child: Container(
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.grey),
                        borderRadius: BorderRadius.circular(AppSizes.smallGap),
                      ),
                      padding: EdgeInsets.all(AppSizes.smallGap),
                      child: Row(
                        children: [
                          const Icon(Icons.image,
                              color: AppColors.secondaryIconColor),
                          SizedBox(width: AppSizes.smallGap),
                          Expanded(
                            child: Text(
                              _imageFile == null
                                  ? 'Tap to upload product image'
                                  : 'Image selected: ${_imageFile!.path.split('/').last}',
                              style: TextStyle(
                                color: _imageFile == null
                                    ? Colors.grey
                                    : Colors.black,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: AppSizes.smallGap),

                  // Display Selected Image
                  if (_imageFile != null)
                    Container(
                      height: AppSizes.largeGap * 10,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(AppSizes.largeGap),
                        image: DecorationImage(
                          image: FileImage(_imageFile!),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                ],
              ),
            ),

            // Product Description
            TextFormField(
              controller: _productDescriptionController,
              decoration: const InputDecoration(
                labelText: 'Product Description',
                border: OutlineInputBorder(),
              ),
              maxLines: 3,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter the product description';
                }
                return null;
              },
            ),
            SizedBox(height: AppSizes.smallGap),

            // Price
            TextFormField(
              controller: _priceController,
              decoration: const InputDecoration(
                labelText: 'Price',
                border: OutlineInputBorder(),
                prefixText: '\$',
              ),
              keyboardType: TextInputType.number,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter the price';
                }
                if (double.tryParse(value) == null) {
                  return 'Please enter a valid price';
                }
                return null;
              },
            ),
            SizedBox(height: AppSizes.smallGap),

            // Quantity
            TextFormField(
              controller: _quantityController,
              decoration: const InputDecoration(
                labelText: 'Quantity',
                border: OutlineInputBorder(),
              ),
              keyboardType: TextInputType.number,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter the quantity';
                }
                if (int.tryParse(value) == null) {
                  return 'Please enter a valid quantity';
                }
                return null;
              },
            ),
            SizedBox(height: AppSizes.smallGap),

            // Brand (Optional)
            TextFormField(
              controller: _brandController,
              decoration: const InputDecoration(
                labelText: 'Brand (Optional)',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: AppSizes.smallGap),

            // Color Options (Optional)
            const Text('Color Options (Optional)'),
            Wrap(
              children: _colors.map((color) {
                return FilterChip(
                  label: Text(color),
                  selected: _selectedColors.contains(color),
                  onSelected: (selected) {
                    setState(() {
                      if (selected) {
                        _selectedColors.add(color);
                      } else {
                        _selectedColors.remove(color);
                      }
                    });
                  },
                );
              }).toList(),
            ),
            SizedBox(height: AppSizes.smallGap),

            // Size Options (Optional)
            const Text('Size Options (Optional)'),
            Wrap(
              children: _sizes.map((size) {
                return FilterChip(
                  label: Text(size),
                  selected: _selectedSizes.contains(size),
                  onSelected: (selected) {
                    setState(() {
                      if (selected) {
                        _selectedSizes.add(size);
                      } else {
                        _selectedSizes.remove(size);
                      }
                    });
                  },
                );
              }).toList(),
            ),
            SizedBox(height: AppSizes.smallGap),

            // Submit Button
            Center(
              child: GestureDetector(
                onTap: () {
                  if (_formKey.currentState!.validate()) {
                    // Handle form submission
                    final productData = {
                      'name': _productNameController.text,
                      'description': _productDescriptionController.text,
                      'price': double.parse(_priceController.text),
                      'quantity': int.parse(_quantityController.text),
                      'category': _selectedCategory,
                      'brand': _brandController.text,
                      'colors': _selectedColors,
                      'sizes': _selectedSizes,
                    };
                    print('Product Data: $productData');
                    // You can now send this data to your backend or database
                  }
                },
                child: Container(
                  width: double.infinity,
                  height: AppSizes.largeGap,
                  decoration: BoxDecoration(
                    color: AppColors.primaryIconColor,
                    borderRadius: BorderRadius.circular(AppSizes.smallGap),
                    border: Border.all(color: AppColors.primaryIconColor),
                  ),
                  child: const Center(
                    child: Text(
                      'Post Product',
                      style: TextStyle(
                          fontWeight: FontWeight.bold, color: Colors.white),
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
