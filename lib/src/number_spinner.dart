import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class ChecklistAddNewNumberSpinner extends StatefulWidget {
  @override
  _ChecklistAddNewNumberSpinnerState createState() =>
      _ChecklistAddNewNumberSpinnerState();
}

class _ChecklistAddNewNumberSpinnerState
    extends State<ChecklistAddNewNumberSpinner> {
  bool _error = false;
  static final TextEditingController _controller = new TextEditingController();

  @override
  void initState() {
    _controller.text = '1';
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40,
      padding: EdgeInsets.zero,
      width: 72,
      decoration: _error == false
          ? BoxDecoration(
              color: Colors.blueAccent,
            )
          : BoxDecoration(
              color: Colors.blueAccent,
              border: Border.all(color: Colors.red),
              borderRadius: BorderRadius.circular(0),
            ),
      child: Row(
        children: [
          Expanded(
            child: TextFormField(
              decoration: _inputDecoration(),
              style: _inputTextStyle(),
              controller: _controller,
              keyboardType: TextInputType.numberWithOptions(
                decimal: false,
                signed: true,
              ),
              inputFormatters: <TextInputFormatter>[
                FilteringTextInputFormatter.digitsOnly
              ],
              onChanged: (value) {
                if (value.isEmpty) {
                  setState(() {
                    _error = true;
                  });
                } else {
                  setState(() {
                    _error = false;
                  });
                }
              },
            ),
          ),
          Container(
            height: 40,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                GestureDetector(
                  onTap: () {
                    print('check-1');
                    int _currentValue = int.parse(_controller.text);
                    setState(
                      () {
                        _currentValue++;
                        _controller.text =
                            (_currentValue).toString(); // incrementing value
                      },
                    );
                  },
                  child: Icon(
                    Icons.arrow_drop_up,
                    size: 18,
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    print('check-2');
                    int currentValue = int.parse(_controller.text);
                    setState(
                      () {
                        currentValue--;
                        _controller.text = (currentValue > 1 ? currentValue : 1)
                            .toString(); // decrementing value
                      },
                    );
                  },
                  child: Icon(
                    Icons.arrow_drop_down,
                    size: 18,
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}

TextStyle _inputTextStyle() {
  return TextStyle(
    fontWeight: FontWeight.w500,
    fontSize: 16,
  );
}

InputDecoration _inputDecoration() {
  return InputDecoration(
    contentPadding:
        const EdgeInsets.only(left: 8.0, bottom: 8.0, top: 7.0, right: 4),
    border: InputBorder.none,
    focusedBorder: InputBorder.none,
    enabledBorder: InputBorder.none,
    errorBorder: InputBorder.none,
    focusedErrorBorder: InputBorder.none,
  );
}
