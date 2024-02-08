import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tobeto_app/bloc/catalog/catalog_bloc.dart';
import 'package:tobeto_app/bloc/catalog/catalog_event.dart';
import 'package:tobeto_app/bloc/catalog/catalog_state.dart';
import 'package:tobeto_app/view/widgets/educational_card.dart';

class Catalog extends StatelessWidget {
  const Catalog({Key? key}) : super(key: key);

  void catalogAddIcon(BuildContext context) {
    showModalBottomSheet(
      context: context,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(0.0)),
      ),
      builder: (BuildContext context) {
        return SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: [
                const Text(
                  'Filtre',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                  ),
                ),
                const SizedBox(height: 12),
                buildBottomSheetOption('Bana Özel'),
                buildBottomSheetOption('Kategori'),
                buildBottomSheetOption('Eğitimler'),
                buildBottomSheetOption('Seviye'),
                buildBottomSheetOption('Konu'),
                buildBottomSheetOption('Yazılım Dili'),
                buildBottomSheetOption('Eğitmen'),
                buildBottomSheetOption('Durum'),
              ],
            ),
          ),
        );
      },
    );
  }

  void catalogAddSearchIcon(BuildContext context) {
    // Buraya arama işlevini ekleyin
    print('Arama işlevi');
  }

  @override
  Widget build(BuildContext context) {
    context.read<CatalogBloc>().add(ResetCatalogEvent());

    return Scaffold(
        appBar: AppBar(
          title: const Text(
            'Katalog',
            style: TextStyle(color: Colors.white),
          ),
          flexibleSpace: Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(colors: [
                Color(0xFF6A00FF),
                Color(0xFF9013FE),
                Color(0xFFC100FF),
              ], begin: Alignment.topRight, end: Alignment.bottomLeft),
            ),
          ),
          actions: [
            IconButton(onPressed: () {}, icon: Icon(Icons.search)),
            IconButton(
                onPressed: () {
                  catalogAddIcon(context);
                },
                icon: Icon(Icons.filter_alt))
          ],
        ),
        body: BlocBuilder<CatalogBloc, CatalogState>(builder: (context, state) {
          if (state is CatalogInitial) {
            print("nsbdjhsdjhsdk  $state");

            context.read<CatalogBloc>().add(FetchCatalogRequested());
          }
          if (state is CatalogLoading) {
            print("nsbdjhsdjhsdk  $state");

            return Center(
              child: Transform.scale(
                scale: 1,
                child: CircularProgressIndicator(
                  strokeWidth: 1,
                ),
              ),
            );
          }

          if (state is CatologLoaded) {
            print(state.educationCatalogInfo.length);
            return ListView.builder(
                itemCount: state.educationCatalogInfo.length,
                itemBuilder: (context, index) => EducationalCard(
                    department: state.educationCatalogInfo[index]));
          } else {
            return const Center(child: Text("Unknown State"));
          }
        }));
  }

  Widget buildBottomSheetOption(String title) {
    return InkWell(
      onTap: () {
        print('Tapped $title');
      },
      child: Padding(
        padding: const EdgeInsets.fromLTRB(16, 12, 16, 12),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: Text(
                title,
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const Icon(Icons.chevron_right),
          ],
        ),
      ),
    );
  }
}
