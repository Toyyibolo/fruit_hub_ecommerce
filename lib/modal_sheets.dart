// import "package:flutter/material.dart";

// class ModalSheet extends StatefulWidget {
//   const ModalSheet({super.key});

//   @override
//   State<ModalSheet> createState() => _ModalSheetState();
// }

// class _ModalSheetState extends State<ModalSheet> {
//   @override
//   Widget build(BuildContext context) {
//     return showModalBottomSheet(
//       isDismissible: false,
//       clipBehavior: Clip.hardEdge,
//       backgroundColor: Colors.transparent,
//       context: context,
//       builder: (context) {
//         return Column(
//           children: [
//             GestureDetector(
//               onTap: () {
//                 Navigator.pop(context);
//               },
//               child: Center(
//                 child: Icon(
//                   Icons.cancel,
//                   size: 60 * hRatio,
//                   color: Colors.white,
//                 ),
//               ),
//             ),
//             SizedBox(
//               height: 20 * hRatio,
//             ),
//             Container(
//               //color: Colors.white,
//               height: 350,
//               width: double.maxFinite,
//               decoration: BoxDecoration(
//                   color: Colors.white,
//                   borderRadius: BorderRadius.only(
//                       topLeft: Radius.circular(20),
//                       topRight: Radius.circular(20))),
//               child: Padding(
//                 padding:
//                     EdgeInsets.only(left: 20.0 * wRatio, right: 20 * wRatio),
//                 child: Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       SizedBox(height: 30 * hRatio),
//                       Text('Delivery address'),
//                       SizedBox(
//                         height: 15 * hRatio,
//                       ),
//                       TextField(
//                         decoration: InputDecoration(
//                             border: InputBorder.none,
//                             enabledBorder: OutlineInputBorder(
//                                 borderRadius: BorderRadius.circular(12),
//                                 borderSide: BorderSide(color: Colors.white)),
//                             fillColor: Colors.grey[250],
//                             hintText: '10th avenue, lekki , Lagos State',
//                             hintStyle: TextStyle(
//                               color: Colors.grey,
//                             ),
//                             filled: true),
//                       ),
//                       SizedBox(height: 20 * hRatio),
//                       Text("Number we can call"),
//                       SizedBox(height: 15 * hRatio),
//                       TextField(
//                         decoration: InputDecoration(
//                             border: InputBorder.none,
//                             enabledBorder: OutlineInputBorder(
//                                 borderRadius: BorderRadius.circular(12),
//                                 borderSide: BorderSide(color: Colors.white)),
//                             fillColor: Colors.grey[250],
//                             hintText: '07068957720',
//                             hintStyle: TextStyle(
//                               color: Colors.grey,
//                             ),
//                             filled: true),
//                       ),
//                       SizedBox(
//                         height: 40 * hRatio,
//                       ),
//                       Row(
//                         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                         children: [
//                           OutlineButton(
//                               ws: 125, hr: hRatio, text: "pay on delvery"),
//                           OutlineButton(
//                               ws: 125, hr: hRatio, text: "pay with card"),
//                         ],
//                       ),
//                     ]),
//               ),
//             ),
//           ],
//         );
//       });
//   }
// }