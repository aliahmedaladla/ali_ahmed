import 'package:flutter/material.dart';

class ContainerProduct extends StatelessWidget {
  final Map<String, String> product;
  final bool isFavorite;
  final VoidCallback onFavoriteToggle;

  const ContainerProduct({
    Key? key,
    required this.product,
    required this.isFavorite,
    required this.onFavoriteToggle,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.2),
            blurRadius: 6,
            offset: Offset(0, 3),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Stack(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.vertical(
                    top: Radius.circular(12),
                  ),
                  child: Image.asset(
                    product['image']!,
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                ),
                Positioned(
                  top: 8,
                  right: 8,
                  child: GestureDetector(
                    onTap: onFavoriteToggle,
                    child: Icon(
                      Icons.favorite,
                      color: isFavorite
                          ? Colors.red
                          : Colors.white.withOpacity(0.5),
                      size: 28,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  product['name']!,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
                SizedBox(height: 4),
                Row(
                  mainAxisAlignment:
                      MainAxisAlignment.spaceBetween, // توزيع العناصر
                  children: [
                    // السعر في الجهة اليسرى
                    Text(
                      product['price']!,
                      style: TextStyle(color: Color(0xFF6055D8),fontSize: 12),
                    ),
                    // الأيقونة مع خلفية بنفسجيّة على الجهة اليمنى
                    Container(
                      padding: EdgeInsets.all(6),
                      decoration: BoxDecoration(
                        color: Color(0xFF6055D8),

                        // اللون البنفسجي
                        borderRadius: BorderRadius.circular(18),
                      ),
                      child: Icon(
                        Icons.add,
                        color: Colors.white, // لون الأيقونة أبيض
                        size: 20,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
