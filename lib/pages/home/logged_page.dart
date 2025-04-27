import 'package:flutter/material.dart';
import 'package:marketplace/pages/auth/help_page.dart';
import 'package:marketplace/pages/auth/login_page.dart';
import 'package:marketplace/pages/auth/profile_details_page.dart';
import 'package:marketplace/pages/navegation/add_product_page.dart';
import 'package:marketplace/pages/navegation/home_page.dart';
import 'package:marketplace/pages/navegation/my_post_page.dart';
import 'package:marketplace/pages/navegation/search_page.dart';
import 'package:marketplace/pages/terms/terms_privacy_page.dart';
import 'package:marketplace/ui/components/home_text_button_styled.dart';

class LoggedPage extends StatefulWidget {
  const LoggedPage({super.key});

  @override
  State<LoggedPage> createState() => _LoggedPageState();
}

class _LoggedPageState extends State<LoggedPage> {
  int indexPage = 0;
  PageController controller = PageController(initialPage: 0);
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar:
            indexPage == 0
                ? AppBar(title: Text("DoceHub"))
                : null, // ← Oculta nas outras páginas),
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
                functionPage: () {
                  return LoginPage();
                },
                color: const Color(0xFFF44336),
              ),
            ],
          ),
        ),
        body: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment(0.8, 1),
              colors: <Color>[Color(0xfff8bbd0), Color(0xfffff3e0)],
            ),
          ),
          height: double.infinity,
          child: Column(
            children: [
              SizedBox(height: 15),
              Expanded(
                child: PageView(
                  controller: controller,
                  onPageChanged: (index) {
                    setState(() {
                      indexPage = index;
                    });
                  },
                  children: [
                    HomePage(),
                    AddProductPage(),
                    SearchPage(),
                    MyPostPage(),
                  ],
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
                  BottomNavigationBarItem(
                    label: "Home",
                    icon: Icon(Icons.home),
                  ),
                  BottomNavigationBarItem(
                    label: "Adicionar",
                    icon: Icon(Icons.add_box_rounded),
                  ),
                  BottomNavigationBarItem(
                    label: "Procurar",
                    icon: Icon(Icons.search),
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
      ),
    );
  }
}
