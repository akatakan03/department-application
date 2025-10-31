import 'package:flutter/material.dart';

import 'package:department_application/screens/hakkinda_page.dart';
import 'package:department_application/screens/kisiler_page.dart';
import 'package:department_application/screens/altyapi_page.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>
    with SingleTickerProviderStateMixin {

  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
  }

  void dispose() {

    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Department Application'),
        automaticallyImplyLeading: false,

        bottom: TabBar(

          controller: _tabController,
          tabs: const [
            Tab(text: 'HAKKINDA'),
            Tab(text: 'KİŞİLER'),
            Tab(text: 'ALTYAPI'),
          ],
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: const [
          HakkindaPage(),
          KisilerPage(),
          AltyapiPage(),
        ],
      ),
    );
  }
}