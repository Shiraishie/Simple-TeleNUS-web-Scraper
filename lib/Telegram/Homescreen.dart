import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:myapp/WebScraper for TG groups/TGMetaData.dart';
import 'package:url_launcher/url_launcher.dart';

class searchPage extends StatefulWidget {
  const searchPage({super.key});

  @override
  State<searchPage> createState() => _searchPageState();
}

class _searchPageState extends State<searchPage> {
  //Telegram input
  List telegramname = scrapername();
  final List<String> _results = [];

  //Telegram search bar
  void _handleSearch(String input) {
    _results.clear();
    for (var str in telegramname) {
      if (str.telegram_title.toLowerCase().contains(input.toLowerCase())) {
        setState(() {
          _results.add(str.telegram_title);
        });
      }
    }
  }

  //Url Launcher
  Future<void> _launch(String url) async {
    // ignore: deprecated_member_use
    if (await canLaunch(url)) {
      // ignore: deprecated_member_use
      await launch(
        url,
      );
    } else {
      throw 'Telegram Group not found';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.indigo,
        appBar: AppBar(
          backgroundColor: Colors.indigo,
          elevation: 0,
          centerTitle: true,
          title: Text(
            'TELEGRAM GROUPS',
            style: GoogleFonts.montserrat(
                fontSize: 25, fontWeight: FontWeight.w600),
          ),
        ),
        body: Column(mainAxisAlignment: MainAxisAlignment.start, children: [
          //
          const SizedBox(
            height: 5,
          ),
          //Padding adds like distance between the sides yk?
          //Editing the search bar UI here
          Padding(
              padding: const EdgeInsets.all(16),
              child: TextField(
                  //
                  onChanged: _handleSearch,
                  //onChanged: (keyword) => filterSearchResults(
                  //    keyword), //Works but the upddatelish is nto working
                  //
                  style: GoogleFonts.montserrat(
                      color: Colors.white,
                      fontSize: 15,
                      fontWeight: FontWeight.w600),
                  decoration: InputDecoration(
                      filled: true,
                      fillColor: Colors.white10,
                      border: OutlineInputBorder(
                          borderSide: BorderSide.none,
                          borderRadius: BorderRadius.circular(5)),
                      hintText: 'eg. CS1010S',
                      icon: const Icon(Icons.send),
                      prefixIcon: const Icon(Icons.search)))),
          const SizedBox(
            height: 15,
          ),
          //ListView
          Expanded(
            child: _results.isEmpty
                ? ListView.builder(
                    //padding: EdgeInsets.all(25),
                    //Amount of boxes
                    itemCount: List.from(telegramname).length,
                    //Name of the box
                    itemBuilder: ((context, index) => Card(
                        color: Colors.white30,
                        child: ListTile(
                          onTap: () {
                            _launch(telegramname[index].telegram_link);
                          },
                          //Uri url = telegramname.telegram_link, launchUrl(url);}
                          leading: const Icon(Icons.telegram),
                          //tileColor: Colors.white,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10)),
                          title: Text(
                            telegramname[index].telegram_title,
                            style: GoogleFonts.montserrat(
                                fontSize: 16,
                                fontWeight: FontWeight.w600,
                                color: Colors.white),
                          ),
                        ))),
                    //title: Text))
                  )
                : ListView.builder(
                    itemCount: _results.length,
                    itemBuilder: (context, index) {
                      final data = _results[index];
                      return Card(
                          color: Colors.white30,
                          child: ListTile(
                              onTap: () {},
                              leading: const Icon(Icons.telegram),
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10)),
                              title: Text(
                                data,
                                style: GoogleFonts.montserrat(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w600,
                                    color: Colors.white),
                              )));
                    }),
          )
        ]));

    //TextField(decoration: InputDecoration(filled: true,fillColor:   Colors.white10, border: OutlineInputBorder(borderSide: BorderSide.none)),)));
  }
}
