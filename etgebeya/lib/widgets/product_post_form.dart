import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';

import '../measures/size_consts.dart';
import '../utils/colors.dart';

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
  File? _imageFile;

  // Conditional fields
  String? _selectedCarBrand;
  String? _selectedCarBodyType;
  String? _selectedElectronicsType;
  String? _selectedFashionGender;
  String? _selectedFurnitureType;
  String? _selectedHouseType;

  // Options
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

  final List<String> _carBrands = [
    'Toyota',
    'Hyundai',
    'Honda',
    'BMW',
    'Tesla'
  ];
  final List<String> _carBodyTypes = [
    'SUV',
    'Sedan',
    'Compact',
    'Hatchback',
    'Truck'
  ];
  final List<String> _electronicsTypes = [
    'Phone',
    'Laptop',
    'Tablet',
    'TV',
    'Other'
  ];
  final List<String> _fashionGenders = ['Male', 'Female', 'Kids', 'Unisex'];
  final List<String> _furnitureTypes = [
    'Used',
    'Brand New',
    'Kitchen',
    'Salon',
    'Bedroom',
    'Office'
  ];
  final List<String> _houseTypes = [
    'Leased',
    'Rented',
    'Buying',
    'Warehouse',
    'Villa',
    'Bare Land'
  ];
  final List<String> _colors = ['Red', 'Blue', 'Green', 'Black', 'White'];
  final List<String> _sizes = ['S', 'M', 'L', 'XL', 'XXL'];

  Future<void> _pickImage() async {
    final XFile? pickedFile =
        await _picker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      setState(() {
        _imageFile = File(pickedFile.path);
      });
    }
  }

  void _resetConditionalFields() {
    setState(() {
      _selectedCarBrand = null;
      _selectedCarBodyType = null;
      _selectedElectronicsType = null;
      _selectedFashionGender = null;
      _selectedFurnitureType = null;
      _selectedHouseType = null;
    });
  }

  Widget _buildConditionalFields() {
    switch (_selectedCategory) {
      case 'Car':
        return Column(
          children: [
            DropdownButtonFormField<String>(
              value: _selectedCarBrand,
              decoration: const InputDecoration(
                labelText: 'Car Brand',
                border: OutlineInputBorder(),
              ),
              items: _carBrands.map((brand) {
                return DropdownMenuItem(
                  value: brand,
                  child: Text(brand),
                );
              }).toList(),
              onChanged: (value) {
                setState(() {
                  _selectedCarBrand = value;
                  _selectedCarBodyType =
                      null; // Reset body type when brand changes
                });
              },
              validator: (value) =>
                  value == null ? 'Please select a car brand' : null,
            ),
            if (_selectedCarBrand != null) ...[
              const SizedBox(height: 16),
              DropdownButtonFormField<String>(
                value: _selectedCarBodyType,
                decoration: const InputDecoration(
                  labelText: 'Body Type',
                  border: OutlineInputBorder(),
                ),
                items: _carBodyTypes.map((type) {
                  return DropdownMenuItem(
                    value: type,
                    child: Text(type),
                  );
                }).toList(),
                onChanged: (value) {
                  setState(() {
                    _selectedCarBodyType = value;
                  });
                },
                validator: (value) =>
                    value == null ? 'Please select a body type' : null,
              ),
            ],
          ],
        );

      case 'Electronics':
        return DropdownButtonFormField<String>(
          value: _selectedElectronicsType,
          decoration: const InputDecoration(
            labelText: 'Electronics Type',
            border: OutlineInputBorder(),
          ),
          items: _electronicsTypes.map((type) {
            return DropdownMenuItem(
              value: type,
              child: Text(type),
            );
          }).toList(),
          onChanged: (value) {
            setState(() {
              _selectedElectronicsType = value;
            });
          },
          validator: (value) =>
              value == null ? 'Please select electronics type' : null,
        );

      case 'Fashion':
        return Column(
          children: [
            DropdownButtonFormField<String>(
              value: _selectedFashionGender,
              decoration: const InputDecoration(
                labelText: 'Gender',
                border: OutlineInputBorder(),
              ),
              items: _fashionGenders.map((gender) {
                return DropdownMenuItem(
                  value: gender,
                  child: Text(gender),
                );
              }).toList(),
              onChanged: (value) {
                setState(() {
                  _selectedFashionGender = value;
                });
              },
              validator: (value) =>
                  value == null ? 'Please select gender' : null,
            ),
            if (_selectedFashionGender != null) ...[
              const SizedBox(height: 16),
              const Text('Size Options (Required for Fashion)'),
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
            ],
          ],
        );

      case 'Furniture':
        return DropdownButtonFormField<String>(
          value: _selectedFurnitureType,
          decoration: const InputDecoration(
            labelText: 'Furniture Type',
            border: OutlineInputBorder(),
          ),
          items: _furnitureTypes.map((type) {
            return DropdownMenuItem(
              value: type,
              child: Text(type),
            );
          }).toList(),
          onChanged: (value) {
            setState(() {
              _selectedFurnitureType = value;
            });
          },
          validator: (value) =>
              value == null ? 'Please select furniture type' : null,
        );

      case 'House':
        return DropdownButtonFormField<String>(
          value: _selectedHouseType,
          decoration: const InputDecoration(
            labelText: 'House Type',
            border: OutlineInputBorder(),
          ),
          items: _houseTypes.map((type) {
            return DropdownMenuItem(
              value: type,
              child: Text(type),
            );
          }).toList(),
          onChanged: (value) {
            setState(() {
              _selectedHouseType = value;
            });
          },
          validator: (value) =>
              value == null ? 'Please select house type' : null,
        );

      case 'Wanted/Needed Product/Services':
        return TextFormField(
          controller: _productDescriptionController,
          decoration: const InputDecoration(
            labelText: 'Detailed Description',
            border: OutlineInputBorder(),
            hintText: 'Describe what you are looking for in detail',
          ),
          maxLines: 4,
          validator: (value) => value == null || value.isEmpty
              ? 'Please describe what you need'
              : null,
        );

      case 'Others':
        return TextFormField(
          controller: _productDescriptionController,
          decoration: const InputDecoration(
            labelText: 'Additional Details',
            border: OutlineInputBorder(),
            hintText: 'Provide any additional details about your product',
          ),
          maxLines: 3,
        );

      default:
        return Container();
    }
  }

  void _submitForm() {
    if (_formKey.currentState!.validate()) {
      // Prepare the data structure
      final productData = {
        'name': _productNameController.text,
        'description': _productDescriptionController.text,
        'price': double.parse(_priceController.text),
        'quantity': int.parse(_quantityController.text),
        'category': _selectedCategory,
        'city': _selectedCity,
        'brand': _brandController.text,
        'colors': _selectedColors,
        'sizes': _selectedSizes,
        'imagePath': _imageFile?.path,

        // Conditional data
        'details': {
          if (_selectedCategory == 'Car') ...{
            'brand': _selectedCarBrand,
            'bodyType': _selectedCarBodyType,
          },
          if (_selectedCategory == 'Electronics') ...{
            'type': _selectedElectronicsType,
          },
          if (_selectedCategory == 'Fashion') ...{
            'gender': _selectedFashionGender,
            'sizes': _selectedSizes,
          },
          if (_selectedCategory == 'Furniture') ...{
            'type': _selectedFurnitureType,
          },
          if (_selectedCategory == 'House') ...{
            'type': _selectedHouseType,
          },
        },
      };

      // Show the collected data (in a real app, you'd send this to your backend)
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: const Text('Product Submitted'),
          content: SingleChildScrollView(
            child: Text(_formatProductData(productData)),
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text('OK'),
            ),
          ],
        ),
      );
    }
  }

  String _formatProductData(Map<String, dynamic> data) {
    String result = 'Product Name: ${data['name']}\n';
    result += 'Category: ${data['category']}\n';
    result += 'Price: \$${data['price']}\n';
    result += 'Quantity: ${data['quantity']}\n';
    result += 'City: ${data['city']}\n';

    if (data['details'] != null) {
      result += '\nDetails:\n';
      data['details'].forEach((key, value) {
        if (value != null) {
          if (value is List) {
            result += '- $key: ${value.join(', ')}\n';
          } else {
            result += '- $key: $value\n';
          }
        }
      });
    }

    return result;
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: Form(
        key: _formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // City Dropdown
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
              validator: (value) =>
                  value == null ? 'Please select a city' : null,
            ),
            const SizedBox(height: 16),

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
                  _resetConditionalFields();
                });
              },
              validator: (value) =>
                  value == null ? 'Please select a category' : null,
            ),
            const SizedBox(height: 16),

            // Product Name
            TextFormField(
              controller: _productNameController,
              decoration: const InputDecoration(
                labelText: 'Product Name',
                border: OutlineInputBorder(),
              ),
              validator: (value) => value == null || value.isEmpty
                  ? 'Please enter the product name'
                  : null,
            ),
            const SizedBox(height: 16),

            // Product Image
            GestureDetector(
              onTap: _pickImage,
              child: Container(
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey),
                  borderRadius: BorderRadius.circular(8),
                ),
                padding: const EdgeInsets.all(12),
                child: Row(
                  children: [
                    const Icon(Icons.image, color: Colors.grey),
                    const SizedBox(width: 8),
                    Expanded(
                      child: Text(
                        _imageFile == null
                            ? 'Tap to upload product image'
                            : 'Image selected: ${_imageFile!.path.split('/').last}',
                        style: TextStyle(
                          color:
                              _imageFile == null ? Colors.grey : Colors.black,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            if (_imageFile != null) ...[
              const SizedBox(height: 8),
              Container(
                height: 150,
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  image: DecorationImage(
                    image: FileImage(_imageFile!),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ],
            const SizedBox(height: 16),

            // Conditional Fields
            if (_selectedCategory != null) ...[
              _buildConditionalFields(),
              const SizedBox(height: 16),
            ],

            // Product Description
            TextFormField(
              controller: _productDescriptionController,
              decoration: const InputDecoration(
                labelText: 'Product Description',
                border: OutlineInputBorder(),
              ),
              maxLines: 3,
              validator: (value) => value == null || value.isEmpty
                  ? 'Please enter the product description'
                  : null,
            ),
            const SizedBox(height: 16),

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
            const SizedBox(height: 16),

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
            const SizedBox(height: 16),

            // Brand (Optional for most categories, required for some)
            TextFormField(
              controller: _brandController,
              decoration: const InputDecoration(
                labelText: 'Brand (Optional)',
                border: OutlineInputBorder(),
              ),
              validator: (value) {
                // Make brand required for electronics
                if (_selectedCategory == 'Electronics' &&
                    (value == null || value.isEmpty)) {
                  return 'Please enter the brand';
                }
                return null;
              },
            ),
            const SizedBox(height: 16),

            // Color Options (Optional)
            const Text('Color Options (Optional)'),
            Wrap(
              spacing: 8,
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
            const SizedBox(height: 16),

            // Submit Button
            // SizedBox(
            //   width: double.infinity,
            //   child: ElevatedButton(
            //     onPressed: _submitForm,
            //     style: ElevatedButton.styleFrom(
            //       padding: const EdgeInsets.symmetric(vertical: 16),
            //     ),
            //     child: const Text('Post Product', style: TextStyle(fontSize: 18)),
            //   ),
            // ),
            Center(
                child: GestureDetector(
               onTap: _submitForm, 
              //
              //() {
              //   // if (_formKey.currentState!.validate()) {
              //   //   // Handle form submission
              //   //   final productData = {
              //   //     'name': _productNameController.text,
              //   //     'description': _productDescriptionController.text,
              //   //     'price': double.parse(_priceController.text),
              //   //     'quantity': int.parse(_quantityController.text),
              //   //     'category': _selectedCategory,
              //   //     'brand': _brandController.text,
              //   //     'colors': _selectedColors,
              //   //     'sizes': _selectedSizes,
              //   //   };
              //   //   print('Product Data: $productData');
              //   //   // You can now send this data to your backend or database
              //   // }

              // },
              child: Container(
                width: double.infinity,
                height: AppSizes.largeGap,
                decoration: BoxDecoration(
                  color: AppColors.primaryIconColor,
                  borderRadius: BorderRadius.circular(AppSizes.smallGap),
                  border: Border.all(color: AppColors.primaryIconColor),
                ),
                child:  Center(
                  child: Text(
                    'Post Product',
                    style: TextStyle(
                        fontWeight: FontWeight.bold, color: Colors.white, fontSize: AppSizes.secondaryFontSize*.9),
                  ),
                ),
              ),
            ))
          ],
        ),
      ),
    );
  }
}
