import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:idstar_users/controller/controller.dart';

class AddUser extends StatelessWidget {
  AddUser({super.key});

  final GetDataController getDataController = Get.put(GetDataController());

  Future<void> _addUser(BuildContext context) async {
    getDataController.addUser(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xff5774CC),
        title: const Text(
          'Tambah Pengguna',
          style: TextStyle(
            fontSize: 21,
            fontWeight: FontWeight.w600,
          ),
        ),
        leading: Padding(
          padding: const EdgeInsets.only(right: 8.0),
          child: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(
              Icons.navigate_before,
              color: Colors.white,
              size: 25,
            ),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(
            vertical: 20,
            horizontal: 15,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Nama',
                style: TextStyle(
                  fontSize: 17,
                  fontWeight: FontWeight.w600,
                  color: Color(0xff5774CC),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              TextFormField(
                controller: getDataController.addNameController,
                decoration: InputDecoration(
                  hintText: 'Masukkan Nama',
                  prefixIcon: Icon(
                    Icons.person,
                    size: 20,
                    color: const Color(0xff5774CC).withOpacity(0.6),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: const BorderSide(color: Colors.grey),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: const BorderSide(
                      color: Color(0xff5774CC),
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              const Text(
                'Email',
                style: TextStyle(
                  fontSize: 17,
                  fontWeight: FontWeight.w600,
                  color: Color(0xff5774CC),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              TextFormField(
                controller: getDataController.addEmailController,
                decoration: InputDecoration(
                  hintText: 'Masukkan Email',
                  prefixIcon: Icon(
                    Icons.email,
                    size: 20,
                    color: const Color(0xff5774CC).withOpacity(0.6),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: const BorderSide(color: Colors.grey),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: const BorderSide(
                      color: Color(0xff5774CC),
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              const Text(
                'Gender',
                style: TextStyle(
                  fontSize: 17,
                  fontWeight: FontWeight.w600,
                  color: Color(0xff5774CC),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              TextFormField(
                controller: getDataController.addGenderController,
                decoration: InputDecoration(
                  hintText: 'Masukkan Gender',
                  prefixIcon: Icon(
                    Icons.male,
                    size: 20,
                    color: const Color(0xff5774CC).withOpacity(0.6),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: const BorderSide(color: Colors.grey),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: const BorderSide(
                      color: Color(0xff5774CC),
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              const Text(
                'Status',
                style: TextStyle(
                  fontSize: 17,
                  fontWeight: FontWeight.w600,
                  color: Color(0xff5774CC),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              TextFormField(
                controller: getDataController.addStatusController,
                decoration: InputDecoration(
                  hintText: 'Masukkan Status',
                  prefixIcon: Icon(
                    Icons.visibility,
                    size: 20,
                    color: const Color(0xff5774CC).withOpacity(0.6),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: const BorderSide(color: Colors.grey),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: const BorderSide(
                      color: Color(0xff5774CC),
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xff5774CC),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  minimumSize: const Size(450, 50),
                ),
                onPressed: () => _addUser(context),
                child: const Text(
                  'Simpan',
                  style: TextStyle(
                    fontSize: 16,
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
