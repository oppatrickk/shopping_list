import 'package:shopping_list/core/enums/custom_icon_data.dart';

enum ShoppingCategory {
  all,
  produce,
  meat,
  dairy,
  pantry,
  others;

  String get title {
    switch (this) {
      case all:
        return 'All';
      case produce:
        return 'Produce';
      case meat:
        return 'Meat';
      case dairy:
        return 'Dairy';
      case pantry:
        return 'Pantry';
      case others:
        return 'Others';
    }
  }

  CustomIconData get icon {
    switch (this) {
      case all:
        return CustomIconData.allStroke;
      case produce:
        return CustomIconData.produceStroke;
      case meat:
        return CustomIconData.meatStroke;
      case dairy:
        return CustomIconData.dairyStroke;
      case pantry:
        return CustomIconData.pantryStroke;
      case others:
        return CustomIconData.allStroke;
    }
  }

  CustomIconData get activeIcon {
    switch (this) {
      case all:
        return CustomIconData.all;
      case produce:
        return CustomIconData.produce;
      case meat:
        return CustomIconData.meat;
      case dairy:
        return CustomIconData.dairy;
      case pantry:
        return CustomIconData.pantry;
      case others:
        return CustomIconData.all;
    }
  }

  int get order {
    switch (this) {
      case all:
        return 0;
      case produce:
        return 1;
      case meat:
        return 2;
      case dairy:
        return 3;
      case pantry:
        return 4;
      case others:
        return 5;
    }
  }
}
