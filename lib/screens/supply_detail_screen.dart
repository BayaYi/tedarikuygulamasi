import 'package:flutter/material.dart';

class SupplyDetailScreen extends StatelessWidget {
  final int supplyId; // Tedarik kimliği

  const SupplyDetailScreen({super.key, required this.supplyId});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Supply Details #$supplyId"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Supply Title",
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500), // Corrected to headline6
            ),
            const SizedBox(height: 10),
            const Text(
              "Sector: Technology",
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
            ),
            const SizedBox(height: 20),
            const Text(
              "Description:",
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 5),
            const Text(
              "This is a detailed description of the supply. It contains all necessary information about the supply and its purpose in the related sector.",
              style: TextStyle(fontSize: 14),
            ),
            const SizedBox(height: 20),
            const Text(
              "Attached Files:",
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 5),
            GestureDetector(
              onTap: () {
                // Dosya görüntüleme işlevi buraya eklenebilir
                print("File clicked");
              },
              child: Row(
                children: const [
                  Icon(Icons.insert_drive_file, color: Colors.blue),
                  SizedBox(width: 10),
                  Text("File_Name.pdf", style: TextStyle(color: Colors.blue)),
                ],
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                goToUpdateSupply(context);
              },
              child: const Text("Update Supply"),
            ),
            const SizedBox(height: 10),
            ElevatedButton(
              onPressed: () {
                goToApplications(context);
              },
              child: const Text("View Applications"),
            ),
          ],
        ),
      ),
    );
  }

  void goToUpdateSupply(BuildContext context) => Navigator.push(
    context,
    MaterialPageRoute(
      builder: (context) => UpdateSupplyScreen(supplyId: supplyId),
    ),
  );

  void goToApplications(BuildContext context) => Navigator.push(
    context,
    MaterialPageRoute(
      builder: (context) => ApplicationsScreen(supplyId: supplyId),
    ),
  );
}

// Geçici ekranlar
class UpdateSupplyScreen extends StatelessWidget {
  final int supplyId;

  const UpdateSupplyScreen({super.key, required this.supplyId});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Update Supply #$supplyId"),
      ),
      body: const Center(
        child: Text("Update Supply Screen"),
      ),
    );
  }
}

class ApplicationsScreen extends StatelessWidget {
  final int supplyId;

  const ApplicationsScreen({super.key, required this.supplyId});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Applications for Supply #$supplyId"),
      ),
      body: const Center(
        child: Text("Applications Screen"),
      ),
    );
  }
}
