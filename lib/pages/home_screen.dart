import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:katering_ku/style/style.dart';
import 'package:sticky_headers/sticky_headers.dart';

import 'package:katering_ku/models/kuliner_model.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<KulinerModel> kuliners = [];

  @override
  Widget build(BuildContext context) {
    // get kuliners list
    kuliners = KulinerModel.getKuliner();

    return Scaffold(
      body: ListView(
        children: [
          UserInfo(),
          Container(
            child: StickyHeader(
              header: SearchComponent(),
              content: MainContent(),
            ),
          )
        ],
      ),
    );
  }
}

class MainContent extends StatelessWidget {
  const MainContent({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    var sectionTitle = "Section Title";
    var sectionSubTitle = "Section Sub Title";
    var kuliners = KulinerModel.getKuliner();
    return Column(
      // mainAxisSize: MainAxisSize.min,
      children: [
        SectionComponent(
          sectionTitle: sectionTitle,
          sectionSubTitle: sectionSubTitle,
          kuliners: kuliners,
        ),
        SectionComponent(
          sectionTitle: "Rekomendasi",
          sectionSubTitle: sectionSubTitle,
          kuliners: kuliners,
        )
      ],
    );
  }
}

class SectionComponent extends StatelessWidget {
  const SectionComponent({
    super.key,
    required this.sectionTitle,
    required this.sectionSubTitle,
    required this.kuliners,
  });

  final String sectionTitle;
  final String sectionSubTitle;
  final List<KulinerModel> kuliners;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Padding(
          padding: const EdgeInsets.all(16),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(sectionTitle),
                  Text(sectionSubTitle),
                ],
              ),
              Text("Lihat Semua"),
            ],
          ),
        ),
        SizedBox(
          child: ListView.separated(
            shrinkWrap: true,
            scrollDirection: Axis.horizontal,
            padding: EdgeInsets.all(16),
            itemCount: kuliners.length,
            separatorBuilder: (context, index) => SizedBox(width: 20),
            itemBuilder: (context, index) {
              return Wrap(
                crossAxisAlignment: WrapCrossAlignment.center,
                direction: Axis.vertical,
                spacing: 20,
                children: [
                  Container(
                    width: 80,
                    padding: EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      color: Colors.black,
                      borderRadius: BorderRadius.all(
                        Radius.circular(100),
                      ),
                    ),
                    child: Image.asset(
                      kuliners[index].image,
                    ),
                  ),
                  Text(kuliners[index].name),
                ],
              );
            },
          ),
        )
      ],
    );
  }
}

class UserInfo extends StatelessWidget {
  const UserInfo({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      height: 100,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('Halo, Taufik'),
              Text('scbd jakarta selatan'),
            ],
          ),
          Container(
            decoration: BoxDecoration(
              color: Colors.black,
              border: Border.all(
                color: Colors.black38,
                width: 2,
                strokeAlign: BorderSide.strokeAlignOutside,
              ),
              borderRadius: BorderRadius.all(
                Radius.circular(10),
              ),
            ),
            child: Image.asset(
              "images/kuliner/Jawakuliner.png",
              width: 50,
            ),
          )
        ],
      ),
    );
  }
}

class SearchComponent extends StatelessWidget {
  const SearchComponent({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      // constraints: BoxConstraints(maxHeight: ),
      padding: EdgeInsets.all(16),
      color: Style.backgroundColor,
      child: Wrap(
        crossAxisAlignment: WrapCrossAlignment.start,
        runSpacing: 5,
        children: [
          Component.headerText("Mau makan apa hari ini?"),
          Row(
            children: [
              Expanded(
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    boxShadow: [Style.boxShadow],
                    borderRadius: Style.borderRadius,
                  ),
                  child: const TextField(
                    decoration: InputDecoration(
                      contentPadding: EdgeInsets.all(16),
                      border: InputBorder.none,
                      hintText: "Cari restoran atau makanan",
                      prefixIcon: Icon(
                        FontAwesomeIcons.magnifyingGlass,
                        size: 16,
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(
                width: 10,
              ),
              Container(
                width: 50,
                height: 50,
                decoration: BoxDecoration(
                  color: Colors.white,
                  boxShadow: [Style.boxShadow],
                  borderRadius: Style.borderRadius,
                ),
                child: RawMaterialButton(
                  onPressed: () => {},
                  child: FaIcon(
                    FontAwesomeIcons.sliders,
                    size: 16,
                  ),
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}
