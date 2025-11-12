// lib/berita_page.dart

import 'package:flutter/material.dart';

// Model Sederhana untuk Data Berita
class News {
  final String title;
  final String description;
  final String category;
  final String time;
  final String imagePath;
  final bool isFavorite;

  News({
    required this.title,
    required this.description,
    required this.category,
    required this.time,
    required this.imagePath,
    this.isFavorite = false,
  });
}

// Data Berita Statis (Minimal 15)
final List<News> staticNews = [
  News(
    title: 'Cuaca Panas Menerjang Bandung Seminggu Terakhir',
    description: 'Moving custom chauffeur. The search is a testament of new solution for creating custom AI...',
    category: 'Technology',
    time: '2 hours ago',
    imagePath: 'assets/weather_animation.png',
    isFavorite: true,
  ),
  News(
    title: 'Revolusi Kucing dalam Dunia Medis',
    description: 'Artificial intelligence is transforming medical diagnosis and treatment procedures worldwide...',
    category: 'Health',
    time: '5 hours ago',
    imagePath: 'assets/11.jpg',
  ),
  News(
    title: 'Pasukan Bajak Laut Menguasai Bandung',
    description: 'New breakthroughs in solar technology promise cheaper and more efficient renewable energy...',
    category: 'Environment',
    time: '1 day ago',
    imagePath: 'assets/ABSURD.jpg',
    isFavorite: true,
  ),
  News(
    title: 'Cryptocurrency Market Update',
    description: 'Major cryptocurrencies show significant growth as institutional adoption increases...',
    category: 'Finance',
    time: '1 day ago',
    imagePath: 'assets/meme.jpg',
  ),
  News(
    title: 'Space Exploration Milestone',
    description: 'Private space company reaches new heights in commercial space travel development...',
    category: 'Science',
    time: '2 days ago',
    imagePath: 'assets/a1.jpg',
  ),
  News(
    title: 'Pahlawan Nipunigoro Mulai Turun Gunung Melawan Penjajah Di Solo',
    description: 'How digital learning platforms are reshaping the future of education worldwide...',
    category: 'Education',
    time: '2 days ago',
    imagePath: 'assets/nipunigoro.png',
  ),
  News(
    title: 'Balapan Liar di Tengah Kota',
    description: 'Urban centers adopt IoT technology to create more efficient and sustainable living spaces...',
    category: 'Technology',
    time: '3 days ago',
    imagePath: 'assets/balapan.png',
    isFavorite: true,
  ),
  News(
    title: 'Global Economic Outlook',
    description: 'Experts predict economic recovery trends and market opportunities for the coming year...',
    category: 'Economy',
    time: '3 days ago',
    imagePath: 'assets/images/news8.jpg',
  ),
  News(
    title: 'Climate Change Conference',
    description: 'World leaders gather to discuss urgent actions needed to combat climate change effects...',
    category: 'Environment',
    time: '4 days ago',
    imagePath: 'assets/images/news9.jpg',
  ),
  News(
    title: 'Artificial Intelligence Ethics',
    description: 'New guidelines established for ethical AI development and implementation...',
    category: 'Technology',
    time: '4 days ago',
    imagePath: 'assets/images/news10.jpg',
  ),
  News(
    title: 'Remote Work Revolution',
    description: 'How companies are adapting to permanent remote work arrangements and digital nomadism...',
    category: 'Business',
    time: '5 days ago',
    imagePath: 'assets/images/news11.jpg',
  ),
];

class BeritaPage extends StatefulWidget {
  const BeritaPage({super.key});

  @override
  State<BeritaPage> createState() => _BeritaPageState();
}

class _BeritaPageState extends State<BeritaPage> {
  List<News> _filteredNews = staticNews;
  final TextEditingController _searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _filteredNews = staticNews;
  }

  void _filterNews(String query) {
    setState(() {
      if (query.isEmpty) {
        _filteredNews = staticNews;
      } else {
        _filteredNews = staticNews.where((news) {
          return news.title.toLowerCase().contains(query.toLowerCase()) ||
                 news.description.toLowerCase().contains(query.toLowerCase()) ||
                 news.category.toLowerCase().contains(query.toLowerCase());
        }).toList();
      }
    });
  }

  void _toggleFavorite(int index) {
    setState(() {
      _filteredNews[index] = News(
        title: _filteredNews[index].title,
        description: _filteredNews[index].description,
        category: _filteredNews[index].category,
        time: _filteredNews[index].time,
        imagePath: _filteredNews[index].imagePath,
        isFavorite: !_filteredNews[index].isFavorite,
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[50],
      appBar: AppBar(
        title: const Text(
          'Berita',
          style: TextStyle(
            fontWeight: FontWeight.w700,
            color: Colors.white,
            fontSize: 24,
          ),
        ),
        backgroundColor: Colors.blue.shade700,
        elevation: 0,
        centerTitle: true,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            bottom: Radius.circular(20),
          ),
        ),
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Colors.blue.shade50,
              Colors.grey[50]!,
            ],
          ),
        ),
        child: Column(
          children: [
            // Search Bar
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(15),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.green.withOpacity(0.1),
                      blurRadius: 10,
                      offset: const Offset(0, 3),
                    ),
                  ],
                ),
                child: TextField(
                  controller: _searchController,
                  onChanged: _filterNews,
                  decoration: InputDecoration(
                    hintText: 'Search news...',
                    hintStyle: TextStyle(color: Colors.grey[600]),
                    prefixIcon: Icon(Icons.search, color: Colors.green.shade700),
                    border: InputBorder.none,
                    contentPadding: const EdgeInsets.symmetric(vertical: 16, horizontal: 20),
                  ),
                ),
              ),
            ),
            
            // News Count
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Row(
                children: [
                  Text(
                    '${_filteredNews.length} news articles',
                    style: TextStyle(
                      color: Colors.grey[600],
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  const Spacer(),
                  // Filter Chip
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                    decoration: BoxDecoration(
                      color: Colors.green.shade50,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Row(
                      children: [
                        Icon(Icons.filter_list, color: Colors.green.shade700, size: 16),
                        const SizedBox(width: 4),
                        Text(
                          'Latest',
                          style: TextStyle(
                            color: Colors.green.shade700,
                            fontSize: 12,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            
            const SizedBox(height: 8),
            
            // News List
            Expanded(
              child: Container(
                margin: const EdgeInsets.symmetric(horizontal: 16),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(20),
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.green.withOpacity(0.1),
                      blurRadius: 15,
                      offset: const Offset(0, -2),
                    ),
                  ],
                ),
                child: ClipRRect(
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(20),
                  ),
                  child: ListView.builder(
                    physics: const BouncingScrollPhysics(),
                    itemCount: _filteredNews.length,
                    itemBuilder: (context, index) {
                      final news = _filteredNews[index];
                      return NewsListItem(
                        news: news,
                        index: index,
                        onFavoriteToggle: () => _toggleFavorite(index),
                      );
                    },
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// Widget Custom untuk Tampilan Setiap Item Berita
class NewsListItem extends StatelessWidget {
  final News news;
  final int index;
  final VoidCallback onFavoriteToggle;

  const NewsListItem({
    super.key,
    required this.news,
    required this.index,
    required this.onFavoriteToggle,
  });

  // Fungsi untuk mendapatkan warna gradient berdasarkan index
  List<Color> _getGradientColors(int index) {
    final colors = [
      [Colors.green.shade400, Colors.green.shade600],
      [Colors.blue.shade400, Colors.blue.shade600],
      [Colors.orange.shade400, Colors.orange.shade600],
      [Colors.purple.shade400, Colors.purple.shade600],
      [Colors.red.shade400, Colors.red.shade600],
    ];
    return colors[index % colors.length];
  }

  // Fungsi untuk mendapatkan inisial kategori
  String _getCategoryInitials(String category) {
    final names = category.split(' ');
    if (names.length > 1) {
      return '${names[0][0]}${names[1][0]}';
    } else {
      return category.length > 1 ? category.substring(0, 2) : category;
    }
  }

  Widget _getImageWidget() {
    if (news.imagePath.contains('assets')) {
      return Container(
        width: 60,
        height: 60,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: Colors.white, width: 2),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.1),
              blurRadius: 6,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(10),
          child: Image.asset(
            news.imagePath,
            fit: BoxFit.cover,
            errorBuilder: (context, error, stackTrace) {
              return _buildPlaceholderImage();
            },
          ),
        ),
      );
    } else {
      return _buildPlaceholderImage();
    }
  }

  Widget _buildPlaceholderImage() {
    final gradientColors = _getGradientColors(index);
    return Container(
      width: 60,
      height: 60,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        gradient: LinearGradient(
          colors: gradientColors,
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        boxShadow: [
          BoxShadow(
            color: gradientColors[0].withOpacity(0.3),
            blurRadius: 6,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Center(
        child: Text(
          _getCategoryInitials(news.category),
          style: const TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.w600,
            fontSize: 14,
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.05),
            spreadRadius: 1,
            blurRadius: 4,
            offset: const Offset(0, 1),
          ),
        ],
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          borderRadius: BorderRadius.circular(15),
          onTap: () {
            // Aksi ketika berita diklik
            _showNewsDetail(context);
          },
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              children: [
                // Gambar Berita
                _getImageWidget(),
                
                const SizedBox(width: 16),
                
                // Konten Berita
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Kategori dan Waktu
                      Row(
                        children: [
                          Container(
                            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
                            decoration: BoxDecoration(
                              color: Colors.green.shade50,
                              borderRadius: BorderRadius.circular(6),
                            ),
                            child: Text(
                              news.category,
                              style: TextStyle(
                                fontSize: 10,
                                fontWeight: FontWeight.w600,
                                color: Colors.green.shade700,
                              ),
                            ),
                          ),
                          const SizedBox(width: 8),
                          Text(
                            news.time,
                            style: TextStyle(
                              fontSize: 10,
                              color: Colors.grey[500],
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 8),
                      
                      // Judul Berita
                      Text(
                        news.title,
                        style: const TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 14,
                          color: Colors.black87,
                        ),
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                      const SizedBox(height: 4),
                      
                      // Deskripsi Berita
                      Text(
                        news.description,
                        style: TextStyle(
                          fontSize: 12,
                          color: Colors.grey[600],
                          height: 1.4,
                        ),
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ],
                  ),
                ),
                
                // Action Buttons
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _showNewsDetail(BuildContext context) {
    showModalBottomSheet(
      context: context,
      backgroundColor: Colors.transparent,
      isScrollControlled: true,
      builder: (context) {
        return Container(
          margin: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(20),
          ),
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Header
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                      decoration: BoxDecoration(
                        color: Colors.green.shade50,
                        borderRadius: BorderRadius.circular(6),
                      ),
                      child: Text(
                        news.category,
                        style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w600,
                          color: Colors.green.shade700,
                        ),
                      ),
                    ),
                    IconButton(
                      icon: const Icon(Icons.close),
                      onPressed: () => Navigator.pop(context),
                    ),
                  ],
                ),
                const SizedBox(height: 16),
                
                // Judul
                Text(
                  news.title,
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w700,
                    color: Colors.black87,
                  ),
                ),
                const SizedBox(height: 8),
                
                // Waktu
                Text(
                  news.time,
                  style: TextStyle(
                    fontSize: 12,
                    color: Colors.grey[500],
                  ),
                ),
                const SizedBox(height: 16),
                
                // Konten
                Text(
                  news.description + " " + "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.",
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.grey[700],
                    height: 1.6,
                  ),
                ),
                const SizedBox(height: 20),
                
                // Tombol Aksi
                Row(
                  children: [
                    Expanded(
                      child: ElevatedButton(
                        onPressed: () => Navigator.pop(context),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.green.shade700,
                          foregroundColor: Colors.white,
                          padding: const EdgeInsets.symmetric(vertical: 12),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                        child: const Text('Tutup'),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}