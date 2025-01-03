import 'package:flutter/material.dart';
import 'package:finalproje/auth/auth_service.dart';
import 'package:finalproje/auth/login_screen.dart';
import 'package:finalproje/widgets/button.dart';
import 'package:finalproje/screens/supply_detail_screen.dart'; // Tedarik detay ekranı için
import 'package:finalproje/screens/supply_form_screen.dart'; // Yeni tedarik paylaşımı için

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final auth = AuthService();

    return Scaffold(
      appBar: AppBar(
        title: const Text("Supply Sharing Platform"),
        actions: [
          IconButton(
            icon: const Icon(Icons.logout),
            onPressed: () async {
              await auth.signout();
              goToLogin(context);
            },
          )
        ],
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              decoration: const InputDecoration(
                labelText: "Search Supplies",
                prefixIcon: Icon(Icons.search),
                border: OutlineInputBorder(),
              ),
              onChanged: (value) {
                // Arama işlemini tetiklemek için kullanılabilir
                print("Search: $value");
              },
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: 10, // Örnek veri için
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text("Supply Title $index"),
                  subtitle: Text("Sector: Technology"),
                  trailing: const Icon(Icons.arrow_forward_ios),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => SupplyDetailScreen(
                          supplyId: index,
                        ),
                      ),
                    );
                  },
                );
              },
            ),
          )
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const SupplyFormScreen()),
          );
        },
        child: const Icon(Icons.add),
      ),
    );
  }

  void goToLogin(BuildContext context) {
    Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute(builder: (context) => const LoginScreen()),
          (route) => false,
    );
  }
}
