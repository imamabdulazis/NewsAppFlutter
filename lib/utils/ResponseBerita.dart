class Berita {
  final String berita_id;
  final String berita_judul;
  final String berita_tayang;
  final String parameter_tayang;
  final String foto_kecil;
  final String foto_besar;
  final String link;
  final String kategori;
  final String keyword;
  final String jenis;
  final String link_video;

  Berita({this.berita_id, this.berita_judul, this.berita_tayang,
      this.parameter_tayang, this.foto_kecil, this.foto_besar, this.link,
      this.kategori, this.keyword, this.jenis, this.link_video});

  factory Berita.fromJson(Map<String,dynamic> json){
    return Berita(
        berita_id: json['berita_id'],
        berita_judul: json['berita_judul'],
        berita_tayang: json['berita_tayang'],
        parameter_tayang: json['parameter_tayang'],
        foto_kecil: json['foto_kecil'],
        foto_besar: json['foto_besar'],
        link: json['link'],
        kategori: json['kategori'],
        keyword: json['keyword'],
        jenis: json['jenis'],
        link_video:json['link_video'],
    );
  }
}
