class UserData{
  String _name,_mail,_cover,_profile;
  int _score;
  List<String> _pics = [
    "https://kids.nationalgeographic.com/content/dam/kidsea/kids-core-objects/backgrounds/youareleaving_kids.adapt.768.1.jpg",
    "https://www.peta.org/wp-content/uploads/2011/02/animal-1851660_1280-e1545083268497-668x336.jpg",
    "https://aldf.org/wp-content/uploads/2018/05/lamb-iStock-665494268-16x9-e1559777676675.jpg",
    "https://cdn.britannica.com/s:900x675/80/140480-131-28E57753/Dromedary-camels.jpg"
  ];

  UserData(this._name, this._mail, this._cover, this._profile, this._score);

  String get name => _name;

  void addPic(String url) => _pics.add(url);

  get mail => _mail;

  List<String> get pics => _pics;

  int get score => _score;

  get profile => _profile;

  get cover => _cover;
}
