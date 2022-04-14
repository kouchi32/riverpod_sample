import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:go_router/go_router.dart';
import 'package:riverpod_sample/const/routes.dart';

class WelcomePage extends StatelessWidget {
  const WelcomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => Scaffold(
        body: const _Body(),
        appBar: AppBar(
          title: Text(
            AppLocalizations.of(context)!.welcome,
          ),
        ),
      );
}

class _Body extends StatelessWidget {
  const _Body({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => GridView.count(
        crossAxisCount: 3,
        padding: const EdgeInsets.all(8),
        children: [
          _ContentCard(
            routePath: Routes.counter,
            title: AppLocalizations.of(context)!.counter,
            description: AppLocalizations.of(context)!.counterDescription,
          )
        ],
      );
}

class _ContentCard extends StatelessWidget {
  const _ContentCard({
    Key? key,
    required this.routePath,
    required this.title,
    required this.description,
  }) : super(key: key);
  final String routePath;
  final String title;
  final String description;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: InkWell(
        borderRadius: BorderRadius.circular(4),
        onTap: () => context.push(routePath),
        child: Padding(
          padding: const EdgeInsets.all(12),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: Theme.of(context).textTheme.subtitle1,
              ),
              const SizedBox(height: 2),
              Expanded(
                child: Text(
                  description,
                  style: Theme.of(context).textTheme.caption,
                  overflow: TextOverflow.fade,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
