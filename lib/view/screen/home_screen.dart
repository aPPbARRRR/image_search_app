// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:search_pics_prac_app/domain/image_item.dart';
import 'package:search_pics_prac_app/view/controller/view_controller.dart';

import '../../data/data_source/pixabay_image_repository_impl.dart';
import '../widget/custom_text_field.dart';
import '../widget/image_container.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final ViewController viewController =
      ViewController(repository: PixabayImageRepositoryImpl());
  final TextEditingController textController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.orange,
            toolbarHeight: 120,
            title: Padding(
              padding: const EdgeInsets.all(15.0),
              child: CustomTextField(
                  textController: textController,
                  viewController: viewController,
                  label: '검색어를 입력해주세요',
                  onButtonTapped: () async {
                    await viewController.fetchItems(
                        searchText: textController.text);
                    setState(() {});
                  }),
            ),
          ),
          body: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Container(
              child: GridView.builder(
                  itemCount: viewController.items.length,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      mainAxisSpacing: 20,
                      crossAxisSpacing: 20,
                      crossAxisCount: 2),
                  itemBuilder: (context, index) {
                    return InkWell(
                      onTap: () => Navigator.of(context).push(MaterialPageRoute(
                        
                          builder: (context) => ImageDetail(
                              imageItem: viewController.items[index]))),
                      child: ImageContainer(
                        item: viewController.items[index],
                      ),
                    );
                  }),
            ),
          )),
    );
  }
}

class ImageDetail extends StatelessWidget {
  final ImageItem imageItem;

  const ImageDetail({super.key, required this.imageItem});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: GestureDetector(
              child: Hero(
                tag: imageItem.id,
                child: Image.network(imageItem.largeImageURL,
                    fit: BoxFit.fitWidth),
              ),
              onTap: () {
                Navigator.pop(context);
              },
            ),
          )
        ],
      ),
    );
  }
}
