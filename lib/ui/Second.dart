import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Second extends StatefulWidget {
  final String pic;
  final String txt;
  final List<String>gener;
  final String overview;
  const Second({super.key, required this.pic, required this.txt, required this.gener, required this.overview});

  @override
  State<Second> createState() => _SecondState();
}

class _SecondState extends State<Second> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(   body: Column(
      children: [
        Stack(
          children:[ Container(
            width: double.infinity,
            height: 270.h,
            color: Colors.blueAccent,
            child: Image.network(widget.pic, fit: BoxFit.cover,),
          ),Padding(
            padding: const EdgeInsets.only(top: 28),
            child: TextButton(onPressed: () { Navigator.of(context).pop(); },
            child: Icon(Icons.arrow_back,color: Colors.black,size: 28,)),
          )],
        ),
        Expanded(
          child: ListView(
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 10),
                child: Row(
                  children: [
                    SizedBox(width: 350,
                      child: Text(
                       widget.txt,
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 20.sp,
                          fontFamily: 'Mulish',
                          fontWeight: FontWeight.w700,
                          letterSpacing: 0.40,
                        ),
                      ),
                    ),
                    SizedBox(width: 13.w),
                    Icon(Icons.bookmark_border)
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 10,top: 10),
                child: Row(
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
              ),
              Padding(
                padding: const EdgeInsets.only(top: 10),
                child: SizedBox(
                  height: 30.h,
                  child: ListView.separated(
                    itemCount: widget.gener!.length,
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
                             widget.gener[index],
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                color: Color(0xFF87A3E8),
                                fontSize: 8.sp,
                                fontFamily: 'Mulish',
                                fontWeight: FontWeight.w700,
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
                padding: const EdgeInsets.only(left: 10,bottom: 18),
                child: Text(widget.overview ,
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
            ],
          ),
        )
      ],
    ),);
  }
}
