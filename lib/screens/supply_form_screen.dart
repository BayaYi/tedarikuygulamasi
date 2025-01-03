import 'package:flutter/material.dart';

class SupplyFormScreen extends StatefulWidget {
  const SupplyFormScreen({super.key});

  @override
  _SupplyFormScreenState createState() => _SupplyFormScreenState();
}

class _SupplyFormScreenState extends State<SupplyFormScreen> {
  final _formKey = GlobalKey<FormState>();
  String? _title;
  String? _description;
  String? _sector;
  String? _attachedFile;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Share a New Supply"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TextFormField(
                  decoration: const InputDecoration(
                    labelText: "Title",
                    border: OutlineInputBorder(),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Please enter a title";
                    }
                    return null;
                  },
                  onSaved: (value) {
                    _title = value;
                  },
                ),
                const SizedBox(height: 20),
                TextFormField(
                  maxLines: 4,
                  decoration: const InputDecoration(
                    labelText: "Description",
                    border: OutlineInputBorder(),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Please enter a description";
                    }
                    return null;
                  },
                  onSaved: (value) {
                    _description = value;
                  },
                ),
                const SizedBox(height: 20),
                DropdownButtonFormField<String>(
                  decoration: const InputDecoration(
                    labelText: "Sector",
                    border: OutlineInputBorder(),
                  ),
                  items: ["Technology", "Healthcare", "Education", "Other"]
                      .map((sector) => DropdownMenuItem(
                    value: sector,
                    child: Text(sector),
                  ))
                      .toList(),
                  onChanged: (value) {
                    _sector = value;
                  },
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Please select a sector";
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 20),
                ElevatedButton.icon(
                  onPressed: () {
                    // Dosya seçimi için placeholder işlem
                    setState(() {
                      _attachedFile = "example_file.pdf";
                    });
                  },
                  icon: const Icon(Icons.attach_file),
                  label: const Text("Attach File"),
                ),
                if (_attachedFile != null)
                  Padding(
                    padding: const EdgeInsets.only(top: 10.0),
                    child: Text("Attached File: $_attachedFile"),
                  ),
                const SizedBox(height: 30),
                Center(
                  child: ElevatedButton(
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        _formKey.currentState!.save();
                        _submitForm(context);
                      }
                    },
                    child: const Text("Share Supply"),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _submitForm(BuildContext context) {
    // Formu işleme mantığı (örnek olarak veri yazdırılır)
    print("Title: $_title");
    print("Description: $_description");
    print("Sector: $_sector");
    print("Attached File: $_attachedFile");

    // Kullanıcıyı bilgilendirme ve önceki ekrana dönme
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text("Supply shared successfully!")),
    );
    Navigator.pop(context);
  }
}
