import 'package:flutter/material.dart';
import 'package:timeline_tile/timeline_tile.dart';

class TimelineTaskManager extends StatefulWidget {
  const TimelineTaskManager({Key? key}) : super(key: key);

  @override
  State<TimelineTaskManager> createState() => _TimelineTaskManagerState();
}

class _TimelineTaskManagerState extends State<TimelineTaskManager> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            const Text('Timelines', style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
            Row(
              children: const <Widget>[
                Text('This month', style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold)),
                SizedBox(width: 5),
                Icon(Icons.filter_list_outlined),
              ],
            )
          ],
        ),
        const SizedBox(height: 10),
        _DatePicker(),
      ],
    );
  }
}

class _DatePicker extends StatefulWidget {
  const _DatePicker({Key? key}) : super(key: key);

  @override
  State<_DatePicker> createState() => _DatePickerState();
}

class _DatePickerState extends State<_DatePicker> {
  final List<int> _period = [20, 27, 4, 11, 18, 25, 2, 5, 13];
  int _selectedIndex = 1;

  @override
  Widget build(BuildContext context) {
    return Column(children: <Widget>[
      SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        physics: const BouncingScrollPhysics(),
        child: IntrinsicHeight(
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: List.generate(
                    _period.length,
                    (index) => GestureDetector(
                        onTap: () => setState(() => _selectedIndex = index),
                        child: Container(
                          width: 50,
                          padding: EdgeInsets.all(10),
                          child: Text('${_period[index]}',
                              style: TextStyle(
                                backgroundColor: _selectedIndex == index ? Colors.blue : Colors.transparent,
                                color: _selectedIndex == index ? Colors.white : Colors.grey[600],
                              )),
                        ))))),
      ),
      Container(
        height: 12.5,
        child: Stack(
          children: <Widget>[
            Divider(color: Colors.grey[600]),
            Positioned(
                top: -3,
                left: _selectedIndex * 50,
                child: Container(
                  margin: EdgeInsets.only(
                    left: 2,
                  ),
                  child: Icon(Icons.arrow_drop_down_outlined, color: Colors.blue, size: 24),
                ))
          ],
        ),
      ),
      Stack(
        children: [
          Positioned(
              top: 0,
              left: _selectedIndex * 50,
              child:  _TaskTimeline()),

          AnimatedPositioned(
              child: ListView.separated(
                  shrinkWrap: true,
                  scrollDirection: Axis.vertical,
                  physics: const BouncingScrollPhysics(),
                  itemBuilder: (context, index) {
                    return _Task();
                  },
                  separatorBuilder: (_, index) => const SizedBox(height: 5),
                  itemCount: 3),
              duration: Duration(seconds: 1))
        ],
      )
    ]);
  }
}

class _Task extends StatelessWidget {
  const _Task({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(15),
      padding: EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.purpleAccent,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: Colors.purpleAccent, width: 1),
      ),
      child: Column(
        children: <Widget>[
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  CircularProgressIndicator(
                    value: 0.3,
                    backgroundColor: Colors.purple[600],
                    strokeWidth: 12,
                    valueColor: AlwaysStoppedAnimation<Color>(Colors.purpleAccent[700] ?? Colors.grey),
                  ),
                  Container(
                    margin: EdgeInsets.only(left: 10),
                    child: Column(
                      children: <Widget>[
                        const Text('Become a UX Designer',
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w600,
                            )),
                        Text('Learn the skills & get the Job',
                            style: TextStyle(
                              fontSize: 14,
                              color: Colors.grey[700],
                            )),
                      ],
                    ),
                  ),
                ],
              ),
              Container(
                child: Icon(Icons.heart_broken, size: 20),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class _TaskTimeline extends StatelessWidget {
  const _TaskTimeline({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: 2),
      width: 20,
      height: 500,
      child: TimelineTile(
        alignment: TimelineAlign.end,
        lineXY: 0,
        isFirst: false,
        isLast: true,
        indicatorStyle: IndicatorStyle(
          indicatorXY: 0.7,
          width: 16,
          indicator: Container(
            alignment: Alignment.bottomCenter,
            decoration: BoxDecoration(
              color: Colors.white,
              shape: BoxShape.circle,
              border: Border.all(color: Colors.blue, width: 5),
            ),
          ),
        ),
        beforeLineStyle: const LineStyle(
          thickness: 1,
          color: Colors.blue,
        ),
      ),
    );
  }
}
