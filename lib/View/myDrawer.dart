import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';
import 'package:foodvendor/Provider/currentPageProvider.dart';
import 'package:foodvendor/Widget/customText.dart';
import 'package:foodvendor/constants.dart';
import 'package:provider/provider.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final mwidth = MediaQuery.of(context).size.width;
    final mheight = MediaQuery.of(context).size.height;
    return Drawer(
      child: Padding(
        padding: const EdgeInsets.only(left: 0.0),
        child: ListView(
          children: [
            ////////APP ICON AND NAME////////////////////////
            Container(
              alignment: Alignment.center,
              padding: EdgeInsets.only(left: 15.0),
              color: blue,
              height: 100,
              child: CustomText(
                text: 'AppIcon and Name',
                size: 20,
              ),
            ),
            Container(
              padding: EdgeInsets.only(left: 15.0),
              child: CustomText(
                text: 'CR 7 Cafe',
                size: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(
              height: 30,
            ),
            InkWell(
              onTap: () {
                context.read<CurrentPage>().changeCurrentPage(0);
                Navigator.pop(context);
              },
              child: Container(
                padding: EdgeInsets.only(left: 15.0),
                height: mheight * .07,
                alignment: Alignment.centerLeft,
                child: CustomText(
                  text: 'Orders Overview',
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
            InkWell(
              onTap: () {},
              child: Container(
                padding: EdgeInsets.only(left: 15.0),
                height: mheight * .07,
                alignment: Alignment.centerLeft,
                child: CustomText(
                  text: 'Recent Orders',
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
            InkWell(
              onTap: () {},
              child: Container(
                padding: EdgeInsets.only(left: 15.0),
                height: mheight * .07,
                alignment: Alignment.centerLeft,
                child: CustomText(
                  text: 'Performance',
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
            InkWell(
              onTap: () {},
              child: Stack(
                children: [
                  Container(
                    padding: EdgeInsets.only(left: 15.0),
                    height: mheight * .07,
                    alignment: Alignment.centerLeft,
                    child: CustomText(
                      text: 'Menu',
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  Positioned(
                      top: 0,
                      bottom: 0,
                      left: -2,
                      child: Container(
                        height: 10,
                        width: 10,
                        color: appsPrimaryColor,
                      ))
                ],
              ),
            ),
            ////////EXPANDABLE DROPDOWN//////////////////////////
            ExpandablePanel(
              header: Container(
                padding: EdgeInsets.only(left: 15.0),
                height: mheight * .07,
                alignment: Alignment.centerLeft,
                child: CustomText(
                  text: 'Request a rider',
                  fontWeight: FontWeight.w500,
                ),
              ),
              collapsed: Container(),
              /////////////ON EXPANDED////////////////
              expanded: Column(
                children: [
                  InkWell(
                    onTap: () {},
                    child: Container(
                      padding: EdgeInsets.only(left: mwidth * .15),
                      height: mheight * .07,
                      alignment: Alignment.centerLeft,
                      child: CustomText(
                        text: 'New Request',
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: () {},
                    child: Container(
                      padding: EdgeInsets.only(left: mwidth * .15),
                      height: mheight * .07,
                      alignment: Alignment.centerLeft,
                      child: CustomText(
                        text: 'Order Tracking',
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ],
              ),
            ),
///////////////INBOX//////////////////////////////
            InkWell(
              onTap: () {},
              child: Container(
                padding: EdgeInsets.only(left: 15.0, right: 15),
                height: mheight * .07,
                alignment: Alignment.centerLeft,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    CustomText(
                      text: 'Inbox',
                      fontWeight: FontWeight.w500,
                    ),
                    Container(
                      height: 25,
                      width: 25,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          color: appsPrimaryColor),
                      child: CustomText(
                        text: '14',
                        color: white,
                        size: 12,
                      ),
                    )
                  ],
                ),
              ),
            ),
            InkWell(
              onTap: () {},
              child: Container(
                padding: EdgeInsets.only(left: 15.0),
                height: mheight * .07,
                alignment: Alignment.centerLeft,
                child: CustomText(
                  text: 'Send Test Order',
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
