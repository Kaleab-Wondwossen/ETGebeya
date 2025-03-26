// ignore_for_file: library_private_types_in_public_api

import 'package:etgebeya/utils/colors.dart';
import 'package:flutter/material.dart';

// Enum to represent gender options
enum Gender { male, female, other }

class JobPostFormJobSeeker extends StatefulWidget {
  const JobPostFormJobSeeker({super.key});

  @override
  State<JobPostFormJobSeeker> createState() => _JobPostFormJobSeekerState();
}

class _JobPostFormJobSeekerState extends State<JobPostFormJobSeeker> {
  Gender? _selectedGender;
  final _formKey = GlobalKey<FormState>();
  final _productNameController = TextEditingController();
  final _productDescriptionController = TextEditingController();
  final _addressController = TextEditingController();
  final _phoneNumberController = TextEditingController();

  // Add a key for gender validation
  final _genderKey = GlobalKey<FormFieldState>();

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16.0),
      child: Form(
        key: _formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Center(
              child: Text(
                "Signing Up as A Worker",
                style: TextStyle(
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const SizedBox(height: 16.0),
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
            const SizedBox(height: 16.0),
            // Gender selection with validation
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Gender',
                  style: TextStyle(fontSize: 16),
                ),
                FormField<Gender>(
                  key: _genderKey,
                  validator: (value) {
                    if (_selectedGender == null) {
                      return 'Please select a gender';
                    }
                    return null;
                  },
                  builder: (FormFieldState<Gender> state) {
                    return Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Flexible(
                              child: RadioListTile<Gender>(
                                title: const Text('Male'),
                                value: Gender.male,
                                groupValue: _selectedGender,
                                onChanged: (Gender? value) {
                                  setState(() {
                                    _selectedGender = value;
                                    state.didChange(value);
                                  });
                                },
                              ),
                            ),
                            Flexible(
                              child: RadioListTile<Gender>(
                                title: const Text('Female'),
                                value: Gender.female,
                                groupValue: _selectedGender,
                                onChanged: (Gender? value) {
                                  setState(() {
                                    _selectedGender = value;
                                    state.didChange(value);
                                  });
                                },
                              ),
                            ),
                          ],
                        ),
                        if (state.hasError)
                          Padding(
                            padding: const EdgeInsets.only(left: 16.0),
                            child: Text(
                              state.errorText!,
                              style: TextStyle(
                                color: Theme.of(context).colorScheme.error,
                                fontSize: 12,
                              ),
                            ),
                          ),
                      ],
                    );
                  },
                ),
              ],
            ),
            TextFormField(
              controller: _productDescriptionController,
              decoration: const InputDecoration(
                labelText: 'Job type and Description',
                border: OutlineInputBorder(),
              ),
              maxLines: 3,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter the job type description';
                }
                return null;
              },
            ),
            const SizedBox(height: 16.0),
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
            const SizedBox(height: 16.0),
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
            const SizedBox(height: 16.0),
            Center(
              child: ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    final productData = {
                      'name': _productNameController.text,
                      'description': _productDescriptionController.text,
                      'address': _addressController.text,
                      'phone': _phoneNumberController.text,
                      'gender': _selectedGender!.name,
                    };
                    print('Product Data: $productData');

                    // Show success dialog
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
                            'Job Applied Successfully!',
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
                  'Apply Job',
                  
                  style: TextStyle(fontWeight: FontWeight.bold,
                      color: AppColors.primaryIconColor),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    _productNameController.dispose();
    _productDescriptionController.dispose();
    _addressController.dispose();
    _phoneNumberController.dispose();
    super.dispose();
  }
}
