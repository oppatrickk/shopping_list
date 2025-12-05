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

  String get icon {
    switch (this) {
      case all:
        return 'assets/icons/all.svg';
      case produce:
        return 'assets/icons/produce.svg';
      case meat:
        return 'assets/icons/meat.svg';
      case dairy:
        return 'assets/icons/dairy.svg';
      case pantry:
        return 'assets/icons/pantry.svg';
      case others:
        return 'assets/icons/others.svg';
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
