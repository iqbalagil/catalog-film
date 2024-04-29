// import 'package:flutter/material.dart';

// class Navbar extends StatefulWidget {
//   const Navbar({super.key});

//   @override
//   State<Navbar> createState() => _NavbarState();
// }

// class _NavbarState extends State<Navbar> {
//   int _currentIndex = 0;
//   List<Widget> body = const [
//     Icon(Icons.home),
//     Icon(Icons.bookmark),
//     Icon(Icons.star)
//   ];

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Center(
//         child: body[_currentIndex],
//       ),
//       bottomNavigationBar: BottomNavigationBar(
//         currentIndex: _currentIndex,
//         onTap: (int newIndex) {
//           setState(() {
//             _currentIndex = newIndex;
//           });
//         },
        
//           items: const [
//             BottomNavigationBarItem(
//               label: 'Home',
//               icon: Icon(Icons.home),
//             ),
//             BottomNavigationBarItem(
//               label: 'Bookmark',
//               icon: Icon(Icons.bookmark)
//             ),
//             BottomNavigationBarItem(
//               label: 'Popular',
//               icon: Icon(Icons.star)
//             )
//           ]
//       ),
//     );
//   }
// }