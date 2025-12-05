enum CustomIconData {
  chevronDown('assets/icons/chevron-down.svg'),
  all('assets/icons/all.svg'),
  allStroke('assets/icons/all_stroke.svg'),
  produce('assets/icons/produce.svg'),
  produceStroke('assets/icons/produce_stroke.svg'),
  meat('assets/icons/meat.svg'),
  meatStroke('assets/icons/meat_stroke.svg'),
  dairy('assets/icons/dairy.svg'),
  dairyStroke('assets/icons/dairy_stroke.svg'),
  pantry('assets/icons/pantry.svg'),
  pantryStroke('assets/icons/pantry_stroke.svg'),
  shoppingBasket('assets/icons/shopping-basket.svg'),
  shoppingBasketConfirm('assets/icons/shopping-basket-confirm.svg'),
  packageSearch('assets/icons/package-search.svg');

  const CustomIconData(this.assetLocation);
  final String assetLocation;
}
