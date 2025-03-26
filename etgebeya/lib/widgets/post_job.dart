// ignore_for_file: library_private_types_in_public_api

import 'package:etgebeya/measures/size_consts.dart';
import 'package:etgebeya/utils/colors.dart';
import 'package:flutter/material.dart';

class JobPostForm extends StatefulWidget {
  const JobPostForm({super.key});

  @override
  _JobPostFormState createState() => _JobPostFormState();
}

class _JobPostFormState extends State<JobPostForm> {
  final _formKey = GlobalKey<FormState>();
  final _productNameController = TextEditingController();
  final _productDescriptionController = TextEditingController();
  final _addressController = TextEditingController();
  final _phoneNumberController = TextEditingController();
  // final _priceController = TextEditingController();
  // final _quantityController = TextEditingController();
  // final _brandController = TextEditingController();
  // String? _selectedCategory;
  // final List<String> _selectedColors = [];
  // final List<String> _selectedSizes = [];

  // final List<String> _categories = [
  //   'Electronics',
  //   'Clothing',
  //   'Home & Kitchen',
  //   'Sports',
  //   'Books',
  //   'Others',
  // ];

  // final List<String> _sizes = [
  //   'Low',
  //   'Medium',
  //   'High',
  // ];

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: EdgeInsets.all(AppSizes.smallGap),
      child: Form(
        key: _formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(child: Text("Signing Up for A Worker", style: TextStyle(
              fontSize: AppSizes.primaryFontSize,
              fontWeight: FontWeight.bold,
            ),)),
            SizedBox(height: AppSizes.smallGap),
            // Product Name
            TextFormField(
              controller: _productNameController,
              decoration: const InputDecoration(
                labelText: 'Title and Name',
                border: OutlineInputBorder(),
              ),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter your name';
                }
                return null;
              },
            ),
            SizedBox(height: AppSizes.smallGap),

            // Product Description
            TextFormField(
              controller: _productDescriptionController,
              decoration: const InputDecoration(
                labelText: 'Job type and Description',
                border: OutlineInputBorder(),
              ),
              maxLines: 3,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter the job type  description';
                }
                return null;
              },
            ),
            SizedBox(height: AppSizes.smallGap),

            TextFormField(
              controller: _addressController,
              decoration: const InputDecoration(
                labelText: 'Address',
                border: OutlineInputBorder(),
              ),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter your address';
                }
                return null;
              },
            ),
            SizedBox(height: AppSizes.smallGap),

            TextFormField(
              controller: _phoneNumberController,
              decoration: const InputDecoration(
                labelText: 'Phone Number',
                border: OutlineInputBorder(),
              ),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter your Phone Number';
                }
                return null;
              },
            ),
            SizedBox(height: AppSizes.smallGap),
            // Price
            // TextFormField(
            //   controller: _priceController,
            //   decoration: const InputDecoration(
            //     labelText: 'Salary',
            //     border: OutlineInputBorder(),
            //     prefixText: '\$',
            //   ),
            //   keyboardType: TextInputType.number,
            //   validator: (value) {
            //     if (value == null || value.isEmpty) {
            //       return 'Please enter the price';
            //     }
            //     if (double.tryParse(value) == null) {
            //       return 'Please enter a valid price';
            //     }
            //     return null;
            //   },
            // ),
            // SizedBox(height: AppSizes.smallGap),

            // Quantity
            // TextFormField(
            //   controller: _quantityController,
            //   decoration: const InputDecoration(
            //     labelText: 'Vaccancy',
            //     border: OutlineInputBorder(),
            //   ),
            //   keyboardType: TextInputType.number,
            //   validator: (value) {
            //     if (value == null || value.isEmpty) {
            //       return 'Please enter the quantity';
            //     }
            //     if (int.tryParse(value) == null) {
            //       return 'Please enter a valid quantity';
            //     }
            //     return null;
            //   },
            // ),
            //SizedBox(height: AppSizes.smallGap),

            // Category Dropdown
            // DropdownButtonFormField<String>(
            //   value: _selectedCategory,
            //   decoration: const InputDecoration(
            //     labelText: 'Job Category',
            //     border: OutlineInputBorder(),
            //   ),
            //   items: _categories.map((category) {
            //     return DropdownMenuItem(
            //       value: category,
            //       child: Text(category),
            //     );
            //   }).toList(),
            //   onChanged: (value) {
            //     setState(() {
            //       _selectedCategory = value;
            //     });
            //   },
            //   validator: (value) {
            //     if (value == null || value.isEmpty) {
            //       return 'Please select a job category';
            //     }
            //     return null;
            //   },
            // ),
            // SizedBox(height: AppSizes.smallGap),

            // Brand (Optional)
            // TextFormField(
            //   controller: _brandController,
            //   decoration: const InputDecoration(
            //     labelText: 'Extra Skill (Optional)',
            //     border: OutlineInputBorder(),
            //   ),
            // ),
            // SizedBox(height: AppSizes.smallGap),

            // Size Options (Optional)
            // const Text('Skill Level (Optional)'),
            // Wrap(
            //   children: _sizes.map((size) {
            //     return FilterChip(
            //       label: Text(size),
            //       selected: _selectedSizes.contains(size),
            //       onSelected: (selected) {
            //         setState(() {
            //           if (selected) {
            //             _selectedSizes.add(size);
            //           } else {
            //             _selectedSizes.remove(size);
            //           }
            //         });
            //       },
            //     );
            //   }).toList(),
            // ),
            // SizedBox(height: AppSizes.smallGap),

            // Submit Button
            Center(
              child: ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    // Handle form submission
                    final productData = {
                      'name': _productNameController.text,
                      'description': _productDescriptionController.text,
                      // 'price': double.parse(_priceController.text),
                      // 'quantity': int.parse(_quantityController.text),
                      // 'category': _selectedCategory,
                      // 'brand': _brandController.text,
                      // 'colors': _selectedColors,
                      // 'sizes': _selectedSizes,
                      'address': _addressController.text,
                      'phone': _phoneNumberController.text,
                    };
                    print('Product Data: $productData');
                    // You can now send this data to your backend or database

                    showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return AlertDialog(
                          backgroundColor: AppColors.primaryIconColor,
                          title: const Center(
                            child: Text(
                              'Success',
                              style: TextStyle(
                                color: Colors.white,
                              ),
                            ),
                          ),
                          content: const Text(
                            'Job Posted Successfully!',
                            style: TextStyle(
                              color: Colors.white,
                            ),
                          ),
                          actions: [
                            TextButton(
                              onPressed: () {
                                Navigator.of(context).pop(); // Close dialog
                              },
                              child: const Text('OK', style: TextStyle(
                                color: Colors.white,)
                              ),
                            ),
                          ],
                        );
                      },
                    );
                  }
                },
                child: const Text(
                  'Post Job',
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: AppColors.primaryIconColor),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
