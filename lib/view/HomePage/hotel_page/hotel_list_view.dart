import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:test/view/HomePage/hotel_page/hotel_list_model.dart';
import 'package:test/view/HomePage/hotel_page/hotel_them.dart';

class HotelListView extends StatefulWidget {
  const HotelListView({
    super.key,
    this.hotelData,
    this.callback,
    this.animation,
    required this.province,
    this.animationController,
  });

  final String province;
  final HotelListData? hotelData;
  final Function? callback;
  final AnimationController? animationController;
  final Animation<double>? animation;

  @override
  State<HotelListView> createState() => _HotelListViewState();
}

class _HotelListViewState extends State<HotelListView> {
  @override
  Widget build(BuildContext context) {
    bool isFavorite = false;
    return AnimatedBuilder(
      animation: widget.animationController!,
      builder: (context, child) {
        return FadeTransition(
          opacity: widget.animation!,
          child: Transform(
            transform: Matrix4.translationValues(
                0.0, 50 * (1.0 - widget.animation!.value), 0.0),
            child: Padding(
              padding: const EdgeInsets.only(
                  left: 24, right: 24, top: 8, bottom: 16),
              child: Container(
                decoration: BoxDecoration(
                    borderRadius: const BorderRadius.all(Radius.circular(16.0)),
                    boxShadow: <BoxShadow>[
                      BoxShadow(
                          color: Colors.grey.withOpacity(0.6),
                          offset: const Offset(4, 4),
                          blurRadius: 16)
                    ]),
                child: ClipRRect(
                  borderRadius: const BorderRadius.all(Radius.circular(16.0)),
                  child: Stack(
                    children: <Widget>[
                      Column(
                        children: <Widget>[
                          AspectRatio(
                            aspectRatio: 2,
                            child: PageView.builder(
                              itemCount: widget.hotelData!.imagePath.length,
                              itemBuilder: (context, index) {
                                return Image.asset(
                                  widget.hotelData!.imagePath[index],
                                  fit: BoxFit.cover,
                                );
                              },
                            ),
                          ),
                          Container(
                            color: HotelTheme.buildLightTheme().cardColor,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Expanded(
                                  child: Container(
                                    padding: const EdgeInsets.only(
                                        left: 16, top: 8, bottom: 8),
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: <Widget>[
                                        Text(
                                          widget.hotelData!.titleTxt,
                                          textAlign: TextAlign.left,
                                          style: const TextStyle(
                                              fontWeight: FontWeight.w600,
                                              fontSize: 22),
                                        ),
                                        Row(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          children: <Widget>[
                                            Text(
                                              widget.hotelData!.subTxt,
                                              style: TextStyle(
                                                  color: Colors.grey
                                                      .withOpacity(0.8),
                                                  fontSize: 14),
                                            ),
                                            const SizedBox(width: 4),
                                            Icon(
                                              Icons.location_on,
                                              size: 16,
                                              color: HotelTheme
                                                  .buildLightTheme()
                                                  .primaryColor,
                                            ),
                                            Expanded(
                                                child: Text(
                                              '${widget.hotelData!.dist.toStringAsFixed(1)} km to city',
                                              overflow: TextOverflow.ellipsis,
                                              style: TextStyle(
                                                  fontSize: 14,
                                                  color: Colors.grey
                                                      .withOpacity(0.8)),
                                            ))
                                          ],
                                        ),
                                        Padding(
                                          padding:
                                              const EdgeInsets.only(top: 4),
                                          child: Row(
                                            children: <Widget>[
                                              RatingBar(
                                                ratingWidget: RatingWidget(
                                                  full: Icon(
                                                    Icons.star_rate_rounded,
                                                    color: HotelTheme
                                                            .buildLightTheme()
                                                        .primaryColor,
                                                  ),
                                                  half: Icon(
                                                    Icons.star_half_rounded,
                                                    color: HotelTheme
                                                            .buildLightTheme()
                                                        .primaryColor,
                                                  ),
                                                  empty: Icon(
                                                    Icons.star_border_rounded,
                                                    color: HotelTheme
                                                            .buildLightTheme()
                                                        .primaryColor,
                                                  ),
                                                ),
                                                onRatingUpdate: (value) {},
                                                itemPadding: EdgeInsets.zero,
                                                initialRating:
                                                    widget.hotelData!.rating,
                                                direction: Axis.horizontal,
                                                allowHalfRating: true,
                                                itemCount: 5,
                                                itemSize: 24,
                                              ),
                                              Text(
                                                '${widget.hotelData!.reviews} Reviews',
                                                style: TextStyle(
                                                    fontSize: 14,
                                                    color: Colors.grey
                                                        .withOpacity(0.8)),
                                              )
                                            ],
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding:
                                      const EdgeInsets.only(right: 16, top: 8),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment: CrossAxisAlignment.end,
                                    children: [
                                      Text(
                                        '\$${widget.hotelData!.perNight}',
                                        textAlign: TextAlign.left,
                                        style: const TextStyle(
                                            fontSize: 22,
                                            fontWeight: FontWeight.w600),
                                      ),
                                      Text(
                                        '/per night',
                                        style: TextStyle(
                                            fontSize: 14,
                                            color:
                                                Colors.grey.withOpacity(0.8)),
                                      )
                                    ],
                                  ),
                                )
                              ],
                            ),
                          )
                        ],
                      ),
                      Positioned(
                          top: 8,
                          right: 8,
                          child: Material(
                            color: Colors.transparent,
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: InkWell(
                                onTap: () {
                                  setState(() {
                                    isFavorite = !isFavorite; // Toggle favorite state
                                  });
                                },
                                child: isFavorite
                                    ? Icon(Icons.favorite, color: Colors.red)
                                    : Icon(Icons.favorite,
                                        color: HotelTheme
                                            .buildLightTheme()
                                            .primaryColor),
                              ),
                            ),
                          )),
                    ],
                  ),
                ),
              ),
            ),
          ),
          );
        },
      );
    }
}