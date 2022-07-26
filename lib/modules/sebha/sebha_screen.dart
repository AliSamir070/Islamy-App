import 'package:flutter/material.dart';
import 'package:islamy_app/shared/components/styles/styles.dart';

class SebhaScreen extends StatefulWidget {

  @override
  State<SebhaScreen> createState() => _SebhaScreenState();
}

class _SebhaScreenState extends State<SebhaScreen> with SingleTickerProviderStateMixin{
  late AnimationController controller ;
  late Animation animation;
  int tsbehatCounter = 0;
  int tsbehatIndex = 0;
  List<String> tsbehat = ['سبحان الله','الحمد لله','الله اكبر','لا اله الا الله'];
  double beginAngle = 0;
  double endAngle = 0.25;


  @override
  void initState() {
    controller = AnimationController(vsync: this,duration: Duration(seconds: 1));
    setRotaion(0.25);
  }

  @override
  Widget build(BuildContext context) {
    double heightOfScreen = MediaQuery.of(context).size.height;
    double widthOfScreen = MediaQuery.of(context).size.width;
    return Container(
      width: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            margin: EdgeInsetsDirectional.only(top: 20),
            child: Stack(
              alignment: Alignment.center,
              children: [
                Positioned(
                  top: 0.0,
                  right: widthOfScreen*0.15,
                  child: Image(
                    image: AssetImage('assets/images/head_of_seb7a.png'),
                  ),
                ),
                Padding(
                  padding: EdgeInsetsDirectional.only(top: heightOfScreen*0.10),
                  child: AnimatedBuilder(
                    builder: (context,child)=>Transform.rotate(
                      angle: animation.value,
                      child: child,
                    ),
                    animation: animation,
                    child: Image(
                        image: AssetImage('assets/images/body_of_seb7a.png')
                    ),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: heightOfScreen*0.038,
          ),
          Text(
            'عدد التسبيحات',
            style: TextStyle(
              fontSize: 30
            ),
          ),
          SizedBox(
            height: heightOfScreen*0.025,
          ),
          Container(
            padding: EdgeInsets.symmetric(vertical: heightOfScreen*0.031,horizontal: widthOfScreen*0.05),
            decoration: BoxDecoration(
              color: AppStyle.baseColor.withOpacity(0.57),
              borderRadius: BorderRadius.circular(30)
              
            ),
            child: Text(
              tsbehatCounter.toString(),
              style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold,
                fontSize: 30
              ),
            ),
          ),
          SizedBox(
            height: heightOfScreen*0.015,
          ),
          ElevatedButton(
              onPressed: (){
                controller.forward(from: 0);
                setState((){
                  if(tsbehatCounter<33){
                    tsbehatCounter++;
                  }else{
                    tsbehatCounter = 0;
                    if(tsbehatIndex<3){
                      tsbehatIndex++;
                    }else{
                      tsbehatIndex = 0;
                    }

                  }
                  setRotaion(0.25);
                });
              },
              style: ElevatedButton.styleFrom(
                primary: AppStyle.baseColor,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(25)
                )
              ),
              child: Text(
                tsbehat[tsbehatIndex],
                style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.bold
                ),
              )
          )
        ],
      ),
    );
  }
  void setRotaion(double degrees){
    animation = Tween<double>(begin: beginAngle , end: endAngle).animate(controller);
    beginAngle+=degrees;
    endAngle+=degrees;
    print(beginAngle);
    print(endAngle);
  }
}
