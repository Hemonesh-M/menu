import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:menu/model/category_model.dart';
import 'package:menu/model/recommendation_model.dart';

// ignore: must_be_immutable
class HomePage extends StatelessWidget {
  HomePage({super.key});
  List<CategoryModel> categories = [];

  void _getcategories() {
    categories = CategoryModel.getCategories();
  }

  List<RecommendationModel> recommendations = [];

  void _getrecommendations() {
    recommendations = RecommendationModel.getrecommendations();
  }

  @override
  Widget build(BuildContext context) {
    _getcategories();
    _getrecommendations();
    return Scaffold(
      appBar: appBar(),
      backgroundColor: const Color.fromARGB(255, 239, 239, 237),
      body: Column(
        // crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          searchField(),
          const SizedBox(
            height: 10,
          ),
          _categorySection(),
          const SizedBox(
            height: 10,
          ),
          recommendSection()
        ],
      ),
    );
  }

  Column recommendSection() {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      const Padding(
        padding: EdgeInsets.only(left: 20.0),
        child: Text(
          'Recommendations \nFor Diet',
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.w800),
        ),
      ),
      const SizedBox(
        height: 10,
      ),
      Container(
        padding: const EdgeInsets.only(left: 5),
        height: 200,
        color: const Color.fromARGB(255, 239, 239, 237),
        child: ListView.separated(
            itemCount: recommendations.length,
            scrollDirection: Axis.horizontal,
            separatorBuilder: (context, index) => const SizedBox(width: 25),
            itemBuilder: (context, index) {
              return Container(
                // padding: const EdgeInsets.only(left: 50),

                width: 200,
                decoration: BoxDecoration(
                    color: recommendations[index].boxcolor.withOpacity(0.3),
                    borderRadius: BorderRadius.circular(20)),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      height: 100,
                      width: 100,
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        // color: Colors.white,
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(3.0),
                        child: SvgPicture.asset(recommendations[index].icon),
                      ),
                    ),
                    Text(
                      recommendations[index].name,
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 10.0),
                      child: Text(
                        '${recommendations[index].level} | ${recommendations[index].duration} | ${recommendations[index].cal}',
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    )
                  ],
                ),
              );
            }),
      )
    ]);
  }

  Column _categorySection() {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      const Padding(
        padding: EdgeInsets.only(left: 20.0),
        child: Text(
          'Category',
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.w800),
        ),
      ),
      const SizedBox(
        height: 10,
      ),
      Container(
        padding: const EdgeInsets.only(left: 5),
        height: 100,
        color: const Color.fromARGB(255, 239, 239, 237),
        child: ListView.separated(
            itemCount: categories.length,
            scrollDirection: Axis.horizontal,
            separatorBuilder: (context, index) => const SizedBox(width: 25),
            itemBuilder: (context, index) {
              return Container(
                // padding: const EdgeInsets.only(left: 50),
                width: 100,
                decoration: BoxDecoration(
                    color: categories[index].boxcolor.withOpacity(0.3),
                    borderRadius: BorderRadius.circular(20)),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Container(
                      height: 50,
                      width: 50,
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.white,
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(3.0),
                        child: SvgPicture.asset(categories[index].icon),
                      ),
                    ),
                    Text(
                      textAlign: TextAlign.center,
                      categories[index].name,
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    )
                  ],
                ),
              );
            }),
      )
    ]);
  }

  Container searchField() {
    return Container(
      margin: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: const Color.fromARGB(255, 238, 229, 229).withOpacity(0.11),
            blurRadius: 40,
            spreadRadius: 0.3,
          ),
        ],
      ),
      child: TextField(
        decoration: InputDecoration(
          hintText: 'Search Pancakes',
          hintStyle: const TextStyle(
              color: Color.fromARGB(255, 185, 182, 166), fontSize: 18),
          contentPadding: const EdgeInsets.all(20),
          prefixIcon: Padding(
            padding: const EdgeInsets.all(8.0),
            child: SvgPicture.asset(
              'assets/icons/Search.svg',
            ),
          ),
          suffixIcon: SizedBox(
            width: 100,
            child: IntrinsicHeight(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  const VerticalDivider(
                    indent: 10,
                    endIndent: 10,
                    color: Colors.black,
                    thickness: 0.3,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: SvgPicture.asset(
                      'assets/icons/Filter.svg',
                    ),
                  ),
                ],
              ),
            ),
          ),
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(20)),
        ),
      ),
    );
  }

  AppBar appBar() {
    return AppBar(
      title: const Text(
        'Breakfast',
        style: TextStyle(
            color: Color.fromARGB(255, 0, 0, 0),
            fontSize: 18,
            fontWeight: FontWeight.bold,
            fontStyle: FontStyle.normal),
      ),
      centerTitle: true,
      backgroundColor: const Color.fromARGB(137, 242, 237, 237),
      elevation: 0.0,
      leading: GestureDetector(
        onTap: () {},
        child: Container(
          alignment: Alignment.center,
          width: 40,
          margin: const EdgeInsets.all(10),
          decoration: BoxDecoration(
            color: const Color.fromARGB(255, 236, 229, 229),
            borderRadius: BorderRadius.circular(10),
          ),
          child: SvgPicture.asset(
            'assets/icons/Arrow - Left 2.svg',
            height: 30,
            width: 30,
          ),
        ),
      ),
      actions: [
        GestureDetector(
          onTap: () {},
          child: Container(
            alignment: Alignment.center,
            width: 40,
            margin: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: const Color.fromARGB(255, 236, 229, 229),
              borderRadius: BorderRadius.circular(10),
            ),
            child: SvgPicture.asset(
              'assets/icons/dots.svg',
              height: 10,
              width: 10,
            ),
          ),
        ),
      ],
    );
  }
}
