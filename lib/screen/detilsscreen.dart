import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:share_plus/share_plus.dart';
import '../controller/shlok_controller.dart';
import '../controller/theme.dart';

class Detilsscreen extends StatelessWidget {
  final int index;

  Detilsscreen({Key? key, required this.index}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final shlokProvider = context.watch<ShlokProvider>();
    final shlok = shlokProvider.shlokList[index];
    final themeProvider = Provider.of<ThemeProvider>(context);
    final providerFalse = Provider.of<ShlokProvider>(context, listen: false);

    String displaySaar;

    // Choose the text based on the selected language
    switch (shlokProvider.selectedLanguage) {
      case 'english':
        displaySaar = shlok.saar_enj ?? '';
        break;
      case 'gujarati':
        displaySaar = shlok.saar_guj ?? '';
        break;
      default:
        displaySaar = shlok.saar ?? '';
    }

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Provider.of<ThemeProvider>(context).isDarkMode
            ? const Color(0xff7b3110)
            : const Color(0xffe4b567),
        title: Text(
          'कबीर दास जी के दोहे',
          style: TextStyle(
            color: Provider.of<ThemeProvider>(context).isDarkMode
                ? const Color(0xffe4b567)
                : const Color(0xff7b3110),
            fontWeight: FontWeight.bold,
          ),
        ),
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(
            Icons.arrow_back,
            color: Provider.of<ThemeProvider>(context).isDarkMode
                ? const Color(0xffe4b567)
                : const Color(0xff7b3110),
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {
              Share.share(
                '${shlok.shlok}\n\n${displaySaar}',
              );
            },
            icon: Icon(
              Icons.share,
              color: Provider.of<ThemeProvider>(context).isDarkMode
                  ? const Color(0xffe4b567)
                  : const Color(0xff7b3110),
              size: 28,
            ),
          ),
          PopupMenuButton(
            icon: Icon(
              Icons.translate,
              color: Provider.of<ThemeProvider>(context).isDarkMode
                  ? const Color(0xffe4b567)
                  : const Color(0xff7b3110),
            ),
            onSelected: (value) {
              providerFalse.updateSelectedLanguage(value);
            },
            itemBuilder: (context) => const [
              PopupMenuItem<String>(
                value: 'hindi',
                child: Text('Hindi'),
              ),
              PopupMenuItem<String>(
                value: 'english',
                child: Text('English'),
              ),
              PopupMenuItem<String>(
                value: 'gujarati',
                child: Text('Gujarati'),
              ),
            ],
          )
        ],
        elevation: 3,
        shadowColor: const Color(0xff009688),
      ),
      backgroundColor: Provider.of<ThemeProvider>(context).isDarkMode
          ? const Color(0xffe4b567)
          : const Color(0xff7b3110),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: 380,
              width: double.infinity,
              decoration: BoxDecoration(
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: AssetImage(
                    shlok.img ?? '',
                  ),
                ),
              ),
            ),
            const SizedBox(height: 10),
            Text(
              shlok.shlok ?? '',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontWeight: FontWeight.w600,
                fontSize: 18,
                color: Provider.of<ThemeProvider>(context).isDarkMode
                    ? const Color(0xff7b3110)
                    : const Color(0xffe4b567),
              ),
            ),
            Text(
              "अर्थ:",
              textAlign: TextAlign.start,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20,
                color: Provider.of<ThemeProvider>(context).isDarkMode
                    ? const Color(0xff7b3110)
                    : const Color(0xffe4b567),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(
                displaySaar,
                overflow: TextOverflow.fade,
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 18,
                  color: Provider.of<ThemeProvider>(context).isDarkMode
                      ? const Color(0xff7b3110)
                      : const Color(0xffe4b567),
                ),
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                    onPressed: index > 0
                        ? () {
                            Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                builder: (context) =>
                                    Detilsscreen(index: index - 1),
                              ),
                            );
                          }
                        : null,
                    icon: Icon(
                      Icons.arrow_back,
                      color: Provider.of<ThemeProvider>(context).isDarkMode
                          ? const Color(0xff7b3110)
                          : const Color(0xffe4b567),
                      size: 35,
                    ),
                  ),
                  TextButton(
                    onPressed: () {
                      Clipboard.setData(ClipboardData(
                        text: '${shlok.shlok}\n\n${displaySaar}',
                      ));
                    },
                    child: Icon(
                      Icons.copy,
                      size: 35,
                      color: Provider.of<ThemeProvider>(context).isDarkMode
                          ? const Color(0xff7b3110)
                          : const Color(0xffe4b567),
                    ),
                  ),
                  IconButton(
                    onPressed: index < shlokProvider.shlokList.length - 1
                        ? () {
                            Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                builder: (context) =>
                                    Detilsscreen(index: index + 1),
                              ),
                            );
                          }
                        : null,
                    icon: Icon(
                      Icons.arrow_forward,
                      color: Provider.of<ThemeProvider>(context).isDarkMode
                          ? const Color(0xff7b3110)
                          : const Color(0xffe4b567),
                      size: 35,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
