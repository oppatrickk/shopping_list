enum CustomIconData {
  chevronDown('assets/icons/chevron-down.svg'),
  all('assets/icons/all.svg'),
  produce('assets/icons/produce.svg'),
  meat('assets/icons/meat.svg'),
  dairy('assets/icons/dairy.svg'),
  pantry('assets/icons/pantry.svg'),
  shoppingBasket('assets/icons/shopping-basket.svg'),
  shoppingBasketConfirm('assets/icons/shopping-basket-confirm.svg'),
  packageSearch('assets/icons/package-search.svg');

  const CustomIconData(this.assetLocation);
  final String assetLocation;
}
