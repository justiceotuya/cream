class AdsBannerMockData {
  String imageLink;

  AdsBannerMockData({this.imageLink});

  static List<AdsBannerMockData> getBanners() {
    List<AdsBannerMockData> _list = [];
    AdsBannerMockData _data = AdsBannerMockData(
        imageLink:
            'https://images.unsplash.com/photo-1516450360452-9312f5e86fc7?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=800&q=60');
    _list.add(_data);
    _data = AdsBannerMockData(
        imageLink:
            'https://images.unsplash.com/photo-1442504028989-ab58b5f29a4a?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=800&q=60');
    _list.add(_data);
    return _list;
  }
}
