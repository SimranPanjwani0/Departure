import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../controller/shlok_controller.dart';

import '../controller/theme.dart';
import 'detilsscreen.dart';

class Dohescreen extends StatelessWidget {
  const Dohescreen({super.key});

  @override
  Widget build(BuildContext context) {
    final shlokProvider = context.watch<ShlokProvider>();
    final themeProvider = Provider.of<ThemeProvider>(context);
    final providerFalse = Provider.of<ShlokProvider>(context, listen: false);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Provider.of<ThemeProvider>(context).isDarkMode
            ? const Color(0xff7b3110)
            : const Color(0xffe4b567),
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
        title: Text(
          'कबीर दास जी के दोहे',
          style: TextStyle(
            color: Provider.of<ThemeProvider>(context).isDarkMode
                ? const Color(0xffe4b567)
                : const Color(0xff7b3110),
            fontWeight: FontWeight.bold,
          ),
        ),
        elevation: 3,
        shadowColor: Color(0xff009688),
      ),
      backgroundColor: Provider.of<ThemeProvider>(context).isDarkMode
          ? const Color(0xffe4b567)
          : const Color(0xff7b3110),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: shlokProvider.shlokList.isEmpty
            ? Center(child: CircularProgressIndicator())
            : ListView.builder(
                itemCount: shlokProvider.shlokList.length,
                itemBuilder: (context, index) {
                  final shlok = shlokProvider.shlokList[index];
                  return InkWell(
                    onTap: () {
                      Navigator.pushNamed(
                        context,
                        'detils',
                        arguments: {'index': index},
                      );
                    },
                    child: Column(
                      children: [
                        Container(
                          height: 85,
                          width: double.infinity,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Colors.grey.shade300,
                          ),
                          child: Center(
                            child: Text(
                              shlokProvider.shlokList[index].shlok ?? '',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontWeight: FontWeight.w600,
                                fontSize: 19,
                                color: themeProvider.isDarkMode
                                    ? Colors.grey.shade800
                                    : Colors.black,
                              ),
                            ),
                          ),
                        ),
                        Divider(
                          color: Colors.grey,
                        ),
                      ],
                    ),
                  );
                },
              ),
      ),
    );
  }
}
