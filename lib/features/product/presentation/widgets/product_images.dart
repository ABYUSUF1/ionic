import 'package:animate_do/animate_do.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../../../../core/widgets/responsive_layout.dart';

class ProductImages extends StatefulWidget {
  final List<String>? images;

  const ProductImages({super.key, required this.images});

  @override
  State<ProductImages> createState() => _ProductImagesState();
}

class _ProductImagesState extends State<ProductImages> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isMobile = ResponsiveLayout.isMobile(context);

    if (widget.images == null || widget.images!.isEmpty) {
      return const SizedBox(); // or a placeholder
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Main Selected Image
        Container(
          width: isMobile ? double.infinity : double.infinity,
          height: isMobile ? 300 : 350,
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: theme.colorScheme.secondary,
            borderRadius: BorderRadius.circular(6),
          ),
          child: FadeInDown(
            from: 20,
            duration: const Duration(milliseconds: 300),
            key: ValueKey(selectedIndex),
            child: CachedNetworkImage(
              imageUrl: widget.images![selectedIndex],
              fit: BoxFit.contain,
            ),
          ),
        ),

        const SizedBox(height: 8),

        // Thumbnail Grid
        SizedBox(
          width: isMobile ? null : double.infinity,
          height: isMobile ? 100 : 120,
          child: ListView.separated(
            scrollDirection: Axis.horizontal,
            itemCount: widget.images!.length,
            separatorBuilder: (_, __) => const SizedBox(width: 8),
            itemBuilder: (context, index) {
              final isSelected = index == selectedIndex;
              return GestureDetector(
                onTap: () {
                  setState(() {
                    selectedIndex = index;
                  });
                },
                child: Container(
                  width: isMobile ? 100 : 120,
                  padding: const EdgeInsets.all(6),
                  decoration: BoxDecoration(
                    color: theme.colorScheme.secondary,
                    borderRadius: BorderRadius.circular(6),
                    border: Border.all(
                      color:
                          isSelected
                              ? theme.colorScheme.primary
                              : Colors.transparent,
                      width: 2,
                    ),
                  ),
                  child: CachedNetworkImage(
                    imageUrl: widget.images![index],
                    fit: BoxFit.contain,
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
