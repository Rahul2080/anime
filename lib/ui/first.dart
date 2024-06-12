import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class First extends StatefulWidget {
  const First({super.key});

  @override
  State<First> createState() => _FirstState();
}

class _FirstState extends State<First> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(body: Column(
      children: [
        Container(
          width: double.infinity,
          height: 270.h,
          color: Colors.blueAccent,
          child: Center(
              child: Image.network("hllo")
          ),
        ),
        Expanded(
          child: ListView(
            children: [
              Row(
                children: [
                  SizedBox(width: 350,
                    child: Text(
                     " widget.title",
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 20.sp,
                        fontFamily: 'Mulish',
                        fontWeight: FontWeight.w700,
                        letterSpacing: 0.40,
                      ),
                    ),
                  ),
                  SizedBox(width: 18.w),
                  Icon(Icons.bookmark_border)
                ],
              ), SizedBox(height: 10.h),
              Row(
                children: [
                  RatingBar.builder(
                    initialRating: 1,
                    minRating: 1,
                    direction: Axis.horizontal,
                    allowHalfRating: true,
                    itemCount: 1,
                    itemSize: 30,
                    itemPadding: EdgeInsets.symmetric(horizontal: 4.0),
                    itemBuilder: (context, _) =>
                        Icon(
                          Icons.star,
                          color: Colors.amber,
                        ),
                    onRatingUpdate: (double value) {},
                  ), SizedBox(height: 10.h),
                  Text("5.9",

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
              SizedBox(
                height: 30.h,
                child: ListView.separated(
                  itemCount: 3,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.only(left: 10),
                      child: Container(
                        width: 100.w, height: 30.h,
                        decoration: ShapeDecoration(
                          color: Color(0xFFDBE3FF),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.only(top: 13),
                          child: Text(
                            "widget.geners[index]",
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
                      ),
                    );
                  },
                  separatorBuilder: (BuildContext context, int index) {
                    return SizedBox(
                      width: 6.w,
                    );
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 18, left: 10),
                child: Row(
                  children: [
                    Text(
                      'Length',
                      style: TextStyle(
                        color: Color(0xFF9B9B9B),
                        fontSize: 12.sp,
                        fontFamily: 'Mulish',
                        fontWeight: FontWeight.w400,
                        letterSpacing: 0.24,
                      ),
                    ),
                    SizedBox(
                      width: 100.w,
                    ),
                    Text(
                      'Language',
                      style: TextStyle(
                        color: Color(0xFF9B9B9B),
                        fontSize: 12.sp,
                        fontFamily: 'Mulish',
                        fontWeight: FontWeight.w400,
                        letterSpacing: 0.24,
                      ),
                    ),
                    SizedBox(
                      width: 100.w,
                    ),
                    Text(
                      'Rating',
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
              ),
              SizedBox(
                height: 10.h,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 10),
                child: Row(
                  children: [
                    Text(
                      '2h 28min',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 12.sp,
                        fontFamily: 'Mulish',
                        fontWeight: FontWeight.w600,
                        letterSpacing: 0.24,
                      ),
                    ),
                    SizedBox(
                      width: 100.w,
                    ),
                    Text(
                      'English',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 12.sp,
                        fontFamily: 'Mulish',
                        fontWeight: FontWeight.w600,
                        letterSpacing: 0.24,
                      ),
                    ),
                    SizedBox(
                      width: 100.w,
                    ),
                    Text(
                      'PG-13',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 12.sp,
                        fontFamily: 'Mulish',
                        fontWeight: FontWeight.w600,
                        letterSpacing: 0.24,
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 10, left: 10),
                child: Text(
                  'Description',
                  style: TextStyle(
                    color: Color(0xFF110E47),
                    fontSize: 16.sp,
                    fontFamily: 'Merriweather',
                    fontWeight: FontWeight.w900,
                    letterSpacing: 0.32,
                  ),
                ),
              ), SizedBox(height: 10.h),
              Padding(
                padding: const EdgeInsets.only(left: 10),
                child: Text("widget.overview",
                  style: TextStyle(
                    color: Color(0xFF9B9B9B),
                    fontSize: 12.sp,
                    fontFamily: 'Mulish',
                    fontWeight: FontWeight.w400,
                    height: 1.h,
                    letterSpacing: 0.24,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 10, left: 10),
                child: Row(
                  children: [
                    Text(
                      'Cast',
                      style: TextStyle(
                        color: Color(0xFF110E47),
                        fontSize: 16.sp,
                        fontFamily: 'Merriweather',
                        fontWeight: FontWeight.w900,
                        letterSpacing: 0.32,
                      ),
                    ),
                    SizedBox(
                      width: 250.w,
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
              Container(color: Colors.white,
                height: 200.h,
                child:
                ListView.separated(
                  itemCount: 3,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    return Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 10, right: 10),
                          child: Container(
                            width: 150.w, height: 150.h,
                            decoration: ShapeDecoration(
                              color: Colors.black,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20),
                              ),
                            ),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(20),
                              child: Image.asset(
                               "hi",
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                        ),
                        Text("hlo",
                          style: TextStyle(
                            color: Color(0xFF110E47),
                            fontSize: 12.sp,
                            fontFamily: 'Mulish',
                            fontWeight: FontWeight.w400,
                            letterSpacing: 0.24,
                          ),
                        )
                      ],
                    );
                  },
                  separatorBuilder: (BuildContext context, int index) {
                    return SizedBox(
                      width: 10.w,
                    );
                  },
                ),
              ),
            ],
          ),
        )
      ],
    ),);
  }
}
