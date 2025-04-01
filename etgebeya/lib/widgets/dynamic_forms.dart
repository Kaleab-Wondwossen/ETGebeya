import 'package:flutter/material.dart';


class DynamicFormScreen extends StatefulWidget {
  const DynamicFormScreen({super.key});

  @override
  State<DynamicFormScreen> createState() => _DynamicFormScreenState();
}

class _DynamicFormScreenState extends State<DynamicFormScreen> {
  final _formKey = GlobalKey<FormState>();
  final Map<String, dynamic> _formData = {};

  // Form controllers
  final TextEditingController _nameController = TextEditingController();
  String? _selectedCategory;
  String? _selectedCarBrand;
  String? _selectedClothingGender;
  String? _selectedElectronicsType;
  bool _hasWarranty = false;

  // Available options
  final List<String> _categories = ['Car', 'Clothing', 'Electronics', 'Books'];
  final List<String> _carBrands = ['Toyota', 'Honda', 'BMW', 'Tesla'];
  final List<String> _electronicsTypes = ['Phone', 'Laptop', 'Tablet', 'TV'];

  @override
  void dispose() {
    _nameController.dispose();
    super.dispose();
  }

  void _submitForm() {
    if (_formKey.currentState!.validate()) {
      // Store all data in a structured way
      _formData['name'] = _nameController.text;
      _formData['category'] = _selectedCategory;
      
      // Store conditional data in a nested structure
      _formData['details'] = {
        if (_selectedCategory == 'Car') 
          'car_brand': _selectedCarBrand,
        if (_selectedCategory == 'Clothing')
          'gender': _selectedClothingGender,
        if (_selectedCategory == 'Electronics') ...{
          'type': _selectedElectronicsType,
          'has_warranty': _hasWarranty,
        },
        // Add more category-specific fields here
      };

      // Show the collected data
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: const Text('Form Submitted'),
          content: SingleChildScrollView(
            child: Text(_formatFormData(_formData)),
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text('OK'),
            ),
          ],
        ),
      );

      // For debugging
      print(_formData);
    }
  }

  String _formatFormData(Map<String, dynamic> data) {
    String result = 'Name: ${data['name']}\n';
    result += 'Category: ${data['category']}\n';
    
    if (data['details'] != null) {
      result += '\nDetails:\n';
      data['details'].forEach((key, value) {
        result += '- $key: $value\n';
      });
    }
    
    return result;
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
                });
              },
              validator: (value) =>
                  value == null ? 'Please select a car brand' : null,
            ),
            const SizedBox(height: 16),
          ],
        );
      case 'Clothing':
        return Column(
          children: [
            const Text('Gender', style: TextStyle(fontSize: 16)),
            Row(
              children: [
                Expanded(
                  child: RadioListTile<String>(
                    title: const Text('Male'),
                    value: 'Male',
                    groupValue: _selectedClothingGender,
                    onChanged: (value) {
                      setState(() {
                        _selectedClothingGender = value;
                      });
                    },
                  ),
                ),
                Expanded(
                  child: RadioListTile<String>(
                    title: const Text('Female'),
                    value: 'Female',
                    groupValue: _selectedClothingGender,
                    onChanged: (value) {
                      setState(() {
                        _selectedClothingGender = value;
                      });
                    },
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),
          ],
        );
      case 'Electronics':
        return Column(
          children: [
            DropdownButtonFormField<String>(
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
                  value == null ? 'Please select a type' : null,
            ),
            const SizedBox(height: 16),
            SwitchListTile(
              title: const Text('Includes Warranty'),
              value: _hasWarranty,
              onChanged: (value) {
                setState(() {
                  _hasWarranty = value;
                });
              },
            ),
            const SizedBox(height: 16),
          ],
        );
      case 'Books':
        return const Column(
          children: [
            Text('No additional information needed for books',
                style: TextStyle(color: Colors.grey)),
            SizedBox(height: 16),
          ],
        );
      default:
        return Container();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Dynamic Form Demo'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                TextFormField(
                  controller: _nameController,
                  decoration: const InputDecoration(
                    labelText: 'Name',
                    border: OutlineInputBorder(),
                  ),
                  validator: (value) =>
                      value!.isEmpty ? 'Please enter your name' : null,
                ),
                const SizedBox(height: 16),
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
                      // Reset conditional fields when category changes
                      _selectedCarBrand = null;
                      _selectedClothingGender = null;
                      _selectedElectronicsType = null;
                      _hasWarranty = false;
                    });
                  },
                  validator: (value) =>
                      value == null ? 'Please select a category' : null,
                ),
                const SizedBox(height: 24),
                if (_selectedCategory != null) ...[
                  const Text('Additional Information',
                      style: TextStyle(
                          fontSize: 18, fontWeight: FontWeight.bold)),
                  const SizedBox(height: 8),
                  _buildConditionalFields(),
                ],
                const SizedBox(height: 24),
                ElevatedButton(
                  onPressed: _submitForm,
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(vertical: 16),
                  ),
                  child: const Text('Submit Form',
                      style: TextStyle(fontSize: 18)),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}