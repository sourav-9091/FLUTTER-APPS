// Container(
//                 height: 60,
//                 width: 350,
//                 decoration: BoxDecoration(
//                   borderRadius: BorderRadius.circular(5),
//                   border: Border.all(
//                     color: Colors.black,
//                     width: 1,
//                   ),
//                 ),
//                 child: Padding(
//                   padding: const EdgeInsets.all(20.0),
//                   child: GestureDetector(
//                     onTap: () {
//                       Dialog errorDialog = Dialog(
//                         shape: RoundedRectangleBorder(
//                             borderRadius:
//                                 BorderRadius.circular(12.0)), //this right here
//                         child: MaterialApp(
//                           home: Scaffold(
//                             body: GestureDetector(
//                               onTap: () {
//                                 setState(() {});
//                               },
//                               child: Container(
//                                 child: Column(
//                                   children: <Widget>[
//                                     Padding(
//                                       padding: const EdgeInsets.all(8.0),
//                                       child: TextField(
//                                         onChanged: (value) {
//                                           setState(() {
//                                             filterSearchResults(value);
//                                           });
//                                         },
//                                         controller: editingController,
//                                         decoration: InputDecoration(
//                                           labelText: "Search",
//                                           hintText: "Search",
//                                           prefixIcon: Icon(Icons.search),
//                                           border: OutlineInputBorder(
//                                             borderRadius: BorderRadius.all(
//                                               Radius.circular(25.0),
//                                             ),
//                                           ),
//                                         ),
//                                       ),
//                                     ),
//                                     Expanded(
//                                       child: ListView.builder(
//                                         shrinkWrap: true,
//                                         itemCount: items12.length,
//                                         itemBuilder: (context, index) {
//                                           return ListTile(
//                                             title: Text(
//                                               '${items12[index]}',
//                                               style: TextStyle(
//                                                 color: Colors.black,
//                                               ),
//                                             ),
//                                           );
//                                         },
//                                       ),
//                                     ),
//                                   ],
//                                 ),
//                               ),
//                             ),
//                           ),
//                         ),
//                       );
//                       showDialog(
//                           context: context,
//                           builder: (BuildContext context) => errorDialog);
//                     },
//                     child: Row(
//                       children: [
//                         const Icon(Icons.person),
//                         const SizedBox(width: 12),
//                         DropdownButton<String>(
//                           icon: Icon(Icons.arrow_drop_down),
//                           underline: Container(
//                             color: Colors.white,
//                           ),
//                           borderRadius: BorderRadius.circular(5),
//                           elevation: 0,
//                           focusColor: Colors.white,
//                           value: dropdownvalue,
//                           style: TextStyle(color: Colors.white),
//                           iconEnabledColor: Colors.black,
//                           items:
//                               items.map<DropdownMenuItem<String>>((String val) {
//                             return DropdownMenuItem(
//                               value: val,
//                               child: Text(
//                                 val,
//                                 style:
//                                     TextStyle(color: Colors.black, fontSize: 15),
//                               ),
//                             );
//                           }).toList(),
//                           onChanged: ((String? value) {
//                             setState(() {
//                               dropdownvalue = value!;
//                             });
//                           }),
//                         ),
//                         Text(
//                           "SELECT AN ITEM",
//                           style: TextStyle(
//                             fontSize: 16,
//                           ),
//                         ),
//                       ],
//                     ),
//                   ),
//                 ),
//               ),