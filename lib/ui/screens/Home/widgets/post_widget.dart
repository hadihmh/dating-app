import 'package:flutter/material.dart';
import 'package:my_dating/domain/models/post_model.dart';

class PostWidget extends StatelessWidget {
  final dynamic item;
  const PostWidget({super.key, this.item});
  @override
  Widget build(BuildContext context) {
    var postList = PostModel.createDummyModel();
    return Container(
      margin: const EdgeInsets.all(5.0),
      child: ClipRRect(
          borderRadius: const BorderRadius.all(Radius.circular(25.0)),
          child: Stack(
            children: <Widget>[
              Image.asset(
                item.value,
                fit: BoxFit.cover,
                width: 1000.0,
                height: 800,
              ),
              Positioned(
                bottom: 0.0,
                left: 0.0,
                right: 0.0,
                child: Container(
                  decoration: const BoxDecoration(
                    gradient: LinearGradient(
                      colors: [
                        Color.fromARGB(200, 0, 0, 0),
                        Color.fromARGB(0, 0, 0, 0)
                      ],
                      begin: Alignment.bottomCenter,
                      end: Alignment.topCenter,
                    ),
                  ),
                  padding: const EdgeInsets.symmetric(
                      vertical: 10.0, horizontal: 20.0),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Column(
                            mainAxisSize: MainAxisSize.min,
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                padding: const EdgeInsets.all(5),
                                decoration: const BoxDecoration(
                                    color: Colors.black,
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(20))),
                                child: Row(
                                  mainAxisSize: MainAxisSize.min,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    const Icon(
                                      Icons.star,
                                      color: Color(0xff3A3A3A),
                                      size: 20,
                                    ),
                                    Text(
                                      postList.likes,
                                      style: const TextStyle(
                                          color: Color(0xffFCFCFC),
                                          fontSize: 12),
                                    ),
                                  ],
                                ),
                              ),
                              Text(
                                postList.name + postList.age.toString(),
                                style: const TextStyle(
                                    color: Color(0xffFCFCFC), fontSize: 28),
                              ),
                              if (item.key == 0)
                                Text(
                                  postList.distance,
                                  style: const TextStyle(
                                      color: Color(0xffD9D9D9), fontSize: 15),
                                ),
                              if (item.key == 1)
                                Container(
                                  width: 250,
                                  child: Text(
                                    postList.description,
                                    maxLines: 4,
                                    style: const TextStyle(
                                        color: Color(0xffD9D9D9), fontSize: 15),
                                  ),
                                ),
                              if (item.key == 2)
                                Container(
                                  width: 200,
                                  child: Wrap(
                                    children: <Widget>[
                                      ...postList.interest
                                          .map(
                                            (e) => Container(
                                              padding: const EdgeInsets.all(8),
                                              margin: const EdgeInsets.all(2),
                                              decoration: const BoxDecoration(
                                                  color: Colors.black,
                                                  borderRadius:
                                                      BorderRadius.all(
                                                          Radius.circular(20))),
                                              child: Row(
                                                mainAxisSize: MainAxisSize.min,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.center,
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                children: [
                                                  Text(
                                                    e,
                                                    style: const TextStyle(
                                                        color:
                                                            Color(0xffFCFCFC),
                                                        fontSize: 12),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          )
                                          .toList()
                                    ],
                                  ),
                                )
                            ],
                          ),
                          Image.asset("assets/images/btcon_48.png")
                        ],
                      ),
                      const RotationTransition(
                          turns: AlwaysStoppedAnimation(270 / 360),
                          child: Icon(
                            Icons.arrow_back_ios_new,
                            color: Colors.white,
                            size: 18,
                          ))
                    ],
                  ),
                ),
              ),
            ],
          )),
    );
  }
}
