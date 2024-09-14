import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:vinyl_list/utils/app_colors.dart';

class DashboardPage extends StatefulWidget {
  const DashboardPage({super.key});

  @override
  State<DashboardPage> createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  final int totalDiscs = 250;
  final int totalArtists = 120;
  final String topGenre = "Rock";
  final List<Map<String, dynamic>> recentDiscs = [
    {
      "title": "Nevermind",
      "artist": "Nirvana",
      "cover": "https://example.com/nevermind.jpg"
    },
    {
      "title": "The Dark Side of the Moon",
      "artist": "Pink Floyd",
      "cover": "https://example.com/dsotm.jpg"
    },
    {
      "title": "Rumours",
      "artist": "Fleetwood Mac",
      "cover": "https://example.com/rumours.jpg"
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 40),
            Text(
              'VinylList Dashboard',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: AppColors.secondaryColor,
              ),
            ),
            const SizedBox(height: 24),
            _buildStatisticsSection(),
            const SizedBox(height: 24),
            _buildTopGenreSection(),
            const SizedBox(height: 24),
            _buildRecentDiscsSection(),
          ],
        ),
      ),
    );
  }

  Widget _buildStatisticsSection() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        _buildStatCard(Icons.album, totalDiscs, 'Total Discs'),
        _buildStatCard(Icons.person, totalArtists, 'Total Artists'),
      ],
    );
  }

  Widget _buildStatCard(IconData icon, int value, String label) {
    return Card(
      color: AppColors.secondaryColor,
      elevation: 4,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Icon(icon, size: 48, color: AppColors.accentColor),
            const SizedBox(height: 8),
            Text(
              value.toString(),
              style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: AppColors.textPrimaryColor),
            ),
            Text(label, style: TextStyle(color: AppColors.textSecondaryColor)),
          ],
        ),
      ),
    );
  }

  Widget _buildTopGenreSection() {
    return Card(
      color: AppColors.secondaryColor,
      elevation: 4,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Top Genre',
              style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: AppColors.textPrimaryColor),
            ),
            const SizedBox(height: 16),
            SizedBox(
              height: 200,
              child: PieChart(
                PieChartData(
                  sections: _createGenreData(),
                  borderData: FlBorderData(
                    show: false,
                  ),
                  sectionsSpace: 1,
                  centerSpaceRadius: 0,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  List<PieChartSectionData> _createGenreData() {
    final data = [
      GenreData('Rock', 35, AppColors.accentColor),
      GenreData('Pop', 25, AppColors.supportColor),
      GenreData('Jazz', 20, AppColors.primaryColor),
      GenreData('Others', 20, AppColors.textSecondaryColor),
    ];

    return data.map((genre) {
      return PieChartSectionData(
        color: genre.color,
        value: genre.percentage,
        title: genre.genre,
        showTitle: true,
      );
    }).toList();
  }

  Widget _buildRecentDiscsSection() {
    return Card(
      color: AppColors.secondaryColor,
      elevation: 4,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Recently Added',
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: AppColors.textPrimaryColor)),
            const SizedBox(height: 16),
            SizedBox(
              height: 200,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: recentDiscs.length,
                itemBuilder: (context, index) {
                  final disc = recentDiscs[index];
                  return Padding(
                    padding: const EdgeInsets.only(right: 16.0),
                    child: Column(
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(8),
                          child: Image.network(
                            disc['cover'],
                            width: 120,
                            height: 120,
                            fit: BoxFit.cover,
                          ),
                        ),
                        const SizedBox(height: 8),
                        Text(
                          disc['title'],
                          style: TextStyle(
                              color: AppColors.textPrimaryColor,
                              fontWeight: FontWeight.bold),
                        ),
                        Text(
                          disc['artist'],
                          style: TextStyle(color: AppColors.textSecondaryColor),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class GenreData {
  final String genre;
  final double percentage;
  final Color color;

  GenreData(this.genre, this.percentage, this.color);
}
