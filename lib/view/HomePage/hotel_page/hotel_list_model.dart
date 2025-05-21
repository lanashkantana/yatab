import 'package:test/core/utils/app_image.dart';

class HotelListData {
  final List<String> imagePath;
  String titleTxt;
  String subTxt;
  double dist;

  int reviews;
  int perNight;
  String description;

  HotelListData({
    required this.imagePath,
    this.titleTxt = '',
    this.subTxt = '',
    this.dist = 1.8,
    this.reviews = 80,
    this.perNight = 180,
    this.description = '',
  });

  static List<HotelListData> hotelList = <HotelListData>[
    HotelListData(
      imagePath: [
        AssetsData.hotel5,
        AssetsData.hotel4,
        AssetsData.hotel3,
        AssetsData.hotel2,
      ],
      titleTxt: 'Grand Royal Hotel',
      subTxt: 'Wembley, London',
      dist: 2.0,
      reviews: 80,

      perNight: 180,
      description:
          "The ideal place for those looking for a luxurious and tranquil holiday experience with stunning sea views",
    ),
    HotelListData(
      imagePath: [
        AssetsData.hotel5,
        AssetsData.hotel4,
        AssetsData.hotel3,
        AssetsData.hotel2,
      ],
      titleTxt: 'Queen Hotel',
      subTxt: 'Wembley, London',
      dist: 4.0,
      reviews: 74,

      perNight: 200,
      description:
          "The ideal place for those looking for a luxurious and tranquil holiday experience with stunning sea views",
    ),
    HotelListData(
      imagePath: [
        AssetsData.hotel5,
        AssetsData.hotel4,
        AssetsData.hotel3,
        AssetsData.hotel2,
      ],
      titleTxt: 'Grand Royal Hotel',
      subTxt: 'Wembley, London',
      dist: 3.0,
      reviews: 62,

      perNight: 60,
      description:
          "The ideal place for those looking for a luxurious and tranquil holiday experience with stunning sea views",
    ),
    HotelListData(
      imagePath: [
        AssetsData.hotel2,
        AssetsData.hotel4,
        AssetsData.hotel3,
        AssetsData.hotel2,
      ],
      titleTxt: 'Queen Hotel',
      subTxt: 'Wembley, London',
      dist: 7.0,
      reviews: 90,

      perNight: 170,
      description:
          "The ideal place for those looking for a luxurious and tranquil holiday experience with stunning sea views",
    ),
    HotelListData(
      imagePath: [
        AssetsData.hotel5,
        AssetsData.hotel1,
        AssetsData.hotel3,
        AssetsData.hotel2,
      ],
      titleTxt: 'Grand Royal Hotel',
      subTxt: 'Wembley, London',
      dist: 2.0,
      reviews: 240,

      perNight: 200,
      description:
          "The ideal place for those looking for a luxurious and tranquil holiday experience with stunning sea views",
    ),
  ];
}
