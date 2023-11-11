class KulinerModel {
  String name;
  String image;

  KulinerModel({required this.name, required this.image});

  static List<KulinerModel> getKuliner() {
    List<KulinerModel> kuliners = [];
    kuliners.add(
      KulinerModel(
        name: 'Jawa',
        image: 'images/kuliner/Jawakuliner.png',
      ),
    );
    kuliners.add(
      KulinerModel(
        name: 'Korea',
        image: 'images/kuliner/Koreakuliner.png',
      ),
    );
    kuliners.add(
      KulinerModel(
        name: 'Makassar',
        image: 'images/kuliner/Makassarkuliner.png',
      ),
    );
    kuliners.add(
      KulinerModel(
        name: 'Padang',
        image: 'images/kuliner/Padangkuliner.png',
      ),
    );
    kuliners.add(
      KulinerModel(
        name: 'Sunda',
        image: 'images/kuliner/Sundakuliner.png',
      ),
    );
    return kuliners;
  }
}
