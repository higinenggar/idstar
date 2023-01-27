import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:idstar_users/controller/controller.dart';

class DetailUser extends StatelessWidget {
  final GetDataController getDataController = Get.put(
    GetDataController(),
  );

  DetailUser({
    super.key,
  });

  Future<void> _editUser(BuildContext context, int id) async {
    getDataController.editUser(id);
    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
      content: Text('Data berhasil diubah'),
      behavior: SnackBarBehavior.fixed,
      backgroundColor: Color.fromARGB(255, 231, 82, 72),
    ));
  }

  Future<void> _deleteData(BuildContext context, int id) async {
    getDataController.deleteUser(id);
    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
      content: Text('Data Berhasil Dihapus'),
      behavior: SnackBarBehavior.fixed,
      backgroundColor: Color.fromARGB(255, 231, 82, 72),
    ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        //centerTitle: true,
        backgroundColor: const Color(0xff5774CC),
        title: const Text(
          'Detail Pengguna',
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
                controller: getDataController.nameController,
                decoration: InputDecoration(
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
                controller: getDataController.emailController,
                decoration: InputDecoration(
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
                controller: getDataController.genderController,
                decoration: InputDecoration(
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
                controller: getDataController.statusController,
                decoration: InputDecoration(
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
                onPressed: () => _editUser(context, getDataController.id.value),
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
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.redAccent,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  minimumSize: const Size(450, 50),
                ),
                onPressed: () => showDialog(
                  context: context,
                  builder: (BuildContext ctx) {
                    return AlertDialog(
                      title: const Text('Hapus Data'),
                      content:
                          const Text('Apakah anda yakin data akan dihapus?'),
                      actions: [
                        TextButton(
                          onPressed: () =>
                              _deleteData(context, getDataController.id.value),
                          child: const Text(
                            'Ya',
                            style: TextStyle(color: Colors.red),
                          ),
                        ),
                        TextButton(
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                          child: const Text('Tidak'),
                        ),
                      ],
                    );
                  },
                ),
                child: const Text(
                  'Hapus Pengguna',
                  style: TextStyle(
                    fontSize: 16,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // void deleteUser() async {
  //   try {
  //     await Dio().delete(
  //       "https://gorest.co.in/public/v2/users/$id",
  //       options: Options(
  //         headers: {
  //           "Accept": "application/json",
  //           "Content-Type": "application/json",
  //           "Authorization":
  //               "Bearer 4563d47bd8de69b622df0c4a18a1083fab6fb51a6c632da44565c1d702d18a6f",
  //         },
  //       ),
  //     );
  //   } catch (e) {
  //     print(e);
  //   }
  // }
}
