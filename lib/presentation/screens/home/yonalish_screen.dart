import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:taxi/core/config/app_constant.dart';
import 'package:taxi/presentation/provider/yonalish_provider.dart';
import 'package:taxi/presentation/widgets/buttons/dropbutton_widget.dart';

class YonalishScreen extends StatefulWidget {
  @override
  _YonalishScreenState createState() => _YonalishScreenState();
}

class _YonalishScreenState extends State<YonalishScreen> {
  @override
  void initState() {
    super.initState();
    Future.microtask(() =>
        Provider.of<YonalishViewModel>(context, listen: false).fetchYonalishlar());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Yo'nalishlar")),
      body: Consumer<YonalishViewModel>(
        builder: (context, viewModel, child) {
          if (viewModel.isLoading) {
            return Center(child: CircularProgressIndicator());
          }
          if (viewModel.errorMessage.isNotEmpty) {
            return Center(child: Text("Xatolik: ${viewModel.errorMessage}"));
          }

          return Padding(
            padding:  EdgeInsets.all(padding),
            child: Row(
              spacing: 12.0,
              children: [
                // Birinchi DropDown
                Expanded(
                  child: CustomDropdownButton(
                    selectedValue: viewModel.selectedViloyat1Id == null
                        ? null
                        : viewModel.uniqueViloyat1Names.firstWhere(
                            (name) => viewModel.selectedViloyat1Id ==
                                viewModel.yonalishlar
                                    .firstWhere((e) => e.viloyat1Nomi == name)
                                    .viloyatId1,
                            orElse: () => '',
                          ),
                    items: viewModel.uniqueViloyat1Names,
                    hint: "qayerdasiz",
                    onChanged: (newValue) {
                      if (newValue != null) {
                        viewModel.setSelectedViloyat1(newValue);
                      }
                    },
                  ),
                ),

                // Ikkinchi DropDown
                Expanded(
                  child: CustomDropdownButton(
                    selectedValue: viewModel.selectedViloyat2Id == null
                        ? null
                        : viewModel.relatedViloyat2Names.firstWhere(
                            (name) => viewModel.selectedViloyat2Id ==
                                viewModel.yonalishlar
                                    .firstWhere((e) => e.viloyat2Nomi == name)
                                    .viloyatId2,
                            orElse: () => '',
                          ),
                    items: viewModel.relatedViloyat2Names,
                    hint: "qayerga borasiz",
                    onChanged: (newValue) {
                      if (newValue != null) {
                        viewModel.setSelectedViloyat2(newValue);
                      }
                    },
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
