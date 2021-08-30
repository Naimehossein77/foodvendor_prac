import 'package:flutter/material.dart';
import 'package:foodvendor/Provider/opencloseBottomSheetProvider.dart';
import 'package:foodvendor/Widget/customText.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:path/path.dart';
import 'package:foodvendor/constants.dart';
import 'package:provider/provider.dart';

class OpenCloseBottomSheet extends StatefulWidget {
  OpenCloseBottomSheet({
    Key key,
    @required this.isBusy,
    @required this.isOpen,
    @required this.isClosed,
    @required this.onChanged,
  }) : super(key: key);
  final bool isOpen;
  final bool isBusy;
  final bool isClosed;
  final VoidCallback onChanged;

  @override
  _OpenCloseBottomSheetState createState() => _OpenCloseBottomSheetState();
}

class _OpenCloseBottomSheetState extends State<OpenCloseBottomSheet> {
  String title, subtitle;
  void initState() {
    if (widget.isBusy) {
      title = 'Your restaurant is in Busy';
      subtitle = 'Taking few orders';
    } else if (widget.isOpen) {
      title = 'Your restaurant is Open';
      subtitle = 'You are ready to take orders';
    } else if (widget.isClosed) {
      title = 'Your restaurant is Closed';
      subtitle = 'Your restaurant is closed for rest of the day';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: mheight(context) * .05),
      height: mheight(context) * .60,
      color: Colors.white,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        mainAxisSize: MainAxisSize.min,
        children: [
          Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              CustomText(
                text: title,
                size: 22,
                fontWeight: FontWeight.w500,
              ),
              SizedBox(
                height: 10,
              ),
              CustomText(
                text: subtitle,
                size: 12,
                fontWeight: FontWeight.normal,
                color: grey,
              ),
            ],
          ),
          Column(
            children: [
              if (!widget.isBusy)
                InkWell(
                  onTap: () {
                    Provider.of<OpenCloseRestaurant>(context, listen: false)
                        .changeStatus(true, false, false);
                    Navigator.pop(context);
                  },
                  child: Container(
                      height: mheight(context) * .10,
                      width: mwidth(context) * .95,
                      decoration: BoxDecoration(
                          color: white,
                          borderRadius: BorderRadius.circular(5),
                          boxShadow: [
                            BoxShadow(
                                blurRadius: 4,
                                color: grey[300],
                                offset: Offset(0, 4))
                          ]),
                      child: ListTile(
                        leading: Container(
                          alignment: Alignment.center,
                          height: 45,
                          width: 45,
                          decoration: BoxDecoration(
                              color: grey[100], shape: BoxShape.circle),
                          child: Icon(
                            Icons.timer,
                            color: yellow,
                            size: 35,
                          ),
                        ),
                        contentPadding:
                            EdgeInsets.only(left: 20, top: 0, bottom: 0),
                        title: CustomText(
                          text: 'Change to busy',
                        ),
                        subtitle: CustomText(
                          text: 'Get less orders for 30min',
                          size: 12,
                          color: grey[600],
                        ),
                      )),
                ),
              if (!widget.isBusy)
                SizedBox(
                  height: 10,
                ),
              if (!widget.isOpen)
                InkWell(
                  onTap: () {
                    Provider.of<OpenCloseRestaurant>(context, listen: false)
                        .changeStatus(false, true, false);
                    Navigator.pop(context);
                  },
                  child: Container(
                      height: mheight(context) * .10,
                      width: mwidth(context) * .95,
                      decoration: BoxDecoration(
                          color: white,
                          borderRadius: BorderRadius.circular(5),
                          boxShadow: [
                            BoxShadow(
                                blurRadius: 4,
                                color: grey[300],
                                offset: Offset(0, 4))
                          ]),
                      child: ListTile(
                        leading: Container(
                            alignment: Alignment.center,
                            height: 45,
                            width: 45,
                            decoration: BoxDecoration(
                                color: grey[100], shape: BoxShape.circle),
                            child: Container(
                              alignment: Alignment.center,
                              height: 30,
                              width: 30,
                              decoration: BoxDecoration(
                                  color: green, shape: BoxShape.circle),
                              // child: Icon(
                              //   Icons.open_in_full,
                              //   color: yellow,
                              //   size: 35,
                              // ),
                            )),
                        contentPadding:
                            EdgeInsets.only(left: 20, top: 0, bottom: 0),
                        title: CustomText(
                          text: 'Change to Open',
                        ),
                        subtitle: CustomText(
                          text: 'You will get orders only after opening',
                          size: 12,
                          color: grey[600],
                        ),
                      )),
                ),
              if (!widget.isOpen)
                SizedBox(
                  height: 10,
                ),
              if (!widget.isClosed)
                InkWell(
                  onTap: () {
                    Provider.of<OpenCloseRestaurant>(context, listen: false)
                        .changeStatus(false, false, true);
                    Navigator.pop(context);
                  },
                  child: Container(
                      height: mheight(context) * .10,
                      width: mwidth(context) * .95,
                      decoration: BoxDecoration(
                          color: white,
                          borderRadius: BorderRadius.circular(5),
                          boxShadow: [
                            BoxShadow(
                                blurRadius: 4,
                                color: grey[300],
                                offset: Offset(0, 4))
                          ]),
                      child: ListTile(
                        leading: Container(
                          alignment: Alignment.center,
                          height: 45,
                          width: 45,
                          decoration: BoxDecoration(
                              color: grey[100], shape: BoxShape.circle),
                          child: Icon(
                            Icons.cancel_outlined,
                            color: red,
                            size: 35,
                          ),
                        ),
                        contentPadding:
                            EdgeInsets.only(left: 20, top: 0, bottom: 0),
                        title: CustomText(
                          text: 'Close',
                        ),
                        subtitle: CustomText(
                          text: 'Close for the rest of the day',
                          size: 12,
                          color: grey[600],
                        ),
                      )),
                ),
            ],
          ),
        ],
      ),
    );
  }
}
