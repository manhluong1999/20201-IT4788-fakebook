import 'package:cached_network_image/cached_network_image.dart';
import 'package:facebook/Screens/Post/post_detail.dart';
import 'package:facebook/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:facebook/data/models/user_notification.dart';
import 'package:timeago/timeago.dart' as timeago;

class NotificationWidget extends StatelessWidget {
  final UserNotification notification;

  NotificationWidget({this.notification});

  @override
  Widget build(BuildContext context) {
    timeago.setLocaleMessages('vi', timeago.ViShortMessages());
    return Container(
      width: MediaQuery.of(context).size.width,
      height: 100.0,
      padding: EdgeInsets.symmetric(horizontal: 5.0),
      child: InkWell(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Padding(
              padding: EdgeInsets.all(3.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  Stack(
                    children: [
                      CircleAvatar(
                        radius: 29.0,
                        backgroundImage:
                            CachedNetworkImageProvider(notification.imageUrl),
                      ),
                      Positioned(
                        top: 32,
                        left: 32,
                        child: notification.category == 'like'
                            ? Container(
                                width: 25,
                                height: 25,
                                padding: const EdgeInsets.all(4.0),
                                decoration: BoxDecoration(
                                  color: kPrimaryColor,
                                  shape: BoxShape.circle,
                                ),
                                child: const Icon(
                                  Icons.thumb_up,
                                  size: 17.0,
                                  color: Colors.white,
                                ),
                              )
                            : notification.category == 'comment'
                                ? Container(
                                    width: 25,
                                    height: 25,
                                    padding: const EdgeInsets.all(2.0),
                                    decoration: BoxDecoration(
                                      color: kGreenComment,
                                      shape: BoxShape.circle,
                                    ),
                                    child: const Icon(
                                      Icons.comment,
                                      size: 17.0,
                                      color: Colors.white,
                                    ),
                                  )
                                : notification.category == 'friend'
                                    ?
                                    // Container(
                                    //   width: 20,
                                    //   height: 20,
                                    //   decoration: BoxDecoration(
                                    //       color: kBlack,
                                    //       shape: BoxShape.circle,
                                    //       border:
                                    //       Border.all(color: kBlack, width: 3)),
                                    // ),
                                    // Container(
                                    //   width: 20,
                                    //   height: 20,
                                    //   padding: const EdgeInsets.all(4.0),
                                    //   decoration: BoxDecoration(
                                    //     color: kPrimaryColor,
                                    //     shape: BoxShape.circle,
                                    //   ),
                                    //   child: const Icon(
                                    //     Icons.thumb_up,
                                    //     size: 10.0,
                                    //     color: Colors.white,
                                    //   ),
                                    // ),
                                    // Container(
                                    //   width: 25,
                                    //   height: 25,
                                    //   padding: const EdgeInsets.all(2.0),
                                    //   decoration: BoxDecoration(
                                    //     color: kPrimaryColor,
                                    //     shape: BoxShape.circle,
                                    //   ),
                                    //   child: const Icon(
                                    //     Icons.person,
                                    //     size: 20.0,
                                    //     color: Colors.white,
                                    //   ),
                                    // ),
                                    Container(
                                        width: 25,
                                        height: 25,
                                        padding: const EdgeInsets.all(2.0),
                                        decoration: BoxDecoration(
                                          color: kPrimaryColor,
                                          shape: BoxShape.circle,
                                        ),
                                        child: const Icon(
                                          Icons.person_add,
                                          size: 20.0,
                                          color: Colors.white,
                                        ),
                                      )
                                    : Container(
                                        width: 25,
                                        height: 25,
                                        padding: const EdgeInsets.all(4.0),
                                        decoration: BoxDecoration(
                                          color: kPrimaryColor,
                                          shape: BoxShape.circle,
                                        ),
                                        child: const Icon(
                                          Icons.thumb_up,
                                          size: 17.0,
                                          color: Colors.white,
                                        ),
                                      ),
                      ),
                    ],
                  ),
                  SizedBox(width: 15.0),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      InkWell(
                        child: Container(
                          child: Flexible(
                            child: Text(notification.content,
                                style: TextStyle(fontSize: 16.0),
                                overflow: TextOverflow.visible),
                            // children: [
                            //   Text(notification.username,
                            //     style: TextStyle(
                            //         fontSize: 17.0, fontWeight: FontWeight.bold), overflow: TextOverflow.visible,),
                            //   Text(notification.content,
                            //       style: TextStyle(fontSize: 16.0), overflow: TextOverflow.visible),
                            // ],
                          ),
                          width: MediaQuery.of(context).size.width * 0.6,
                        ),
                      ),
                      // Text(notification.content,
                      //     style: TextStyle(
                      //         fontSize: 17.0, fontWeight: FontWeight.bold)),
                      Text(
                          '${timeago.format(DateTime.parse(notification.time), locale: 'vi')}',
                          style: TextStyle(fontSize: 15.0, color: Colors.grey)),
                    ],
                  ),
                ],
              ),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                Icon(Icons.more_horiz),
                Text(''),
              ],
            )
          ],
        ),
        onTap: () {
          Navigator.push(context, MaterialPageRoute(builder: (_) {
            return PostDetail(
                postId: notification.postId,
                );
          }));
        },
      ),
    );
  }
}
