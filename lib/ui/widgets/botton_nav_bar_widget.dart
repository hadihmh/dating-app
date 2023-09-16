import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class BottonNavBarWidget extends StatelessWidget {
  const BottonNavBarWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      decoration: const BoxDecoration(
          color: Colors.black,
          border: Border(
              top: BorderSide(width: 2, color: Color(0xff3A3A3A)),
              left: BorderSide(width: 0, color: Color(0xff3A3A3A)),
              right: BorderSide(width: 0, color: Color(0xff3A3A3A)),
              bottom: BorderSide(width: 0, color: Color(0xff3A3A3A))),
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(10), topRight: Radius.circular(10))),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 18.0),
        child: Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset("assets/images/ic_GNB.png"),
                const Text(
                  "홈",
                  style: TextStyle(fontSize: 12, color: Color(0xffFF0E73)),
                )
              ],
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset("assets/images/Ikon.png"),
                const Text(
                  "스팟",
                  style: TextStyle(fontSize: 12, color: Color(0xff3A3A3A)),
                )
              ],
            ),
            Transform.translate(
                offset: const Offset(0, -15),
                child: Container(
                    height: 45,
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: const Color(0xff3A3A3A),
                        width: 2,
                      ),
                      shape: BoxShape.circle,
                    ),
                    child: SvgPicture.asset(
                      "assets/images/ic_GNB_like.svg",
                    ))),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset("assets/images/ic_GNB (1).png"),
                const Text(
                  "채팅",
                  style: TextStyle(fontSize: 12, color: Color(0xff3A3A3A)),
                )
              ],
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset("assets/images/Group.png"),
                const Text(
                  "마이",
                  style: TextStyle(fontSize: 12, color: Color(0xff3A3A3A)),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
