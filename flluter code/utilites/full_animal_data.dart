class FullAnimalData {
  String _name,
      _species,
      _description,
      _environment,
      _meals,
      _ageRange,
      _trade,
      _status,
      _profilePic,
      _coverPic;
  bool _legal;
List<dynamic>_countries;
  FullAnimalData(
      this._name,
      this._species,
      this._description,
      this._environment,
      this._meals,
      this._ageRange,
      this._trade,
      this._status,
      this._countries,
      this._profilePic,
      this._coverPic,
      this._legal,);

  bool get legal => _legal;


  get coverPic => _coverPic == null ? "_coverPic" :_coverPic ;

  get profilePic => _profilePic == null ? "_profilePic" :_profilePic ;

  // get countries => _countries == null ? [] :_countries ;

  get status => _status== null ? "_status" : _status;

  get trade => _trade== null ? "_trade" : _trade;

  get ageRange => _ageRange== null ? "_ageRange" : _ageRange;

  get meals => _meals== null ? "_meals" :_meals ;

  get environment => _environment== null ? "_environment" :_environment ;

  get description => _description== null ? "_description" : _description;

  get species => _species== null ? "_species" :_species ;

  String get name => _name== null ? "_name" : _name;
}
