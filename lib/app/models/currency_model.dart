class Currency {
  final String name;
  final Map<String, double> conversions;

  Currency({
    required this.name,
    required this.conversions,
  });

  static List<Currency> getCurrencies() {
    return <Currency>[
      Currency(
        name: 'Real',
        conversions: {
          'Real': 1.0,
          'Dollar': 0.18,
          'Euro': 0.15,
          'Bitcoin': 0.000016,
        },
      ),
      Currency(
        name: 'Dollar',
        conversions: {
          'Real': 5.63,
          'Dollar': 1.0,
          'Euro': 0.85,
          'Bitcoin': 0.000088,
        },
      ),
      Currency(
        name: 'Euro',
        conversions: {
          'Real': 6.62,
          'Dollar': 1.17,
          'Euro': 1.0,
          'Bitcoin': 0.00010,
        },
      ),
      Currency(
        name: 'Bitcoin',
        conversions: {
          'Real': 64116.51,
          'Dollar': 11351.30,
          'Euro': 9689.34,
          'Bitcoin': 1.0,
        },
      ),
    ];
  }
}
