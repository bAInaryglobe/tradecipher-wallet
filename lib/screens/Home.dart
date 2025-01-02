import 'package:flutter/material.dart';
import 'package:animations/animations.dart';
import '../components/Cards.dart';
import '../components/Buttons.dart';

class TradeCipherHomeScreen extends StatefulWidget {
  const TradeCipherHomeScreen({Key? key}) : super(key: key);

  @override
  _TradeCipherHomeScreenState createState() => _TradeCipherHomeScreenState();
}

class _TradeCipherHomeScreenState extends State<TradeCipherHomeScreen> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  int _selectedIndex = 0;
  bool _isDarkMode = false;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 800),
      vsync: this,
    )..forward();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      appBar: AppBar(
        title: FadeTransition(
          opacity: _controller,
          child: const Text('TradeCipher',
              style: TextStyle(fontWeight: FontWeight.bold)),
        ),
        elevation: 0,
        backgroundColor: Colors.transparent,
        actions: [
          AnimatedSwitcher(
            duration: const Duration(milliseconds: 300),
            child: IconButton(
              key: ValueKey(_isDarkMode),
              icon: Icon(_isDarkMode ? Icons.light_mode : Icons.dark_mode),
              onPressed: () => setState(() => _isDarkMode = !_isDarkMode),
            ),
          ),
          IconButton(
            icon: const Icon(Icons.settings),
            onPressed: () {/* Show settings */},
          ),
        ],
      ),
      body: SafeArea(
        child: Column(
          children: [
            // Balance Card
            SlideTransition(
              position: Tween<Offset>(
                begin: const Offset(0, -0.5),
                end: Offset.zero,
              ).animate(CurvedAnimation(
                parent: _controller,
                curve: Curves.easeOutCubic,
              )),
              child: Card(
                margin: const EdgeInsets.all(16),
                child: Padding(
                  padding: const EdgeInsets.all(20),
                  child: Column(
                    children: [
                      const Text(
                        'Total Balance',
                        style: TextStyle(fontSize: 16),
                      ),
                      const SizedBox(height: 8),
                      Text(
                        '\$125,435.00',
                        style: Theme.of(context).textTheme.headlineMedium,
                      ),
                      const SizedBox(height: 16),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          _buildActionButton(context, Icons.add, 'Deposit'),
                          _buildActionButton(context, Icons.swap_horiz, 'Swap'),
                          _buildActionButton(context, Icons.send, 'Send'),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
            
            // Tabs
            TabBar(
              tabs: const [
                Tab(text: 'Tokens'),
                Tab(text: 'NFTs'),
                Tab(text: 'Activity'),
              ],
              indicatorColor: Theme.of(context).colorScheme.primary,
            ),
            
            // Content
            Expanded(
              child: TabBarView(
                children: [
                  _buildTokensList(),
                  _buildNFTsGrid(),
                  _buildActivityList(),
                ],
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: NavigationBar(
        selectedIndex: _selectedIndex,
        onDestinationSelected: (index) {
          setState(() => _selectedIndex = index);
        },
        destinations: const [
          NavigationDestination(icon: Icon(Icons.wallet), label: 'Wallet'),
          NavigationDestination(icon: Icon(Icons.analytics), label: 'Markets'),
          NavigationDestination(icon: Icon(Icons.swap_horiz), label: 'Swap'),
          NavigationDestination(icon: Icon(Icons.person), label: 'Profile'),
        ],
      ),
    );
  }

  Widget _buildActionButton(BuildContext context, IconData icon, String label) {
    return Column(
      children: [
        Container(
          decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.primaryContainer,
            borderRadius: BorderRadius.circular(12),
          ),
          padding: const EdgeInsets.all(12),
          child: Icon(icon),
        ),
        const SizedBox(height: 4),
        Text(label),
      ],
    );
  }

  Widget _buildTokensList() {
    return ListView.builder(
      itemCount: 5,
      padding: const EdgeInsets.all(16),
      itemBuilder: (context, index) {
        return const CryptoCard(
          assetName: 'Bitcoin',
          balance: '2.5 BTC',
        );
      },
    );
  }

  Widget _buildNFTsGrid() {
    return GridView.builder(
      padding: const EdgeInsets.all(16),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 16,
        mainAxisSpacing: 16,
      ),
      itemCount: 4,
      itemBuilder: (context, index) {
        return Card(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.image, size: 48),
              Text('NFT #$index'),
            ],
          ),
        );
      },
    );
  }

  Widget _buildActivityList() {
    return ListView.builder(
      itemCount: 5,
      padding: const EdgeInsets.all(16),
      itemBuilder: (context, index) {
        return ListTile(
          leading: const CircleAvatar(child: Icon(Icons.sync)),
          title: Text('Transaction #$index'),
          subtitle: Text('2024-02-${10 + index}'),
          trailing: const Text('+0.5 ETH'),
        );
      },
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}
