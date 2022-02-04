import 'package:flutter/material.dart';
import 'package:mahasiswa_api/Controller/mahasiswa_API.dart';
import 'package:mahasiswa_api/Controller/mahasiswa_API.dart';
import 'package:mahasiswa_api/Model/mahasiswa_model.dart';

class EditMahasiswaScreen extends StatefulWidget {
  EditMahasiswaScreen({Key? key, required this.refresh, required this.mahasiswa}) : super(key: key);
  final VoidCallback refresh;
  final Mahasiswa? mahasiswa;

  @override
  State<EditMahasiswaScreen> createState() => _EditMahasiswaScreenState();
}

class _EditMahasiswaScreenState extends State<EditMahasiswaScreen> {

  TextEditingController? nama = TextEditingController();
  TextEditingController? foto = TextEditingController();
  TextEditingController? nim = TextEditingController();
  TextEditingController? jurusan = TextEditingController();

  @override
  void initState() {
    super.initState();
    setState(() {
      nama?.text = widget.mahasiswa!.name.toString();
      foto?.text = widget.mahasiswa!.foto.toString();
      nim?.text = widget.mahasiswa!.nim.toString();
      jurusan?.text = widget.mahasiswa!.jurusan.toString();
    });
  }

  void refresh(){
    MahasiswaAPI.getMahasiswa();
    setState(() {
    });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: 
        Text('Edit Data',
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
                    child: Text('Edit'),
                    height: 40.0,
                    color: Theme.of(context).secondaryHeaderColor,
                    onPressed: () async{
                      await MahasiswaAPI.editMahasiswa(id: widget.mahasiswa!.id.toString(), name: nama?.text, foto: foto?.text, nim: nim?.text,
                      jurusan: jurusan?.text);
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