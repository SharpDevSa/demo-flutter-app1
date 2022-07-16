enum CoffeePage { details, list, unknown }

class CoffeeRoutes {
  CoffeePage selectedPage = CoffeePage.unknown;
  String? id;

  CoffeeRoutes.list()
      : selectedPage = CoffeePage.list;

  CoffeeRoutes.details(this.id)
      : selectedPage = CoffeePage.details;
  CoffeeRoutes.unknown()
      : selectedPage = CoffeePage.unknown;
}