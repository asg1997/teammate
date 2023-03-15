import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:teammate/core/consts/app_decorations_prop.dart';
import 'package:teammate/core/consts/app_fonts.dart';
import 'package:teammate/core/widgets/app_bar_auth.dart';
import 'package:teammate/core/widgets/app_button.dart';
import 'package:teammate/core/widgets/loading_widget.dart';
import 'package:teammate/core/widgets/text_field_widget.dart';
import 'package:teammate/presentation/create_game/components/time_dropdown.dart';
import 'package:teammate/presentation/edit_game/model.dart';

class EditGameScreen extends StatelessWidget {
  const EditGameScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        appBar: const MainAppBarWidget(title: 'Редактирование игры'),
        body: CustomScrollView(
          physics: const ClampingScrollPhysics(),
          slivers: [
            SliverFillRemaining(
              hasScrollBody: false,
              child: SafeArea(
                child: Padding(
                  padding: AppDecorations.defaultPadding,
                  child: Consumer<EditGameScreenModel>(
                    builder: (context, model, child) {
                      if (model.isLoading) {
                        return const Center(child: LoadingWidget());
                      }
                      return Column(
                        children: [
                          // НАЗВАНИЕ
                          TextFieldWidget(
                            title: 'Название*',
                            initialText: model.game?.gameInfo.name,
                            onChanged: model.changeName,
                          ),
                          const SizedBox(height: 10),
                          // ДАТА
                          DatePickerWidget(
                            initialData: model.game?.gameInfo.dateTime,
                            onChanged: model.changeDateTime,
                          ),
                          const SizedBox(height: 10),
                          TextFieldWidget(
                            initialText: model.game?.gameInfo.location,
                            title: 'Укажите место*',
                            onChanged: model.changeLocation,
                          ),
                          const SizedBox(height: 10),
                          TextFieldWidget(
                            initialText: model.game?.gameInfo.price,
                            title: 'Стоимость аренды площадки*',
                            onChanged: model.changePrice,
                          ),

                          const SizedBox(height: 71),
                          // КНОПКА СОХРАНИТЬ
                          AppButton(
                            title: 'Сохранить',
                            onTap: model.onSaveTapped,
                          ),
                          const SizedBox(height: 10),
                          TextButton(
                            onPressed: () {},
                            child: Text(
                              'УДАЛИТЬ ИГРУ',
                              style: AppFonts.medium16,
                            ),
                          )
                        ],
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
