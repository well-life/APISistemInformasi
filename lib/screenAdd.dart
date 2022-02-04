import 'package:flutter/material.dart';
import 'package:mahasiswa_api/Controller/mahasiswa_API.dart';

class AddMahasiswaScreen extends StatefulWidget {
  AddMahasiswaScreen({Key? key, required this.refresh}) : super(key: key);
  final VoidCallback refresh;

  @override
  State<AddMahasiswaScreen> createState() => _AddMahasiswaScreenState();
}

class _AddMahasiswaScreenState extends State<AddMahasiswaScreen> {

  TextEditingController nama = TextEditingController();
  TextEditingController foto = TextEditingController();
  TextEditingController nim = TextEditingController();
  TextEditingController jurusan = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: 
        Text('Masuk',
          style: Theme.of(context).textTheme.headline6!.copyWith(color: Colors.black, fontWeight: FontWeight.bold),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              SizedBox(
                height: 16,
              ),
              Text(
                'Nama',
                style: TextStyle(fontSize: 10, fontWeight: FontWeight.bold),
              ),
              TextField(
                controller: nama,
                decoration: InputDecoration(
                  hintText: 'Masukkan nama',
                  focusedBorder: OutlineInputBorder(),
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                'Foto',
                style: TextStyle(fontSize: 10, fontWeight: FontWeight.bold),
              ),
              TextField(
                controller: foto,
                decoration: InputDecoration(
                  hintText: 'Masukkan foto',
                  focusedBorder: OutlineInputBorder(),
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                'Jurusan',
                style: TextStyle(fontSize: 10, fontWeight: FontWeight.bold),
              ),
              TextField(
                controller: jurusan,
                decoration: InputDecoration(
                  hintText: 'Masukkan jurusan',
                  focusedBorder: OutlineInputBorder(),
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                'NIM',
                style: TextStyle(fontSize: 10, fontWeight: FontWeight.bold),
              ),
              TextField(
                controller: nim,
                decoration: InputDecoration(
                  hintText: 'Masukkan nim',
                  focusedBorder: OutlineInputBorder(),
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(
                height: 30,
              ),
              Center(
                child:MaterialButton(
                    child: Text('Tambah'),
                    height: 40.0,
                    color: Theme.of(context).secondaryHeaderColor,
                    onPressed: () async{
                      await MahasiswaAPI.addMahasiswa(name: nama.text, foto: foto.text, nim: nim.text,
                      jurusan: jurusan.text);
                      Navigator.pop(context);
                      widget.refresh();
                    },
                  ),
                )
            ])
        ),
      ),
    );
  }
}