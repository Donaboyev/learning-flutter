import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFFFFFFFF),
        elevation: 0.0,
        leading: IconButton(
            icon: Icon(Icons.arrow_back_ios_rounded, size: 20),
            onPressed: () {}),
        title: Text(
          'Вывод денег',
          style: TextStyle(
              color: Color(0xFF000000),
              fontSize: 17,
              fontWeight: FontWeight.w600),
        ),
        centerTitle: true,
      ),
      body: SafeArea(
        child: ListView(
          physics: BouncingScrollPhysics(),
          children: [
            Container(
              margin: EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: Color(0xFFFFFFFF),
                borderRadius: BorderRadius.circular(12),
              ),
              child: AutoFullWidget(
                title: 'Автоматическое пополнение',
                image: 'assets/svg/ic_icon1.svg',
                onChanged: (value) {
                  print('value: $value');
                },
              ),
            ),
            Container(
              margin: EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: Color(0xFFFFFFFF),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Column(
                children: [
                  HeaderWidget(
                    title: 'Выберите, куда вы хотите перевести баллы',
                  ),
                  CustomDivider(),
                  ListTileWithDescWidget(
                    title: 'На баланс мобильного телефона',
                    description: '998 99 123-45-67',
                    image: 'assets/svg/ic_icon1.svg',
                    onTap: () {},
                  ),
                  CustomDivider(),
                  ListTileWidget(
                    title: 'Счета',
                    image: 'assets/svg/ic_icon2.svg',
                    onTap: () {},
                  ),
                  CustomDivider(),
                  ListTileWidget(
                    title: 'Настройки',
                    image: 'assets/svg/ic_icon3.svg',
                    onTap: () {},
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ListTileWidget extends StatelessWidget {
  const ListTileWidget({
    Key key,
    this.image,
    this.title,
    this.onTap,
  }) : super(key: key);
  final String image;
  final String title;
  final Function onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 12),
        child: Row(
          children: [
            SvgPicture.asset(
              image,
              height: 32,
              width: 32,
            ),
            SizedBox(
              width: 12,
            ),
            Expanded(
              child: Text(
                title,
                style: TextStyle(
                  color: Color(0xFF000000),
                  fontSize: 17,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
            Icon(
              Icons.arrow_forward_ios,
              size: 14,
              color: Color(0xFFB8B8B8),
            )
          ],
        ),
      ),
    );
  }
}

class ListTileWithDescWidget extends StatelessWidget {
  const ListTileWithDescWidget({
    Key key,
    this.image,
    this.title,
    this.description,
    this.onTap,
  }) : super(key: key);
  final String image;
  final String title;
  final String description;
  final Function onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 12),
        child: Row(
          children: [
            SvgPicture.asset(
              image,
              height: 32,
              width: 32,
            ),
            SizedBox(
              width: 12,
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: TextStyle(
                      color: Color(0xFF000000),
                      fontSize: 17,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  Text(
                    description,
                    style: TextStyle(
                      color: Color(0xFF000000).withOpacity(0.58),
                      fontSize: 13,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
            ),
            Icon(
              Icons.arrow_forward_ios,
              size: 14,
              color: Color(0xFFB8B8B8),
            )
          ],
        ),
      ),
    );
  }
}

class HeaderWidget extends StatelessWidget {
  const HeaderWidget({
    Key key,
    this.title,
  }) : super(key: key);
  final String title;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 12),
        child: Row(
          children: [
            Expanded(
              child: Text(
                title,
                style: TextStyle(
                  color: Color(0xFF929292),
                  fontSize: 15,
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

class AutoFullWidget extends StatelessWidget {
  const AutoFullWidget({
    Key key,
    this.image,
    this.title,
    this.onChanged,
  }) : super(key: key);
  final String image;
  final String title;
  final Function onChanged;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 12),
        child: Row(
          children: [
            SvgPicture.asset(
              image,
              height: 32,
              width: 32,
            ),
            SizedBox(
              width: 12,
            ),
            Expanded(
              child: Text(
                title,
                style: TextStyle(
                  color: Color(0xFF000000),
                  fontSize: 17,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
            Transform.scale(
              scale: 0.7,
              child: CupertinoSwitch(
                activeColor: Color(0xFF524894),
                value: true,
                onChanged: onChanged,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class CustomDivider extends StatelessWidget {
  const CustomDivider({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 56, right: 4),
      child: Divider(
        color: Color(0xFFB8B8B8),
        height: 0.4,
      ),
    );
  }
}
