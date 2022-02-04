import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mahasiswa_api/Controller/mahasiswa_API.dart';
import 'package:mahasiswa_api/Model/mahasiswa_model.dart';
import 'package:mahasiswa_api/screenAdd.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  void initState() {
    super.initState();
    setState(() { 
      MahasiswaAPI.getMahasiswa();
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
        title: Text('Sistem Informasi'),
        actions: [
          IconButton(onPressed: () async{
            // async
            // await MahasiswaAPI.addMahasiswa(name: 'Nuel');
            // await MahasiswaAPI.getMahasiswa();
            // setState(() {
            // });
            await Navigator.push(context, MaterialPageRoute(builder: (context) => AddMahasiswaScreen(refresh: refresh,)));
          },
          icon: Icon(Icons.add)),
        ],
      ),
      body: FutureBuilder<List<Mahasiswa>>(
        future: MahasiswaAPI.getMahasiswa(),
        builder: (BuildContext context, snapshot) {
          final result = snapshot.data;
          switch (snapshot.connectionState) {
            case ConnectionState.waiting:
              return Center(child: CircularProgressIndicator(),);
            default: return mahasiswaCard(result);
          }
        },
      ),
    );
  }

  ListView mahasiswaCard(List<Mahasiswa>? result) {
    return ListView.builder(
          itemCount: result?.length  ?? 0,
          itemBuilder: (BuildContext context, int index) {
            var listItem = result?[index];
            return ListTile(
              title: Text(listItem?.name ?? ''),
              subtitle: Text(listItem?.createdAt ?? ''),
              // onTap: () async{
              //   await Navigator.popAndPushNamed(context, );
              // },
              trailing: IconButton(
                onPressed: () async{
                    await MahasiswaAPI.deleteMahasiswa(listItem?.id);
                    refresh();
                },
                icon: Icon(CupertinoIcons.trash)),
            );
          },
        );
  }
}