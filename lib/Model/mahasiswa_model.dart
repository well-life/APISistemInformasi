class Mahasiswa{
  String? name;
  String? foto;
  String? createdAt;
  String? nim;
  String? jurusan;
  String? id;

  Mahasiswa({
    this.name,
    this.foto,
    this.createdAt,
    this.nim,
    this.jurusan,
    this.id,
  });

  static Mahasiswa fromJSON(json)
    => Mahasiswa(
      name: json['name'],
      foto: json['foto'],
      createdAt: json['createdAt'],
      nim: json['nim'],
      jurusan: json['jurusan'],
      id: json['id'],
    );
}