import '../models/personaje_model.dart';
import 'package:http/http.dart' as http;

class PersonajeService {
  final _url = 'https://thesimpsonsapi.com/api/';

  Future<Personaje?> getPersonaje(int id) async {
    Uri uri = Uri.parse('${_url}characters/$id');

    http.Response res = await http.get(uri);

    if (res.statusCode != 200) return null;

    Personaje personaje = personajeFromJson(res.body);

    //print(personaje.name);

    return personaje;
  }
}
