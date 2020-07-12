import 'package:flutter/material.dart';
import 'package:flutter_cubit/flutter_cubit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quotz/cubit/quote_cubit.dart';
import 'package:quotz/cubit/quote_states.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Color(0xFF004e92),
      body: SafeArea(
        child: Container(
            padding: EdgeInsets.all(30),
            height: height,
            width: width,
            child: CubitBuilder<QuoteCubit, QuoteState>(
              builder: (BuildContext context, state) {
                if (state is QuoteLoading) {
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                }
                if (state is ErrorLoading) {
                  return Center(
                    child: Icon(Icons.close),
                  );
                }
                if (state is QuoteLoaded) {
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        "\"",
                        style: GoogleFonts.aclonica(
                            color: Colors.white, fontSize: 80),
                      ),
                      Text(
                        state.quote.quotes[0].quote,
                        style: GoogleFonts.playfairDisplay(
                            color: Colors.white, fontSize: 25),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Text(
                        "- ${state.quote.quotes[0].author}",
                        style: GoogleFonts.playfairDisplay(
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.w600),
                      ),
                      SizedBox(
                        height: 30,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          SizedBox.fromSize(
                            size: Size(56, 56), // button width and height
                            child: ClipOval(
                              child: Material(
                                color: Colors.white, // button color
                                child: InkWell(
                                  splashColor: Colors.green, // splash color
                                  onTap: () => context
                                      .cubit<QuoteCubit>()
                                      .getQuotes(), // button pressed
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: <Widget>[
                                      Icon(
                                        Icons.refresh,
                                        color: Color(0xFF004e92),
                                      ), // text
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          )
                        ],
                      )
                    ],
                  );
                }
                return Container();
              },
            )),
      ),
    );
  }
}
