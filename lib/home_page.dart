import 'dart:async';
import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class BookListPage extends StatefulWidget {
  const BookListPage({super.key});

  @override
  State<BookListPage> createState() => _BookListPageState();
}

class _BookListPageState extends State<BookListPage> {
  List<Map<String, dynamic>> buku = [];

  @override
  void initState() {
    super.initState();
    fetchBooks(); //panggil fungsi untuk fetchbooks
  }

  //fungsi untuk mengambil data buku dari supabase
  Future<void> fetchBooks() async {
    final response = await Supabase.instance.client.from('buku').select();

    setState(() {
      buku = List<Map<String, dynamic>>.from(response);
    });
  }

  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Daftar Buku'),
          centerTitle: true,
          actions: [
            IconButton(
              icon: Icon(Icons.refresh),
              onPressed: fetchBooks, //tombol refresh data
            ),
          ],
        ),
        body: buku.isEmpty
            ? const Center(
                child:
                    CircularProgressIndicator()) // kondisi(satu baris) jika tabel itu kosong dia bakal munculin indikator loading
            : ListView.builder(
                itemCount: buku.length,
                itemBuilder: (context, index) {
                  final book = buku[index];
                  return ListTile(
                    title: Text(book['judul'] ?? 'No judul',
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                    ),
                    subtitle: Column(
                      children: [
                        Text(
                          book['penulis'] ?? 'No penulis',
                          style: TextStyle(
                              fontStyle: FontStyle.italic, fontSize: 14),
                        ),
                        Text(
                          book['deskripsi'] ?? 'No deskripsi',
                          style: TextStyle(fontSize: 12),
                        ),
                      ],
                    ),
                    trailing: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        //Tombol edit
                        IconButton(
                          icon: Icon(
                            Icons.edit,
                            color: Colors.blue,
                          ),
                          onPressed: () {
                            //Arahkan ke halaman EditBookPage
                            Navigator.pop(context);
                          },
                        ),
                        //Tombol hapus
                        IconButton(
                          icon: Icon(Icons.delete, color: Colors.red),
                          onPressed: () {
                            Navigator.pop(context);
                          },
                        )
                      ],
                    ),
                  );
                }));
  }
}
