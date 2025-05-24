import 'package:flutter/material.dart';

import '../../../../core/theme/app_colors.dart';

class HomeCategories extends StatelessWidget {
  const HomeCategories({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final ScrollController scrollController = ScrollController();
    return SliverToBoxAdapter(
      child: Column(
        children: [
          Container(
            width: double.infinity,
            height: 280,
            margin: EdgeInsets.symmetric(horizontal: 16),
            alignment: Alignment.bottomCenter,

            child: GridView.builder(
              controller: scrollController,
              scrollDirection: Axis.horizontal,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisExtent: 90,
              ),
              itemCount: 20,
              itemBuilder: (context, index) {
                return InkWell(
                  onTap: () {},
                  child: Column(
                    children: [
                      ClipOval(
                        child: Container(
                          width: 70,
                          height: 70,
                          color: theme.colorScheme.secondary,
                        ),
                      ),
                      const SizedBox(height: 4),
                      Expanded(
                        child: Text(
                          'Category ${index + 1}\nTest',
                          textAlign: TextAlign.center,
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          style: theme.textTheme.labelSmall!.copyWith(
                            fontWeight: FontWeight.w600,
                            color: theme.colorScheme.onSurface,
                          ),
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
          ScrollIndicator(
            scrollController: scrollController,
            width: 50,
            height: 5,
            indicatorWidth: 20,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Colors.grey[300],
            ),
            indicatorDecoration: BoxDecoration(
              color: AppColors.primaryColor,
              borderRadius: BorderRadius.circular(10),
            ),
          ),
        ],
      ),
    );
  }
}

class ScrollIndicator extends StatefulWidget {
  ///scrollController listview/gridview
  ///
  final ScrollController scrollController;
  final double width, height, indicatorWidth;
  final Decoration decoration, indicatorDecoration;
  final AlignmentGeometry alignment;
  const ScrollIndicator({
    super.key,
    required this.scrollController,
    this.width = 100,
    this.height = 10,
    this.indicatorWidth = 20,
    this.decoration = const BoxDecoration(color: Colors.black26),
    this.indicatorDecoration = const BoxDecoration(color: Colors.black),
    this.alignment = Alignment.center,
  });

  @override
  State<ScrollIndicator> createState() => _ScrollIndicatorState();
}

class _ScrollIndicatorState extends State<ScrollIndicator> {
  double currentPixels = 0.0;
  double mainContainer = 0.0;
  double move = 0.0;

  @override
  void initState() {
    widget.scrollController.addListener(() {
      _scrollListener();
    });
    super.initState();
  }

  void _scrollListener() {
    setState(() {
      currentPixels = widget.scrollController.position.pixels;
      mainContainer =
          widget.scrollController.position.maxScrollExtent / widget.width;
      move = (currentPixels / mainContainer);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: widget.alignment,
      child: Container(
        height: widget.height,
        width: widget.width + widget.indicatorWidth,
        decoration: widget.decoration,
        child: Stack(
          fit: StackFit.expand,
          children: [
            Positioned(
              left: move,
              child: Container(
                height: widget.height,
                width: widget.indicatorWidth,
                decoration: widget.indicatorDecoration,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
