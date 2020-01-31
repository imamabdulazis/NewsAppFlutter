class ResDetailBerita{
  final String kategori_id;
  final String author;
  final String editor;
  final String berita_id;
  final String berita_judul;
  final String berita_tayang;
  final String foto_kecil;
  final String foto_besar;
  final String link;
  final String kategori;
  final String berita_isi;
  final String link_video;


  ResDetailBerita({this.kategori_id, this.author, this.editor, this.berita_id,
    this.berita_judul, this.berita_tayang, this.foto_kecil, this.foto_besar,
    this.link, this.kategori, this.berita_isi, this.link_video});

  factory ResDetailBerita.fromJson(Map<String,dynamic> json){
    return ResDetailBerita(
      kategori_id: json['kategori_id'],
      author:json['author'],
      editor: json['editor'],
      berita_id: json['berita_id'],
      berita_judul: json['berita_judul'],
      berita_tayang: json['berita_tayang'],
      foto_kecil: json['foto_kecil'],
      foto_besar: json['foto_besar'],
      link: json['link'],
      kategori: json['kategori'],
      berita_isi: json['berita_isi'],
      link_video: json['link_video'],
    );
  }
}