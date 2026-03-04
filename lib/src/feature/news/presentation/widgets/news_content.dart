part of '../screens/news_screen.dart';

class _NewsContent extends StatelessWidget {
  const _NewsContent();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NewsBloc, NewsState>(
      builder: (BuildContext context, NewsState state) {
        return state.maybeWhen(
          loading: () => const _NewsLoadingContent(),
          success: (news) => _NewsContentState(news: news),
          error: (message) => const _NewsErrorContent(),
          orElse: () => const _NewsEmptyContent(),
        );
      },
    );
  }
}

class _NewsLoadingContent extends StatelessWidget {
  const _NewsLoadingContent();

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.translucent,
      onTap: () => FocusScope.of(context).unfocus(),
      child: CustomScrollView(
        slivers: [
          SliverFillRemaining(child: Center(child: LoadingIndicatorWidget())),
        ],
      ),
    );
  }
}

class _NewsErrorContent extends StatelessWidget {
  const _NewsErrorContent();

  @override
  Widget build(BuildContext context) {
    final t = AppLocalizations.of(context);

    return GestureDetector(
      behavior: HitTestBehavior.translucent,
      onTap: () => FocusScope.of(context).unfocus(),
      child: CustomScrollView(
        slivers: [
          SliverFillRemaining(
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Icon(Icons.error, size: 48, color: Colors.red),
                  const SizedBox(height: 16),
                  Text(
                    '${t!.timetableError}: Не удалось загрузить расписание',
                    textAlign: TextAlign.center,
                    style: const TextStyle(fontSize: 16),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _NewsEmptyContent extends StatelessWidget {
  const _NewsEmptyContent();

  @override
  Widget build(BuildContext context) {
    final t = AppLocalizations.of(context);

    return GestureDetector(
      behavior: HitTestBehavior.translucent,
      onTap: () => FocusScope.of(context).unfocus(),
      child: CustomScrollView(
        slivers: [
          SliverFillRemaining(
            child: Center(
              child: Text(
                t!.timetableNotFoundData,
                style: const TextStyle(fontSize: 16, color: Colors.grey),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _NewsContentState extends StatefulWidget {
  final List<News> news;

  const _NewsContentState({required this.news});

  @override
  State<_NewsContentState> createState() => _NewsContentStateState();
}

class _NewsContentStateState extends State<_NewsContentState> {
  Future<void> _refreshNews() async {
    context.read<NewsBloc>().add(NewsEvent.loadData());

    await Future.delayed(const Duration(seconds: 3));
  }

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: _refreshNews,
      child: GestureDetector(
        behavior: HitTestBehavior.translucent,
        onTap: () => FocusScope.of(context).unfocus(),
        child: CustomScrollView(
          slivers: [
            SliverAppBar(
              pinned: true,
              backgroundColor: Theme.of(context).colorScheme.surface,
              title: Text(
                "Новости СФУ",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              bottom: PreferredSize(
                preferredSize: const Size.fromHeight(56),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: TextField(
                    decoration: InputDecoration(
                      prefixIcon: const Icon(Icons.search),
                      hintText: 'Найти новость...',
                      filled: true,
                      fillColor: Theme.of(context).brightness == Brightness.light
                          ? Colors.orange.withOpacity(0.1)
                          : Colors.grey.withOpacity(0.2),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide: BorderSide.none,
                      ),
                    ),
                  ),
                ),
              ),
            ),
            SliverPadding(
              padding: EdgeInsets.only(
                top: 16,
                bottom: MediaQuery.of(context).padding.bottom + 16,
                left: 16,
                right: 16,
              ),
              sliver: SliverList.builder(
                itemCount: widget.news.length,
                itemBuilder: (item, index) => Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadiusGeometry.circular(12),
                    side: BorderSide(
                      color: Theme.of(context).colorScheme.primary,
                      width: 1,
                    ),
                  ),
                  color: Colors.transparent,
                  elevation: 0,
                  child: Column(
                    children: [
                      ListTile(
                        leading: CircleAvatar(radius: 20),
                        title: Text(
                          widget.news[index].author,
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        subtitle: Text(
                          DateFormat.yMMMMEEEEd(
                            'ru',
                          ).format(widget.news[index].date),
                        ),
                        trailing: Icon(Icons.more_vert),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                          vertical: 8.0,
                          horizontal: 16,
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              widget.news[index].title,
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 16,
                              ),
                            ),
                            const SizedBox(height: 8),
                            Text(widget.news[index].text),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
