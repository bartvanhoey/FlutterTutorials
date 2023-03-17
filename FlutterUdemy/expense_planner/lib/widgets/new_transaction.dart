import 'package:expense_planner/widgets/adaptive_text_button.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class NewTransaction extends StatefulWidget {
  final Function addNewTransaction;

  NewTransaction({super.key, required this.addNewTransaction}) {
    print('==Constructor NewTransaction Widget');
  }

  @override
  State<NewTransaction> createState() {
    print('==CreateState NewTransaction Widget');
    return _NewTransactionState();
  }
}

class _NewTransactionState extends State<NewTransaction> {
  final _titleController = TextEditingController();
  final _amountController = TextEditingController();
  DateTime? _pickedDate;

  _NewTransactionState() {
    print('==Constructor _NewTransactionState Widget');
  }

  @override
  void initState() {
    print('==initState');
    super.initState();
  }

  @override
  void didUpdateWidget(covariant NewTransaction oldWidget) {
    // TODO: implement didUpdateWidget
    print('==didUpdateWidget');
    super.didUpdateWidget(oldWidget);
  }

  @override
  void dispose() {
    // TODO: implement dispose
    print('==dispose');
    super.dispose();
  }

  void _submitData() {
    if (_amountController.text.isEmpty) return;

    final enteredTitle = _titleController.text;
    final enteredAmount = _amountController.text == ''
        ? 0.0
        : double.parse(_amountController.text);

    if (enteredTitle.isEmpty || enteredAmount <= 0.0 || _pickedDate == null) {
      return;
    }

    widget.addNewTransaction(enteredTitle, enteredAmount, _pickedDate);
    Navigator.of(context).pop();
  }

  void _showDatePicker() {
    showDatePicker(
            context: context,
            initialDate: DateTime.now(),
            firstDate: DateTime(2023),
            lastDate: DateTime.now())
        .then((pickedDate) {
      if (pickedDate == null) {
        return;
      }
      setState(() {
        _pickedDate = pickedDate;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Card(
        elevation: 5,
        child: Container(
          margin: EdgeInsets.only(
              top: 10,
              left: 10,
              right: 10,
              bottom: MediaQuery.of(context).viewInsets.bottom + 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              TextField(
                  decoration: const InputDecoration(labelText: 'Title'),
                  controller: _titleController),
              TextField(
                decoration: const InputDecoration(labelText: 'Amount'),
                controller: _amountController,
                keyboardType:
                    const TextInputType.numberWithOptions(decimal: true),
                onSubmitted: (_) => _submitData(),
              ),
              SizedBox(
                height: 70,
                child: Row(
                  children: [
                    Expanded(
                      child: Text(_pickedDate == null
                          ? 'No date chosen'
                          : 'Picked Date: ${DateFormat.yMd().format(_pickedDate as DateTime)}'),
                    ),
                    AdaptiveTextButton(
                        buttonText: 'Choose date',
                        buttonPressHandler: _showDatePicker)
                    // AdaptiveTextButton is a reusable Widget and replaces the code below
                    // Platform.isIOS
                    //     ? CupertinoButton(
                    //         child: const Text('Choose Date',
                    //             style: TextStyle(
                    //                 fontWeight: FontWeight.bold, fontSize: 16)),
                    //         onPressed: () => _showDatePicker())
                    //     : TextButton(
                    //         style: const ButtonStyle(
                    //             foregroundColor:
                    //                 MaterialStatePropertyAll(Colors.purple)),
                    //         onPressed: () => _showDatePicker(),
                    //         child: const Text('Choose Date',
                    //             style: TextStyle(
                    //                 fontWeight: FontWeight.bold, fontSize: 16)),
                    //       )
                    //-----------------------------------------------------------------------
                  ],
                ),
              ),
              ElevatedButton(
                  onPressed: () => _submitData(),
                  style: const ButtonStyle(
                      foregroundColor: MaterialStatePropertyAll(Colors.white)),
                  child: const Text('Add Transaction')),
            ],
          ),
        ),
      ),
    );
  }
}
