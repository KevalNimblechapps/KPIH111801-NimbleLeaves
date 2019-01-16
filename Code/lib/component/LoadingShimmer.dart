import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

const kShrineBrown900 = const Color.fromRGBO(78, 125, 254, 1);
const inactive = const Color.fromRGBO(119, 140, 161, 1);
const inactivelight = const Color.fromRGBO(119, 140, 161, 0.5);
const active = const Color.fromRGBO(78, 125, 254, 1);
const bordergrey = const Color.fromRGBO(151, 151, 151, 0.5);

class LoadingShimmer extends StatelessWidget {
  Widget build(BuildContext context) {
    List<Widget> cards = new List.generate(2, (i) => new CustomCard());
    List<Widget> cardipad = new List.generate(2, (i) => new CustomCardipad());
    return Center(
      child: Container(
          width: double.infinity,
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 16.0),
          child: MediaQuery.of(context).size.width <= 767
              ? Column(children: cards)
              : Column(
                  children: cardipad,
                )),
    );
  }
}

class CustomCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Shimmer.fromColors(
        baseColor: inactivelight,
        highlightColor: Colors.white70,
        child: Container(
            margin: EdgeInsets.only(bottom: 20),
            padding: EdgeInsets.only(right: 10, left: 0, top: 10),
            decoration: new BoxDecoration(
              border: new Border.all(color: bordergrey, width: 1),
              borderRadius: BorderRadius.circular(5),
            ),
            child: Padding(
              padding: const EdgeInsets.only(bottom: 8.0),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Container(
                  //   width: 48.0,
                  //   height: 48.0,
                  //   color: Colors.white,
                  // ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  ),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: <Widget>[
                                Container(
                                    width: 30.0,
                                    height: 15.0,
                                    margin: EdgeInsets.only(bottom: 2.0),
                                    decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius:
                                            BorderRadius.circular(5))),
                                Padding(
                                  padding:
                                      const EdgeInsets.symmetric(vertical: 1.0),
                                ),
                                Container(
                                  width: 130.0,
                                  height: 15.0,
                                  decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(3)),
                                  margin: EdgeInsets.only(bottom: 5.0),
                                ),
                                Padding(
                                  padding:
                                      const EdgeInsets.symmetric(vertical: 2.0),
                                ),
                                Container(
                                  width: 220.0,
                                  height: 15.0,
                                  decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(3)),
                                  margin: EdgeInsets.only(bottom: 5.0),
                                ),
                                Padding(
                                  padding:
                                      const EdgeInsets.symmetric(vertical: 2.0),
                                ),
                                Container(
                                  width: 130,
                                  height: 15.0,
                                  decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(3)),
                                  margin: EdgeInsets.only(bottom: 5.0),
                                ),
                                Padding(
                                  padding:
                                      const EdgeInsets.symmetric(vertical: 2.0),
                                ),
                                Container(
                                  width: 100,
                                  height: 15.0,
                                  decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(3)),
                                  margin: EdgeInsets.only(bottom: 5.0),
                                ),
                                Padding(
                                  padding:
                                      const EdgeInsets.symmetric(vertical: 2.0),
                                ),
                                Container(
                                  width: 130,
                                  height: 15.0,
                                  decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(3)),
                                ),
                              ],
                            ),
                            new Row(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: <Widget>[
                                // Text('jfnjkdfk'),
                                Padding(
                                  padding:
                                      const EdgeInsets.symmetric(vertical: 2.0),
                                ),
                                Container(
                                  width: 25.0,
                                  height: 15.0,
                                  decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(3)),
                                  margin: EdgeInsets.only(bottom: 5.0),
                                ),
                                Padding(
                                  padding:
                                      const EdgeInsets.symmetric(vertical: 2.0),
                                ),
                                Container(
                                  width: 25,
                                  height: 15.0,
                                  decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(3)),
                                  margin: EdgeInsets.only(bottom: 5.0, left: 5),
                                ),
                              ],
                            )
                          ],
                        )
                      ],
                    ),
                  )
                ],
              ),
            )));
  }
}

class CustomCardipad extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width - 30;
    return new Shimmer.fromColors(
        baseColor: inactivelight,
        highlightColor: Colors.white70,
        child: new Container(
            width: MediaQuery.of(context).size.width - 30,
            margin: EdgeInsets.only(bottom: 20),
            padding: EdgeInsets.only(left: 15, right: 0),
            decoration: new BoxDecoration(
              border: new Border.all(color: bordergrey, width: 1),
              borderRadius: BorderRadius.circular(5),
            ),
            child: Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Expanded(
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Container(
                        child: Container(
                      height: 15,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(5)),
                      width: width >= 768 && width <= 1023
                          ? width * 0.075
                          : width * 0.095,
                    )),
                    Container(
                        width: 150,
                        alignment: AlignmentDirectional.centerStart,
                        height: 48,
                        padding: EdgeInsets.only(right: 15, left: 15),
                        child: Container(
                          height: 15,
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(5)),
                          width: width >= 768 && width <= 1023
                              ? width * 0.18
                              : width * 0.18,
                        )),
                    Container(
                        width: width >= 768 && width <= 1023
                            ? width * 0.22
                            : width * 0.27,
                        alignment: AlignmentDirectional.centerStart,
                        height: 48,
                        padding: EdgeInsets.only(right: 15, left: 15),
                        child: Container(
                          height: 15,
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(5)),
                          width: 150,
                        )),
                    Container(
                        alignment: AlignmentDirectional.centerStart,
                        height: 48,
                        width: width >= 768 && width <= 1023
                            ? width * 0.13
                            : width * 0.14,
                        padding: EdgeInsets.only(right: 15, left: 15),
                        child: Container(
                          height: 15,
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(5)),
                          width: 50,
                        )),
                    MediaQuery.of(context).size.width >= 1024
                        ? Container(
                            width: width * 0.13,
                            height: 15.0,
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(3)),
                            margin: EdgeInsets.only(bottom: 5.0),
                          )
                        : Container(height: 0, width: 0),
                    Container(
                        alignment: AlignmentDirectional.centerStart,
                        height: 48,
                        width: width >= 768 && width <= 1023
                            ? width * 0.13
                            : width * 0.15,
                        padding: EdgeInsets.only(right: 15, left: 15),
                        child: Container(
                          height: 15,
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(5)),
                          width: 50,
                        )),
                    Container(
                        alignment: AlignmentDirectional.centerStart,
                        height: 48,
                        width: width >= 768 && width <= 1023
                            ? width * 0.11
                            : width * 0.11,
                        padding: EdgeInsets.only(right: 15, left: 15),
                        child: Row(
                          children: <Widget>[
                            Container(
                                margin: EdgeInsets.only(right: 10),
                                height: 15,
                                width: 15,
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(5))),
                            Container(
                                height: 15,
                                width: 15,
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(5)))
                          ],
                        )),
                  ],
                ),
              )
            ])));
  }
}
