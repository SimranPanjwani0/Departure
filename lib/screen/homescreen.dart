import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../controller/theme.dart';

class Homepage extends StatelessWidget {
  const Homepage({Key? key});

  @override
  Widget build(BuildContext context) {
    final isDarkMode = Provider.of<ThemeProvider>(context).isDarkMode;

    return Scaffold(
      backgroundColor: Provider.of<ThemeProvider>(context).isDarkMode
          ? const Color(0xffe4b567)
          : const Color(0xff7b3110),
      appBar: AppBar(
        backgroundColor: Provider.of<ThemeProvider>(context).isDarkMode
            ? const Color(0xff7b3110)
            : const Color(0xffe4b567),
        title: Text(
          'कबीर के दोहे',
          style: TextStyle(
            color: Provider.of<ThemeProvider>(context).isDarkMode
                ? const Color(0xffe4b567)
                : const Color(0xff7b3110),
            fontWeight: FontWeight.bold,
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {
              Provider.of<ThemeProvider>(context, listen: false).toggleTheme();
            },
            icon: Provider.of<ThemeProvider>(context).isDarkMode
                ? const Icon(
                    Icons.light_mode,
                    color: Color(0xffe4b567),
                  )
                : const Icon(
                    Icons.dark_mode,
                    color: Color(0xff7b3110),
                  ),
          ),
          IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.more_vert_sharp,
              color: Provider.of<ThemeProvider>(context).isDarkMode
                  ? const Color(0xffe4b567)
                  : const Color(0xff7b3110),
            ),
          ),
        ],
        elevation: 3,
        shadowColor: const Color(0xffe4b567),
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 50),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              InkWell(
                onTap: () {
                  Navigator.pushNamed(context, 'dohe');
                },
                child: Container(
                  height: 300,
                  width: 250,
                  decoration: BoxDecoration(
                    image: const DecorationImage(
                        fit: BoxFit.cover,
                        image: AssetImage('assets/images/Kabirdas.png')),
                    borderRadius: BorderRadius.circular(15),
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                'कबीर दास जी के दोहे',
                style: TextStyle(
                  color: Provider.of<ThemeProvider>(context).isDarkMode
                      ? const Color(0xff7b3110)
                      : const Color(0xffe4b567),
                  fontWeight: FontWeight.bold,
                  fontSize: 25,
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Text(
                "कबीर वाणी संत कबीरदास की शिक्षाओं और उपदेशों का संकलन है। इसमें धार्मिक भेदभाव, आडंबर, और सामाजिक कुरीतियों के विरोध में संदेश दिए गए हैं। कबीरदास ने अपने दोहों और भजनों के माध्यम से प्रेम, सत्य, और ईश्वर की भक्ति पर जोर दिया, जो सरल और सटीक हैं।",
                style: TextStyle(
                  fontSize: 18,
                  color: Provider.of<ThemeProvider>(context).isDarkMode
                      ? const Color(0xff7b3110)
                      : const Color(0xffe4b567),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
