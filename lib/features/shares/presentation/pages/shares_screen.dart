import 'package:challenge1/features/shares/presentation/bloc/shares/shares_bloc.dart';
import 'package:challenge1/features/shares/presentation/bloc/shares/shares_state.dart';
import 'package:challenge1/features/shares/presentation/widgets/shares_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SharesScreen extends StatelessWidget {
  const SharesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<SharesBloc, SharesState>(
        builder: (context, state) {
          if (state is FetchSharesLoading) {
            return const CircularProgressIndicator();
          } else if (state is FetchSharesLoaded) {
            return SharesList(sharesData: state.shares);
          } else if (state is FetchSharesError) {
            return Text(state.error);
          }
          return Container();
        },
      ),
    );
  }
}
