// import 'package:flutter/material.dart';
// import 'dart:convert';
// import 'package:http/http.dart' as http;
// import 'user_model.dart';

// class CalculatorScreen extends StatefulWidget {
//   const CalculatorScreen({super.key});

//   @override
//   State<CalculatorScreen> createState() => _CalculatorScreenState();
// }

// class _CalculatorScreenState extends State<CalculatorScreen> {
//   late TextEditingController firstnumnisa;
//   late TextEditingController secoundnumnisa;
//   double result = 0;
//   @override
//   void initState() {
//     super.initState();
//     firstnumnisa = TextEditingController();
//     secoundnumnisa = TextEditingController();
//     result = 0;
//   }

//   void addNumbers() {
//     final num1 = double.tryParse(firstnumnisa.text) ?? 0;
//     final num2 = double.tryParse(secoundnumnisa.text) ?? 0;

//     setState(() {
//       result = num1 + num2;
//     });
//   }

//   void subtractNumbers() {
//     final num1 = double.tryParse(firstnumnisa.text) ?? 0;
//     final num2 = double.tryParse(secoundnumnisa.text) ?? 0;

//     setState(() {
//       result = num1 - num2;
//     });
//   }

//   void multiplyNumbers() {
//     final num1 = double.tryParse(firstnumnisa.text) ?? 0;
//     final num2 = double.tryParse(secoundnumnisa.text) ?? 0;

//     setState(() {
//       result = num1 * num2;
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('simply kuno calculator'),
//         centerTitle: true,
//       ),
//       body: Center(
//         child: Padding(
//           padding: const EdgeInsets.all(20),
//           child: Column(
//             mainAxisSize: MainAxisSize.min,
//             children: [
//               TextField(
//                 controller: firstnumnisa,
//                 keyboardType: TextInputType.number,
//                 decoration: const InputDecoration(
//                   labelText: '1st Number',
//                   border: OutlineInputBorder(),
//                 ),
//               ),
//               const SizedBox(height: 15),
//               TextField(
//                 controller: secoundnumnisa,
//                 keyboardType: TextInputType.number,
//                 decoration: const InputDecoration(
//                   labelText: '2nd Number',
//                   border: OutlineInputBorder(),
//                 ),
//               ),
//               const SizedBox(height: 30),
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                 children: [
//                   ElevatedButton(
//                     onPressed: addNumbers,
//                     child: const Text('Add'),
//                   ),
//                   ElevatedButton(
//                     onPressed: subtractNumbers,
//                     child: const Text('Subtract'),
//                   ),
//                   ElevatedButton(
//                     onPressed: multiplyNumbers,
//                     child: const Text('Multiply'),
//                   ),
//                 ],
//               ),
//               const SizedBox(height: 30),
//               Text(
//                 'Result: $result',
//                 style: const TextStyle(
//                   fontSize: 22,
//                   fontWeight: FontWeight.bold,
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
import 'package:flutter/material.dart';
import 'package:modelhandler/controller/user_controller.dart';
import 'model/user_model.dart';

class UserScreen extends StatefulWidget {
  const UserScreen({super.key});

  @override
  State<UserScreen> createState() => _UserScreenState();
}

class _UserScreenState extends State<UserScreen> {
  final controller = UserController();
  List<User> users = [];

  final nameController = TextEditingController();
  final emailController = TextEditingController();

  @override
  void initState() {
    super.initState();
    loadUsers();
  }

  void loadUsers() async {
    final data = await controller.getUsers();
    setState(() {
      users = data;
    });
  }

  void addUser() async {
    if (nameController.text.isEmpty || emailController.text.isEmpty) return;

    final user = User(name: nameController.text, email: emailController.text);

    await controller.addUser(user);

    nameController.clear();
    emailController.clear();

    loadUsers(); // refresh list from controller
  }

  void deleteUser(int id) async {
    await controller.deleteUser(id);
    loadUsers(); // refresh list
  }

  @override
  void dispose() {
    nameController.dispose();
    emailController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('')),
      body: Column(
        children: [
          TextField(
            controller: nameController,
            decoration: const InputDecoration(labelText: 'Enter your Name'),
          ),
          TextField(
            controller: emailController,
            decoration: const InputDecoration(labelText: 'Enter your Email'),
          ),
          ElevatedButton(onPressed: addUser, child: const Text('Add User')),
          Expanded(
            child: ListView.builder(
              itemCount: users.length,
              itemBuilder: (context, index) {
                final user = users[index];
                return ListTile(
                  title: Text(user.name),
                  subtitle: Text(user.email),
                  trailing: IconButton(
                    icon: const Icon(Icons.delete),
                    onPressed: () {
                      deleteUser(user.id!);
                    },
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
