import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:idstar_users/controller/controller.dart';
import 'package:idstar_users/page/add_page.dart';

class HomePage extends StatelessWidget {
  final GetDataController getDataController = Get.put(GetDataController());

  Future<void> _pullRefresh() async {
    print('cek');
    getDataController.data.refresh();
    getDataController.getList();
  }

  Future<void> _onEdit(int? id) async {
    getDataController.id.value = id ?? 0;
    getDataController.toEditPage();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xff5774CC),
        title: const Text(
          'List Pengguna',
          style: TextStyle(
            fontSize: 21,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
      body: SafeArea(
        child: Obx(
          () => RefreshIndicator(
            onRefresh: _pullRefresh,
            child: Stack(
              children: [
                Column(
                  children: [
                    buildSearch(),
                    Expanded(
                      child: ListView(
                        children: getDataController.data.map((e) {
                          return GestureDetector(
                            onTap: () => _onEdit(
                              int.tryParse(
                                e.id.toString(),
                              ),
                            ),
                            child: Container(
                              margin: const EdgeInsets.all(5),
                              constraints: const BoxConstraints(
                                minHeight: 100,
                              ),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(15),
                                border: Border.all(
                                  color: Colors.grey.withOpacity(0.4),
                                  width: 2,
                                ),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(10.0),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'Nama : ${e.id}',
                                      style: GoogleFonts.poppins(
                                        fontSize: 14,
                                        fontWeight: FontWeight.w600,
                                        color: Colors.black87,
                                      ),
                                    ),
                                    const SizedBox(
                                      height: 10,
                                    ),
                                    Text(
                                      'Nama : ${e.name}',
                                      style: GoogleFonts.poppins(
                                        fontSize: 14,
                                        fontWeight: FontWeight.w600,
                                        color: Colors.black87,
                                      ),
                                    ),
                                    const SizedBox(
                                      height: 10,
                                    ),
                                    Text(
                                      'Email : ${e.email}',
                                      style: GoogleFonts.poppins(
                                        fontSize: 14,
                                        fontWeight: FontWeight.w600,
                                        color: Colors.black87,
                                      ),
                                    ),
                                    const SizedBox(
                                      height: 10,
                                    ),
                                    Text(
                                      'Gender : ${e.gender}',
                                      style: GoogleFonts.poppins(
                                        fontSize: 14,
                                        fontWeight: FontWeight.w600,
                                        color: Colors.black87,
                                      ),
                                    ),
                                    const SizedBox(
                                      height: 10,
                                    ),
                                    Text(
                                      'Status : ${e.status}',
                                      style: GoogleFonts.poppins(
                                        fontSize: 14,
                                        fontWeight: FontWeight.w600,
                                        color: Colors.black87,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          );
                        }).toList(),
                      ),
                    )
                  ],
                )
              ],
            ),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: const Color(0xff5774CC),
        onPressed: (() {
          Get.to(() => AddUser());
        }),
        child: const Icon(Icons.add),
      ),
    );
  }

  Widget buildSearch() => Padding(
        padding: const EdgeInsets.only(top: 10, left: 10, right: 10),
        child: TextField(
          //onChanged: searchMenu,
          decoration: InputDecoration(
              filled: true,
              fillColor: Colors.white,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
                borderSide: const BorderSide(color: Colors.grey),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: const BorderSide(
                  color: Color(0xff5774CC),
                ),
              ),
              prefixIcon: const Icon(
                Icons.search,
              ),
              hintText: 'Cari layanan...'),
        ),
      );
}
