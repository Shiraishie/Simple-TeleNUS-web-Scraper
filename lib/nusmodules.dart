import 'dart:convert';

import 'package:http/http.dart' as http;

void main() {
  nusModules.getData;
}

class nusModules {
  getData() async {
    List modulenameonly = [];
    var response = await http
        .get(Uri.parse('https://api.nusmods.com/v2/2022-2023/moduleList.json'));
    //print(response.body);
    final info = jsonDecode(response.body);
    for (var each in info) {
      modulenameonly.add(each['moduleCode']);
    }
    //final modulenameonly = info[0]['moduleCode'];
    //print(modulenameonly);
    return modulenameonly;
  }
}
