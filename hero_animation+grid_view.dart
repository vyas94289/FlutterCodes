class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final List<String> images;

  _MyHomePageState()
      : images = List<String>.generate(10, (i) => "assets/image${i + 1}.jpeg");

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
        ),
        body: newMethod());
  }

  Widget newMethod() {
    return GridView.builder(
      padding: const EdgeInsets.all(5),
      itemCount: images.length,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2, mainAxisSpacing: 5, crossAxisSpacing: 5),
      itemBuilder: (BuildContext context, int index) {
        return Hero(
          tag: images[index],
          child: GestureDetector(
            onTap: () {
              _navigateToDetails(context, images[index]);
            },
            child: AspectRatio(
                aspectRatio: 1,
                child: Image.asset(
                  images[index],
                  fit: BoxFit.cover,
                )),
          ),
        );
      },
    );
  }

  _navigateToDetails(BuildContext context, String image) {
    Navigator.push(
        context,
        PageRouteBuilder(
          transitionDuration: const Duration(milliseconds: 900),
          pageBuilder: (_, __, ___) => ImageDetails(imageUrl: image),
        ));
  }
}

class ImageDetails extends StatelessWidget {
  final String imageUrl;
  const ImageDetails({Key? key, required this.imageUrl}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(imageUrl),
        ),
        body: imageView());
  }

  Widget imageView() {
    return Hero(
      tag: imageUrl,
      child: Column(
        children: [Image.asset(imageUrl)],
      ),
    );
  }
}
