import 'package:flutter/material.dart';
import 'package:marketplace/pages/auth/help_page.dart';
import 'package:marketplace/pages/auth/login_page.dart';
import 'package:marketplace/pages/auth/profile_details_page.dart';
import 'package:marketplace/pages/navegation/search_page.dart';
import 'package:marketplace/pages/terms/terms_privacy_page.dart';
import 'package:marketplace/ui/components/home_text_button_styled.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int indexPage = 0;
  PageController controller = PageController(initialPage: 0);
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(title: Text("DoceHub")),
        endDrawer: Drawer(
          backgroundColor: Color(0xfff8bbd0),
          child: Column(
            children: [
              SizedBox(height: 40),
              HomeTextButtonStyled(
                nameButton: "Dados cadastrais",
                icon: Icons.person,
                functionPage: () => const ProfileDetailsPage(),
                color: Color(0xff6b4226),
              ),
              SizedBox(height: 15),

              HomeTextButtonStyled(
                nameButton: "Termos de uso e privacidade",
                icon: Icons.description,
                functionPage: () => TermsPrivacyPage(),
                color: Color(0xff6b4226),
              ),
              SizedBox(height: 15),

              HomeTextButtonStyled(
                nameButton: "Suporte",
                icon: Icons.help_outline,
                functionPage: () => HelpPage(),
                color: Color(0xff6b4226),
              ),

              Spacer(),
              HomeTextButtonStyled(
                nameButton: "Sair do aplicativo",
                icon: Icons.exit_to_app,
                functionPage: () => LoginPage(),
                color: const Color(0xFFF44336),
              ),
            ],
          ),
        ),
        body: Column(
          children: [
            Expanded(
              child: PageView(
                controller: controller,
                onPageChanged: (index) {
                  setState(() {
                    indexPage = index;
                  });
                },
                children: [Container(), Container(), SearchPage(), Container()],
              ),
            ),
            BottomNavigationBar(
              type: BottomNavigationBarType.fixed,
              backgroundColor: Color(0xff6b4226),
              selectedItemColor: Color(0xffc8e6c9),
              unselectedItemColor: Color(0xfff8bbd0),
              onTap: (index) {
                controller.jumpToPage(index);
              },
              currentIndex: indexPage,
              items: [
                BottomNavigationBarItem(label: "Home", icon: Icon(Icons.home)),
                BottomNavigationBarItem(
                  label: "Adicionar",
                  icon: Icon(Icons.add_box_rounded),
                ),
                BottomNavigationBarItem(
                  label: "Procurar",
                  icon: Icon(Icons.search),
                ),
                BottomNavigationBarItem(
                  label: "Favoritos",
                  icon: Icon(Icons.favorite),
                ),
                BottomNavigationBarItem(
                  label: "Postagem",
                  icon: Icon(Icons.person),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
