import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:kheloo_app/live_withdrawl/data/withdrawal_data.dart';
import 'package:kheloo_app/live_withdrawl/model/witdrawal_model.dart';

class WithdrawalContainer extends StatefulWidget {
  const WithdrawalContainer({super.key});

  @override
  _WithdrawalContainerState createState() => _WithdrawalContainerState();
}

class _WithdrawalContainerState extends State<WithdrawalContainer> {
  Timer? timer;
  List<WithdrawalListModel>? withdrawals;
  int currentIndex = 0;

  @override
  void initState() {
    super.initState();
    withdrawals = getNextWithdrawals();
    startTimer();
  }

  @override
  void dispose() {
    timer!.cancel();
    super.dispose();
  }

  void startTimer() {
    timer = Timer.periodic(const Duration(seconds: 2), (timer) {
      setState(() {
        currentIndex = (currentIndex + 4) % withdrawals!.length;
      });
    });
  }

  String formatTimeDifference(int secondsAgo) {
    if (secondsAgo < 60) {
      return '$secondsAgo seconds ago';
    } else if (secondsAgo < 3600) {
      int minutes = (secondsAgo / 60).floor();
      return '$minutes minutes ago';
    } else {
      int hours = (secondsAgo / 3600).floor();
      return '$hours hours ago';
    }
  }

  @override
  Widget build(BuildContext context) {
    List<WithdrawalListModel> displayedWithdrawals = withdrawals!.sublist(
      currentIndex,
      currentIndex + 4,
    );

    return Scaffold(
      body: Center(
        child: Container(
          color: Colors.purple,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Expanded(
                    child: _buildWithdrawalItem(displayedWithdrawals[0]),
                  ),
                  Expanded(
                    child: _buildWithdrawalItem(displayedWithdrawals[1]),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Expanded(
                    child: _buildWithdrawalItem(displayedWithdrawals[2]),
                  ),
                  Expanded(
                    child: _buildWithdrawalItem(displayedWithdrawals[3]),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildWithdrawalItem(WithdrawalListModel withdrawal) {
    return ListTile(
      title: Text(
        ' ${withdrawal.name} \$${withdrawal.amount.toStringAsFixed(2)}',
        style: const TextStyle(
          fontSize: 15.0,
          color: Colors.white,
        ),
      ),
      leading: const Icon(CupertinoIcons.profile_circled,
      color: Colors.white70,
      size: 40,),
      subtitle: Text(
        ' ${formatTimeDifference(withdrawal.time)}',
        style: const TextStyle(
          fontSize: 12.0,
          color: Colors.white,
        ),
      ),
    );
  }
}
