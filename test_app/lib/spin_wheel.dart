import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:test_app/values/constants.dart';
import 'package:test_app/values/images.dart';
import 'package:test_app/widgets/alignment_selector.dart';
import 'package:test_app/widgets/app_layout.dart';
import 'package:test_app/widgets/roll_button.dart';
import 'package:ui_lib/styles/app_theme.dart';
import 'package:ui_lib/ui_components_manager.dart';
import 'package:wheelspin_coins_rewards/wheelspin_coins_rewards_widget.dart';

class SpinWheel extends HookWidget {
  const SpinWheel({super.key});

  @override
  Widget build(BuildContext context) {
    final alignment = useState(Alignment.centerLeft);
    final selected = useStreamController<int>();
    final selectedIndex = useStream(selected.stream, initialData: 0).data ?? 0;
    int pickIndex =100;
    final isAnimating = useState(false);
    final isInit = useState(true);
    final alignmentSelector = AlignmentSelector(
      selected: alignment.value,
      onChanged: (v) => alignment.value = v!,
    );
    final _controller = useAnimationController(
      duration: Duration(milliseconds: 250),
    );

    

    final res = GameOrchestrationModel.fromJson(AppConstants.gameOrchestrationResponse);
    List<GameItems>? gameItems =
        res.gameOrchestrationResponse!.games!.isNotEmpty
            ? res.gameOrchestrationResponse?.games![0].gameItems
            : [];

    void handleRoll() {
      selected.add(
        roll(gameItems!.length),
      );
    }

    useEffect(() {

      if (isAnimating.value) {
        pickIndex=100;
        _controller.repeat(reverse: true);
        isInit.value=false;
      } else {        
        if(!isInit.value)
        {
          pickIndex=selectedIndex;
        }
        _controller.stop();
      }
      // return _controller.dispose;
    }, [isAnimating.value]);

    return AppLayout(
      child: Column(
        
        children: [
          _topSection(),
          Expanded(
            child: FortuneWheel(
              // onFocusItemChanged: (value) {
              //   print('------------->$value');
              //   print('=============>$selectedIndex');                
              //   if(!isAnimating.value)
              //   {                  
              //     pickIndex=value;                  
              //   }
              //   else
              //   {
              //     pickIndex=100;                  
              //   }
              // },
              // selectedIndex:selectedIndex,
              deviceHeight: MediaQuery.of(context).size.height,
              deviceWidth: MediaQuery.of(context).size.width,
              // styleStrategy:UniformStyleStrategy(),
              alignment: Alignment.centerLeft,
              selected: selected.stream,
              onAnimationStart: () => isAnimating.value = true,
              onAnimationEnd: () => isAnimating.value = false,
              onFling: handleRoll,
              hapticImpact: HapticImpact.medium,
              animateFirst: false,
              indicators: [
                FortuneIndicator(
                  alignment: alignment.value,
                  child: AnimatedBuilder(
                    animation: _controller,
                    builder: (context, child) {
                      // Use sine waves to create up and down rotation effects
                      final upAnglePercentage = 0.1; // 20%
                      final downAnglePercentage = 0.15; // 30%
                      final middleAngle =1.658;//1.8708; // 90 degrees in radians//1.5708
                      final upEndAngle = middleAngle -
                          (upAnglePercentage *
                              middleAngle); // 20% of 90 degrees up
                      final downEndAngle = middleAngle +
                          (downAnglePercentage *
                              middleAngle); // 30% of 90 degrees down
                      final currentAngle = middleAngle -
                          (_controller.value * (middleAngle - upEndAngle));
                      return Transform.rotate(
                        angle: 1.5708,
                        // angle: isAnimating.value
                        //     ? currentAngle
                        //     : 1.5708, // Full rotation
                        child: SizedBox(
                          width: 88,
                          height: 88,
                          child: Image.asset(Appimages.selectedSliceArrow,
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ],
              items: [
                for (GameItems it in gameItems ?? [])
                  FortuneItem(
                    // onVerticalDragUpdate: ,
                    child: Column(                      
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        SizedBox(
                            width:
                                MediaQuery.of(context).size.aspectRatio * 150,
                            child: Text(
                              it.outcomeName?.toUpperCase() ?? '',                              
                              softWrap: true,
                              maxLines: 2,
                              textAlign: TextAlign.center,
                              overflow: TextOverflow.fade,
                            )),
                        SizedBox(
                          height: 15,
                        ),
                       if (it.gameItemDisplayCriteria?.weightingType ==
                            AppConstants.monetary) ...[
                          Transform.rotate(
                            angle: 1.5708,
                            child: SizedBox(
                                width: MediaQuery.of(context).size.aspectRatio *
                                    140,
                                child: Text(
                                  it.outcomeValue?.replaceAll('USD ', '\$').toUpperCase() ??
                                      '',
                                  softWrap: true,
                                  maxLines: 1,
                                  textAlign: TextAlign.center,
                                  overflow: TextOverflow.fade,
                                  style: VGApplicationTheme.typography.wheelText
                                      .copyWith(
                                          color: 
                                              VGApplicationTheme.colors.base0),
                                )),
                          ),
                        ] else if (it.gameItemDisplayCriteria?.weighting ==
                            AppConstants.weighting3) ...[
                          Transform.rotate(
                            angle: 1.5708,
                            child: SizedBox(
                                width: MediaQuery.of(context).size.aspectRatio *
                                    140,
                                child: Text(
                                  it.outcomeValue
                                          ?.toString()
                                          .replaceAll('.0', '').toUpperCase() ??
                                      '',
                                  softWrap: true,
                                  maxLines: 1,
                                  textAlign: TextAlign.center,
                                  overflow: TextOverflow.fade,
                                  style: VGApplicationTheme.typography.wheelText
                                      .copyWith(
                                          color: VGApplicationTheme
                                              .colors.primary),
                                )),
                          ),
                        ] else if (it.gameItemDisplayCriteria?.weightingType ==
                            AppConstants.value) ...[
                          Transform.rotate(
                            angle: 1.5708,
                            child: SizedBox(
                                width: MediaQuery.of(context).size.aspectRatio *
                                    140,
                                child: Text(
                                  it.outcomeValue
                                          ?.toString()
                                          .replaceAll('.0', '').toUpperCase() ??
                                      '',
                                  softWrap: true,
                                  maxLines: 1,
                                  textAlign: TextAlign.center,
                                  overflow: TextOverflow.fade,
                                  style: VGApplicationTheme.typography.wheelText
                                      .copyWith(
                                          color: VGApplicationTheme
                                              .colors.base900),
                                )),
                          ),
                        ]
                      ],
                    ),
                    onTap: () => print(it),
                    sliceItemData: it,
                    selectedIndex:isAnimating.value==true? 100: pickIndex,
                  ),
              ],
            ),
          ),
          SizedBox(
            height: 40,
          )
        ],
      ),
    );
  }

Widget _topSection()
{
  return Padding(
    padding: const EdgeInsets.only(left: 16,right: 16),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(AppConstants.txtyoudiditnowspinit_001,style: VGApplicationTheme.typography.h2,),
        SizedBox(height: 16,),
        Text(AppConstants.txtswiptetospin_001,style: VGApplicationTheme.typography.pMedium,),
        SizedBox(height: 16,),
        Container(height: 32,        
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
                FaIcon(FontAwesomeIcons.lightCircleInfo,size: 18),
                SizedBox(width: 8,),
                Text(AppConstants.ctrl_txtwhatsonthewheel_001,style: VGApplicationTheme.typography.breakoutLinkPSmall.copyWith(color: VGApplicationTheme.colors.base900,  decorationColor:  VGApplicationTheme.colors.base900,),),   

        ],),),
        SizedBox(height: 8,),

      ],
    ),
  );
}

}
