enum CustomIconData {
  arrowLeft('assets/icons/arrow-left-02.svg'),
  chevronDown('assets/icons/chevron-down.svg'),
  cancel('assets/icons/cancel-01.svg'),
  remove('assets/icons/remove-01.svg'),
  add('assets/icons/add-01.svg'),
  all('assets/icons/all.svg'),
  produce('assets/icons/produce.svg'),
  meat('assets/icons/meat.svg'),
  dairy('assets/icons/dairy.svg'),
  pantry('assets/icons/pantry.svg'),
  shoppingBasket('assets/icons/shopping-basket.svg'),
  shoppingBasketConfirm('assets/icons/shopping-basket-confirm.svg'),
  shoppingBasketRemove('assets/icons/shopping-basket-remove-03.svg'),
  packageDelivered('assets/icons/package-delivered.svg'),
  packageRemove('assets/icons/package-remove.svg'),
  packageSearch('assets/icons/package-search.svg');

  const CustomIconData(this.assetLocation);
  final String assetLocation;
}
