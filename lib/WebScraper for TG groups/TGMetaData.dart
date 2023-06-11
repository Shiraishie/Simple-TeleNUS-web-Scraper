import 'telegramdata.dart';
import 'package:beautiful_soup_dart/beautiful_soup.dart';

class tgAll {
  String? telegram_title;
  String? telegram_link;
  tgAll(this.telegram_title, this.telegram_link); //Classes the variables
  //@override
  //String toString() {
  //  return '{${this.telegram_title}, ${this.telegram_link} }';
//  }
}

scrapername() {
  List<dynamic> lst = [];
  String rawdata = telegramdatastring; //raw data

  BeautifulSoup parseddata = BeautifulSoup(
      rawdata); //Parses data using beautifulsoup package, has to be done manually
  for (var data in parseddata.findAll('a')) {
    //Makes a list where [TG.name, TG.link]
    lst.add(tgAll(data.string.toString(), data['href']));
  }
  //Testing Here
  //print(lst);
  //for (var ooo in lst) {
  //  print(ooo.telegram_title);
  //  print(ooo.telegram_link);
  //}
  //}
  ////
  ///
  ///
  //print(lst);
  return lst;
}

//Testing

//scraperlink() async {
//  List<dynamic> lst = [];
//  String rawdata = telegramdatastring; //raw data

//  BeautifulSoup parseddata = BeautifulSoup(
//     rawdata); //Parses data using beautifulsoup package, has to be done manually
//  for (var data in parseddata.findAll('a')) {
//   //Makes a list where [TG.link]
//   lst.add(data['href']);
// }
//  return lst;
//}

//This is to give the variables in the lst a name

void main() {
  List telegramname = scrapername();
  print(telegramname);
}
