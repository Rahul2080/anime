import 'package:anime/Repository/ModelClass/Anime.dart';
import 'package:anime/ui/Second.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../Bloc/anime_bloc.dart';
import '../Repository/ModelClass/Anime.dart';

class First extends StatefulWidget {
  const First({super.key});

  @override
  State<First> createState() => _FirstState();
}

class _FirstState extends State<First> {
  late AnimeModel animedata;

  @override
  void initState() {
    BlocProvider.of<AnimeBloc>(context).add(FetchAnime());
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Padding(
          padding: const EdgeInsets.only(left: 110),
          child: Text(
            'FilmKu',
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Color(0xFF110E47),
              fontSize: 16.sp,
              fontFamily: 'Merriweather',
              fontWeight: FontWeight.w900,
              letterSpacing: 0.32,
            ),
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 18),
            child: Icon(
              Icons.notification_add_outlined,
              color: Colors.black,
            ),
          )
        ],
        leading: Icon(Icons.format_align_left_rounded),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 10, top: 18),
              child: Row(
                children: [
                  Text(
                    'Now Showing',
                    style: TextStyle(
                      color: Color(0xFF110E46),
                      fontSize: 16.sp,
                      fontFamily: 'Merriweather',
                      fontWeight: FontWeight.w900,
                      letterSpacing: 0.32,
                    ),
                  ),
                  SizedBox(
                    width: 170.w,
                  ),
                  Text(
                    'See more',
                    textAlign: TextAlign.right,
                    style: TextStyle(
                      color: Color(0xFFAAA8B0),
                      fontSize: 10.sp,
                      fontFamily: 'Mulish',
                      fontWeight: FontWeight.w400,
                      letterSpacing: 0.20,
                    ),
                  ),
                ],
              ),
            ),
            BlocBuilder<AnimeBloc, AnimeState>(
              builder: (context, state) {
                if (state is AnimeBlocLoading) {
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                }
                if (state is AnimeBlocError) {
                  return Center(
                    child: Text("Error"),
                  );
                }
                if (state is AnimeBlocLoaded) {
                  animedata = BlocProvider.of<AnimeBloc>(context).anime;

                  return SizedBox(height: 300.h,
                    child: ListView.separated(
                      itemCount: animedata.data!.length,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) {
                        return TextButton(
                          onPressed: () {
                            Navigator.of(context).push(
                              MaterialPageRoute(
                                builder: (_) => Second(pic: animedata.data![index].image.toString(),txt: animedata.data![index].title!,gener: animedata.data![index].genres!,overview: animedata.data![index].synopsis!,),
                              ),
                            );
                          },
                          child: Container(
                            width: 200.w,
                            decoration: ShapeDecoration(
                              color: Colors.white,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SizedBox(
                                    width: 170.w,
                                    child: Image.network(
                                      animedata.data![index].image.toString(),
                                      fit: BoxFit.cover,
                                    )),
                                Padding(
                                  padding: const EdgeInsets.only(top: 10,left: 3),
                                  child: SizedBox(
                                    height: 20.h,
                                    child: Text(
                                      animedata.data![index].title.toString(),
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 14.sp,
                                        fontFamily: 'Mulish',
                                        fontWeight: FontWeight.w700,
                                        letterSpacing: 0.28,
                                      ),
                                      maxLines: 1,
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  height: 10.h,
                                ),
                                Row(
                                  children: [
                                    RatingBar.builder(
                                      initialRating: 1,
                                      minRating: 1,
                                      direction: Axis.horizontal,
                                      allowHalfRating: true,
                                      itemCount: 1,
                                      itemSize: 30,
                                      itemPadding:
                                          EdgeInsets.symmetric(horizontal: 4.0),
                                      itemBuilder: (context, _) => Icon(
                                        Icons.star,
                                        color: Colors.amber,
                                      ),
                                      onRatingUpdate: (double value) {},
                                    ),
                                    SizedBox(
                                      width: 10.w,
                                    ),
                                    Text(
                                      "5.6",
                                      style: TextStyle(
                                        color: Color(0xFF9B9B9B),
                                        fontSize: 12.sp,
                                        fontFamily: 'Mulish',
                                        fontWeight: FontWeight.w400,
                                        letterSpacing: 0.24,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                      separatorBuilder: (BuildContext context, int index) {
                        return SizedBox(
                          width: 20.w,
                        );
                      },
                    ),
                  );
                } else {
                  return SizedBox();
                }
              },
            ),
            SizedBox(height: 18.h),
            Row(
              children: [
                Text(
                  'Popular',
                  style: TextStyle(
                    color: Color(0xFF110E47),
                    fontSize: 16.sp,
                    fontFamily: 'Merriweather',
                    fontWeight: FontWeight.w900,
                    letterSpacing: 0.32,
                  ),
                ),
                SizedBox(width: 220.w),
                Text(
                  'See more',
                  textAlign: TextAlign.right,
                  style: TextStyle(
                    color: Color(0xFFAAA8B0),
                    fontSize: 10.sp,
                    fontFamily: 'Mulish',
                    fontWeight: FontWeight.w400,
                    letterSpacing: 0.20,
                  ),
                ),
              ],
            ),
            BlocBuilder<AnimeBloc, AnimeState>(
                      builder: (context, state) {
                        if( state is AnimeBlocLoading){return Center(child: CircularProgressIndicator(),);}
                        if (state is AnimeBlocError){return Center(child: Text("Error"),);}
                        if (state is AnimeBlocLoaded){
                    animedata= BlocProvider.of<AnimeBloc>(context).anime;

                        return SizedBox(height: 280* animedata.data!.length.toDouble(),
                          child: ListView.separated(
                                        itemCount: animedata.data!.length,
                                        scrollDirection: Axis.vertical,
                                        physics: NeverScrollableScrollPhysics(),
                                        itemBuilder: (context, index) {
                                          return Padding(
                                            padding: const EdgeInsets.only(left: 10),
                                            child: Container(
                                              width: 60.w,
                                              height: 200.h,
                                              decoration: ShapeDecoration(
                                                color: Colors.white,
                                                shape: RoundedRectangleBorder(
                                                  borderRadius: BorderRadius.circular(20),
                                                ),
                                              ),
                                              child: Row(
                                                children: [
                                                  SizedBox(width: 190,height: 250,child: Image.network(animedata.data![index].image.toString(),fit: BoxFit.cover,)),
                                                  SizedBox(width: 15.w),
                                                  Column(
                                                                      crossAxisAlignment: CrossAxisAlignment.start,
                                                                      children: [
                                                                        Padding(
                                                                          padding: const EdgeInsets.only(top: 20),
                                                                          child: SizedBox(
                                                                            width: 120.w,
                                                                            child: Text(
                                                                             animedata.data![index].title.toString(),
                                                                              style: TextStyle(
                                                                                color: Colors.black,
                                                                                fontSize: 14.sp,
                                                                                fontFamily: 'Mulish',
                                                                                fontWeight: FontWeight.w700,
                                                                                letterSpacing: 0.28,
                                                                              ),
                                                                              maxLines: 1,
                                                                            ),
                                                                          ),
                                                                        ),
                                                                        Padding(
                                                                          padding: const EdgeInsets.only(top: 10),
                                                                          child: Row(
                                                                            children: [
                                                                              RatingBar.builder(
                                                                                initialRating: 1,
                                                                                minRating: 1,
                                                                                direction: Axis.horizontal,
                                                                                allowHalfRating: true,
                                                                                itemCount: 1,
                                                                                itemSize: 30,
                                                                                itemPadding:
                                                                                    EdgeInsets.symmetric(horizontal: 4.0),
                                                                                itemBuilder: (context, _) => Icon(
                                                                                  Icons.star,
                                                                                  color: Colors.amber,
                                                                                ),
                                                                                onRatingUpdate: (double value) {},
                                                                              ),
                                                                              Text(
                                                                                "5.9",
                                                                                style: TextStyle(
                                                                                  color: Color(0xFF9B9B9B),
                                                                                  fontSize: 12.sp,
                                                                                  fontFamily: 'Mulish',
                                                                                  fontWeight: FontWeight.w400,
                                                                                  letterSpacing: 0.24,
                                                                                ),
                                                                              )
                                                                            ],
                                                                          ),
                                                                        ),
                                                                        SizedBox(height: 17.h),
                                                                        Container(
                                                                          width: 170.w,
                                                                          height: 30.h,
                                                                          decoration: ShapeDecoration(
                                                                            color: Colors.white,
                                                                            shape: RoundedRectangleBorder(
                                                                              borderRadius: BorderRadius.circular(20),
                                                                            ),
                                                                          ),
                                                                          child: ListView.separated(
                                                                            itemCount: animedata.data![index].genres!.length,
                                                                            scrollDirection: Axis.horizontal,
                                                                            itemBuilder: (BuildContext context, int index1) {
                                                                              return Container(
                                                                                width: 60.w,
                                                                                height: 15.h,
                                                                                decoration: ShapeDecoration(
                                                                                  color: Colors.greenAccent,
                                                                                  shape: RoundedRectangleBorder(
                                                                                    borderRadius: BorderRadius.circular(20),
                                                                                  ),
                                                                                ),
                                                                                child: Padding(
                                                                                  padding: const EdgeInsets.only(top: 10),
                                                                                  child: Text(
                                                                                  animedata.data![index1].genres.toString(),
                                                                                    textAlign: TextAlign.center,
                                                                                    style: TextStyle(
                                            color: Color(0xFF87A3E8),
                                            fontSize: 8.sp,
                                            fontFamily: 'Mulish',
                                            fontWeight: FontWeight.w700,
                                            letterSpacing: 0.16,
                                                                                    ),
                                                                                  ),
                                                                                ),
                                                                              );
                                                                            },
                                                                            separatorBuilder:
                                                                                (BuildContext context, int index) {
                                                                              return SizedBox(
                                                                                width: 6.w,
                                                                              );
                                                                            },
                                                                          ),
                                                                        ),
                                                                        Row(
                                                                          children: [
                                                                            CircleAvatar(
                                                                              radius: 18.r,
                                                                              backgroundColor: Colors.white,
                                                                              child: Icon(Icons.schedule_outlined),
                                                                            ),
                                                                            Text(
                                                                              '1h 47m',
                                                                              style: TextStyle(
                                                                                color: Colors.black,
                                                                                fontSize: 12.sp,
                                                                                fontFamily: 'Mulish',
                                                                                fontWeight: FontWeight.w400,
                                                                                letterSpacing: 0.24,
                                                                              ),
                                                                            )
                                                                          ],
                                                                        ),
                                                                      ],
                                                  ),
                                                ],
                                              ),
                                            ),
                                          );
                                        },
                                        separatorBuilder: (BuildContext context, int index) {
                                          return SizedBox(
                                            height: 20.h,
                                          );
                                        },
                                      ),
                        );
                      } else { return SizedBox();}
                      }
                    ),
          ],
        ),
      ),
    );
  }
}
