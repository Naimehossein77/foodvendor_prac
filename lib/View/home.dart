import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:foodvendor/Provider/opencloseBottomSheetProvider.dart';
import 'package:foodvendor/View/myDrawer.dart';
import 'package:foodvendor/Widget/customButton.dart';
import 'package:foodvendor/Widget/customText.dart';
import 'package:foodvendor/Widget/openCloseBottomSheet.dart';
import 'package:foodvendor/constants.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:provider/provider.dart';

class Home extends StatefulWidget {
  Home({Key key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  bool isOpen = true;

  bool isBusy = false;

  bool isClosed = false;

  void onChanged() {}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Vendor App'),
        backgroundColor: appbarColor,
        iconTheme: IconThemeData(color: appbarIconsPrimaryColor),
        actions: [
          Align(
              alignment: Alignment.center,
              child: Padding(
                padding: const EdgeInsets.only(right: 8.0),
                child: Container(
                    width: mwidth(context) * .30,
                    height: mheight(context) * .06,
                    // padding: EdgeInsets.all(5),
                    child: Container(
                      decoration: BoxDecoration(
                          boxShadow: [
                            BoxShadow(
                                color: grey[100],
                                blurRadius: 1,
                                offset: Offset(0, 0)),
                          ],
                          borderRadius: BorderRadius.circular(5),
                          border: Border.all(width: 0)),
                      child: CustomButton(
                          color: Colors.white,
                          radius: 5.0,
                          child: Consumer<OpenCloseRestaurant>(
                            builder: (context, snapshot, c) {
                              isBusy = snapshot.isBusy;
                              isOpen = snapshot.isOpen;
                              isClosed = snapshot.isClosed;
                              return snapshot.isBusy
                                  ? Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceAround,
                                      children: [
                                          Container(
                                              height: 20,
                                              width: 20,
                                              decoration: BoxDecoration(
                                                  color: yellow,
                                                  shape: BoxShape.circle),
                                              child: Icon(
                                                Icons.timer_outlined,
                                                size: 14,
                                              )),
                                          CustomText(text: 'Busy')
                                        ])
                                  : snapshot.isOpen
                                      ? Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceAround,
                                          children: [
                                              Container(
                                                height: 20,
                                                width: 20,
                                                decoration: BoxDecoration(
                                                    color: green,
                                                    shape: BoxShape.circle),
                                              ),
                                              CustomText(text: 'Open')
                                            ])
                                      : Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceAround,
                                          children: [
                                              Container(
                                                height: 20,
                                                width: 20,
                                                decoration: BoxDecoration(
                                                    color: red,
                                                    shape: BoxShape.circle),
                                              ),
                                              CustomText(text: 'Closed')
                                            ]);
                            },
                          ),
                          onPressed: () {
                            showMaterialModalBottomSheet(
                              context: context,
                              builder: (context) {
                                return SingleChildScrollView(
                                    controller:
                                        ModalScrollController.of(context),
                                    child: OpenCloseBottomSheet(
                                      isBusy: isBusy,
                                      isOpen: isOpen,
                                      isClosed: isClosed,
                                      onChanged: () {},
                                    ));
                              },
                            );
                          }),
                    )),
              )),
        ],
      ),
      drawer: MyDrawer(),
    );
  }
}
