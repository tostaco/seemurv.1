import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:seemur_v1/auth/auth.dart';
import 'package:seemur_v1/models/client_model.dart';

class ClientBody extends StatefulWidget {
  @override
  _ClientBodyState createState() => _ClientBodyState();
}

class _ClientBodyState extends State<ClientBody> {
  String userID;
  //Widget content;

  @override
  void initState() {
    super.initState();

    setState(() {
      Auth().currentUser().then((onValue) {
        userID = onValue;
        print('el futuro Cheft $userID');
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        height: MediaQuery.of(context).size.height * 0.15,
        alignment: Alignment.center,
        color: Colors.black12,
        child: StreamBuilder(
            stream: Firestore.instance.collection("client").snapshots(),
            builder:
                (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
              if (!snapshot.hasData) {
                return Text("loading....");
              } else {
                if (snapshot.data.documents.length == 0) {
                } else {
                  return Container(
                      child: ListView(
                    scrollDirection: Axis.horizontal,
                    children: snapshot.data.documents.map((document) {
                      return Row(children: <Widget>[
                        new Container(
                            child: InkWell(
                                onTap: () {
                                  Client client = Client(
                                    taskname: document['taskname'].toString(),
                                    taskclientimage:
                                        document['taskclientimage'].toString(),
                                    taskdescription:
                                        document['taskdescription'].toString(),
                                    taskphone: document['taskphone'].toString(),
                                    taskprice: document['taskprice'].toString(),
                                    tasklocation:
                                        document['tasklocation'].toString(),
                                    tasktime: document['tasktime'].toString(),
                                  );
                                  // Navigator.push(
                                  //     context,
                                  //     MaterialPageRoute(
                                  //         builder: (context) => VerReceta(
                                  //             recipe: recipe,
                                  //             idRecipe:
                                  //                 document.documentID,
                                  //             uid: userID)));
                                },
                                child: Container(
                                    width: MediaQuery.of(context).size.width,
                                    decoration:
                                        BoxDecoration(color: Colors.black),
                                    child: Stack(children: <Widget>[
                                      Column(
                                        children: <Widget>[
                                          Container(
                                            width: MediaQuery.of(context)
                                                .size
                                                .width,
                                            height: 280,
                                            child: FadeInImage(
                                              fit: BoxFit.cover,
                                              width: 340,
                                              height: 320,
                                              placeholder: AssetImage(
                                                  'assets/images/azucar.gif'),
                                              image: NetworkImage(
                                                  document["taskclientimage"]),
                                            ),
                                          ),
                                        ],
                                      ),
                                      Positioned(
                                        top: 220.0,
                                        left: 10.0,
                                        right: 10.0,
                                        child: Card(
                                          shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(8.0)),
                                          elevation: 4.0,
                                          child: Column(
                                            children: <Widget>[
                                              Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: <Widget>[
                                                  Container(
                                                    alignment: Alignment.center,
                                                    width: 341,
                                                    height: 422,
                                                    child: Column(
                                                      children: <Widget>[
                                                        SizedBox(
                                                          height: 32.0,
                                                        ),
                                                        Text(
                                                          document["taskname"]
                                                              .toString(),
                                                          style: TextStyle(
                                                            fontFamily:
                                                                'HankenGrotesk',
                                                            color: Color(
                                                                0xff000000),
                                                            fontSize: 24,
                                                            fontWeight:
                                                                FontWeight.w700,
                                                            fontStyle: FontStyle
                                                                .normal,
                                                            letterSpacing:
                                                                -0.4000000059604645,
                                                          ),
                                                        ),
                                                        SizedBox(
                                                          height: 24,
                                                        ),
                                                        Text(
                                                          document[
                                                                  "taskdescription"]
                                                              .toString(),
                                                          style: TextStyle(
                                                            fontFamily:
                                                                'HankenGrotesk',
                                                            color: Color(
                                                                0xff000000),
                                                            fontSize: 24,
                                                            fontWeight:
                                                                FontWeight.w700,
                                                            fontStyle: FontStyle
                                                                .normal,
                                                            letterSpacing:
                                                                -0.4000000059604645,
                                                          ),
                                                        ),
                                                        //Row(),
                                                        SizedBox(
                                                          height: 33.0,
                                                        ),
                                                        Container(
                                                          alignment:
                                                              Alignment.center,
                                                          child: Row(
                                                            children: <Widget>[
                                                              Column(
                                                                children: <
                                                                    Widget>[
                                                                  Text(
                                                                    'Horario:',
                                                                    style:
                                                                        TextStyle(
                                                                      fontFamily:
                                                                          'HankenGrotesk',
                                                                      color: Color(
                                                                          0xff000000),
                                                                      fontSize:
                                                                          12,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .w400,
                                                                      fontStyle:
                                                                          FontStyle
                                                                              .normal,
                                                                      letterSpacing:
                                                                          -0.4000000059604645,
                                                                    ),
                                                                  ),
                                                                  Text(
                                                                    document[
                                                                            "tasktime"]
                                                                        .toString(),
                                                                    style:
                                                                        TextStyle(
                                                                      fontFamily:
                                                                          'HankenGrotesk',
                                                                      color: Color(
                                                                          0xff000000),
                                                                      fontSize:
                                                                          15,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .w700,
                                                                      fontStyle:
                                                                          FontStyle
                                                                              .normal,
                                                                      letterSpacing:
                                                                          -0.4000000059604645,
                                                                    ),
                                                                  ),
                                                                ],
                                                              ),
                                                              SizedBox(
                                                                width: 60.0,
                                                              ),
                                                              Column(
                                                                children: <
                                                                    Widget>[
                                                                  Text(
                                                                    'Distancia:',
                                                                    style:
                                                                        TextStyle(
                                                                      fontFamily:
                                                                          'HankenGrotesk',
                                                                      color: Color(
                                                                          0xff000000),
                                                                      fontSize:
                                                                          12,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .w400,
                                                                      fontStyle:
                                                                          FontStyle
                                                                              .normal,
                                                                      letterSpacing:
                                                                          -0.4000000059604645,
                                                                    ),
                                                                  ),
                                                                  Text(
                                                                    document[
                                                                            "tasklocation"]
                                                                        .toString(),
                                                                    style:
                                                                        TextStyle(
                                                                      fontFamily:
                                                                          'HankenGrotesk',
                                                                      color: Color(
                                                                          0xff000000),
                                                                      fontSize:
                                                                          15,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .w700,
                                                                      fontStyle:
                                                                          FontStyle
                                                                              .normal,
                                                                      letterSpacing:
                                                                          -0.4000000059604645,
                                                                    ),
                                                                  ),
                                                                ],
                                                              ),
                                                            ],
                                                          ),
                                                        ),

                                                        Padding(
                                                          padding:
                                                              const EdgeInsets
                                                                      .only(
                                                                  top: 48.0),
                                                          child: Row(
                                                            children: <Widget>[
                                                              IconButton(
                                                                icon: Icon(
                                                                    FontAwesomeIcons
                                                                        .heart,
                                                                    size: 34,
                                                                    color: Color(
                                                                        0xffff2f8e)),
                                                                onPressed:
                                                                    () {},
                                                              ),
                                                              Padding(
                                                                padding:
                                                                    const EdgeInsets
                                                                            .only(
                                                                        left:
                                                                            16.0),
                                                                child:
                                                                    IconButton(
                                                                  icon: Icon(
                                                                      FontAwesomeIcons
                                                                          .star,
                                                                      size: 34,
                                                                      color: Color(
                                                                          0xfff5af00)),
                                                                  onPressed:
                                                                      () {},
                                                                ),
                                                              ),
                                                              Padding(
                                                                padding:
                                                                    const EdgeInsets
                                                                            .only(
                                                                        left:
                                                                            16.0),
                                                                child:
                                                                    IconButton(
                                                                  icon: Icon(
                                                                      FontAwesomeIcons
                                                                          .shareAlt,
                                                                      size: 34,
                                                                      color: Color(
                                                                          0xff4cd964)),
                                                                  onPressed:
                                                                      () {},
                                                                ),
                                                              ),
                                                              Padding(
                                                                padding:
                                                                    const EdgeInsets
                                                                            .only(
                                                                        left:
                                                                            40.0),
                                                                child:
                                                                    Container(
                                                                  width: 103,
                                                                  height: 33,
                                                                  decoration:
                                                                      BoxDecoration(
                                                                    color: Color(
                                                                        0xff16202c),
                                                                    border: Border.all(
                                                                        width:
                                                                            0,
                                                                        style: BorderStyle
                                                                            .none),
                                                                    borderRadius: BorderRadius.horizontal(
                                                                        left: Radius.circular(
                                                                            22),
                                                                        right: Radius.circular(
                                                                            22)),
                                                                  ),
                                                                  child: Stack(
                                                                    children: <
                                                                        Widget>[
                                                                      Positioned(
                                                                          left:
                                                                              15,
                                                                          top:
                                                                              10,
                                                                          child:
                                                                              Icon(
                                                                            Icons.phone,
                                                                            size:
                                                                                14,
                                                                            color:
                                                                                Colors.white,
                                                                          )),
                                                                      Padding(
                                                                        padding:
                                                                            const EdgeInsets.only(left: 19),
                                                                        child:
                                                                            FlatButton(
                                                                          onPressed:
                                                                              () {},
                                                                          child: Text(
                                                                              'LLamar',
                                                                              style: new TextStyle(
                                                                                color: Colors.white,
                                                                                fontFamily: 'HankenGrotesk',
                                                                                fontSize: 12.0,
                                                                                fontWeight: FontWeight.w700,
                                                                              )),
                                                                        ),
                                                                      ),
                                                                    ],
                                                                  ),
                                                                ),
                                                              ),
                                                            ],
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                      Positioned(
                                          top: 600.0,
                                          left: 11.0,
                                          right: 11.0,
                                          child: SingleChildScrollView(
                                            child: Container(
                                                height: 110,
                                                color: Colors.green,
                                                child: StreamBuilder(
                                                  stream: Firestore.instance
                                                      .collection("client")
                                                      .snapshots(),
                                                  builder:
                                                      (BuildContext context,
                                                          AsyncSnapshot<
                                                                  QuerySnapshot>
                                                              snapshot) {
                                                    if (!snapshot.hasData) {
                                                      return Text(
                                                          "loading....");
                                                    } else {
                                                      if (snapshot
                                                              .data
                                                              .documents
                                                              .length ==
                                                          0) {
                                                      } else {
                                                        return Container(color: Colors.black,
                                                          child: ListView(
                                                            scrollDirection:
                                                                Axis.horizontal,
                                                            children: snapshot
                                                                .data.documents
                                                                .map(
                                                                    (document) {
                                                              return Row(
                                                                children: <
                                                                    Widget>[
                                                                  InkWell(
                                                                    onTap: () {
                                                                      Client
                                                                          taskname =
                                                                          Client(
                                                                        taskname:
                                                                            document['taskname'].toString(),
                                                                        taskclientimage:
                                                                            document['taskclientimage'].toString(),
                                                                        taskdescription:
                                                                            document['taskdescription'].toString(),
                                                                        taskphone:
                                                                            document['taskphone'].toString(),
                                                                        taskprice:
                                                                            document['taskprice'].toString(),
                                                                        tasklocation:
                                                                            document['tasklocation'].toString(),
                                                                        tasktime:
                                                                            document['tasktime'].toString(),
                                                                      );
                                                                    },
                                                                    child:
                                                                        Container(color: Colors.black,
                                                                      height:
                                                                          100.0,
                                                                      margin: EdgeInsets.only(
                                                                          right:
                                                                              20.0),
                                                                      child:
                                                                          Card(
                                                                        child:
                                                                            Padding(
                                                                          padding: EdgeInsets.symmetric(
                                                                              horizontal: 20.0,
                                                                              vertical: 10.0),
                                                                          child:
                                                                              Row(
                                                                            children: <Widget>[
                                                                              ClipRRect(
                                                                                borderRadius: BorderRadius.circular(10),
                                                                                child: FadeInImage(
                                                                                  fit: BoxFit.cover,
                                                                                  width: 95,
                                                                                  height: 95,
                                                                                  placeholder: AssetImage('assets/images/azucar.gif'),
                                                                                  image: NetworkImage(document["taskclientimage"]),
                                                                                ),
                                                                              ),
                                                                              // Column(
                                                                              //   mainAxisAlignment: MainAxisAlignment.center,
                                                                              //   children: <Widget>[
                                                                              //     // Text(
                                                                              //     //   document["taskname"].toString(),
                                                                              //     //   style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16.0),
                                                                              //     // ),
                                                                              //   ],
                                                                              // ),
                                                                            ],
                                                                          ),
                                                                        ),
                                                                      ),
                                                                    ),
                                                                  ),
                                                                ],
                                                              );
                                                            }).toList(),
                                                          ),
                                                        );
                                                      }
                                                    }
                                                  },
                                                )),
                                          ))
                                    ]))))
                      ]);
                    }).toList(),
                  ));
                }
              }
            }));
  }
}