import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

class profilePage extends StatefulWidget {
  const profilePage({super.key});

  @override
  State<profilePage> createState() => _profilePageState();
}

@override
class _profilePageState extends State<profilePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        flexibleSpace: Center(
          child: Padding(
            padding: const EdgeInsets.only(top: 30.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Image.asset(
                  'images/Logo_SafraApp3.png', // Substitua pelo caminho da sua imagem
                  height: 40, // Ajuste a altura conforme necessário
                ),
              ],
            ),
          ),
        ),
        automaticallyImplyLeading: false,
        elevation: 0,
        backgroundColor: Color.fromARGB(255, 2, 89, 47),
        centerTitle: true,
      ),
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        reverse: false,
        child: Column(
          children: [
            Container(
              color: Color.fromARGB(255, 2, 89, 47),
              height: 280,
              width: MediaQuery.of(context).size.width,
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 20.0),
                    child: CircleAvatar(
                      radius: 80,
                      backgroundColor: Colors.red,
                      backgroundImage: const NetworkImage(
                        'https://images.pexels.com/photos/41008/cowboy-ronald-reagan-cowboy-hat-hat-41008.jpeg?auto=compress&cs=tinysrgb&w=400',
                      ),
                      child: Container(
                        width: double.infinity,
                        height: double.infinity,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(
                            color: Color.fromARGB(255, 8, 46, 28),
                            width: 5.0,
                          ),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 8.0),
                    child: Text(
                      'José Lourenço da Silva',
                      style: TextStyle(
                          fontSize: 30,
                          color: Colors.white,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 5.0),
                    child: Text(
                      'Araraquara, São Paulo',
                      style: TextStyle(
                        fontSize: 20,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 18.0, left: 25),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        'Configurações',
                        style: TextStyle(
                            fontSize: 22, fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 25.0),
                  child: Container(
                    width: 380,
                    height: 50,
                    decoration: BoxDecoration(
                      color: Color.fromARGB(50, 220, 220, 220),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 8.0),
                          child: Text(
                            'Editar Perfil',
                            style: TextStyle(
                                fontSize: 17, fontWeight: FontWeight.w600),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 260.0),
                          child: Icon(Icons.arrow_forward_ios),
                        )
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 18.0),
                  child: Container(
                      width: 380,
                      height: 50,
                      decoration: BoxDecoration(
                        color: Color.fromARGB(50, 220, 220, 220),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 8.0),
                            child: Text(
                              'Sair da Conta',
                              style: TextStyle(
                                  fontSize: 17, fontWeight: FontWeight.w600),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 248.0),
                            child: Icon(Icons.arrow_forward_ios),
                          )
                        ],
                      )),
                ),
              ],
            )
          ],
        ),
      ),
      bottomNavigationBar: Container(
        color: Color.fromARGB(255, 2, 89, 47),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 5),
          child: GNav(
              backgroundColor: Color.fromARGB(255, 2, 89, 47),
              color: Colors.white,
              activeColor: Colors.white,
              tabBackgroundColor: Color.fromARGB(255, 8, 46, 28),
              padding: EdgeInsets.all(16),
              gap: 8,
              onTabChange: (index) {
                print(index);
              },
              tabs: [
                GButton(
                  icon: Icons.home,
                  text: 'Início',
                ),
                GButton(
                  icon: Icons.eco_rounded,
                  text: 'Lavoura',
                ),
                GButton(
                  icon: Icons.water_drop,
                  text: 'Insumo',
                ),
                GButton(
                  icon: Icons.history_outlined,
                  text: 'Histórico',
                ),
                GButton(
                  icon: Icons.settings,
                  text: 'Configurações',
                ),
              ]),
        ),
      ),
    );
  }
}
