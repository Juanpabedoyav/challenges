import 'package:challenge1/features/shares/domain/usecases/get_shares.dart';
import 'package:challenge1/features/shares/presentation/provider/shares_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

// SharesScreen
class SharesScreen extends StatelessWidget {
  const SharesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final useCase = context.read<GetShares>();
    return ChangeNotifierProvider(
      create: (context) => SharesProvider(getShares: useCase),
      child: const SharesView(),
    );
  }
}

// SharesView
class SharesView extends StatefulWidget {
  const SharesView({super.key});

  @override
  State<SharesView> createState() => _SharesViewState();
}

class _SharesViewState extends State<SharesView> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Provider.of<SharesProvider>(context, listen: false).fetchShares();
    });
  }

  @override
  Widget build(BuildContext context) {
    final status = context.select((SharesProvider provider) => provider.status);
    return status == SharesStatus.initial
        ? const Center(child: CircularProgressIndicator())
        : const _SharesContent();
  }
}

// SharesContent

class _SharesContent extends StatefulWidget {
  const _SharesContent({super.key});

  @override
  State<_SharesContent> createState() => __SharesContentState();
}

class __SharesContentState extends State<_SharesContent> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Shares'),
        ),
        body: Consumer<SharesProvider>(
          builder: (context, value, child) {
            final shareList = value.shares;
            return ListView.builder(
                itemCount: value.shares.length,
                itemBuilder: (context, index) {
                  final item = shareList[index];
                  return ListTile(
                    title: Text(item.symbol),
                    subtitle: Text(item.currencyBase),
                    trailing: Text(item.currencyQuote),
                    onTap: () => Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) =>
                            Center(child: Text(item.symbol)))),
                  );
                });
          },
        ));
  }
}
