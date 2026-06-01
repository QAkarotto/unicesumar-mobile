import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

typedef OnSearch = void Function(String searchString);

class GenreSearchRow extends ConsumerStatefulWidget {
  final OnSearch onSearch;
  final String initialValue;

  const GenreSearchRow(this.onSearch, {this.initialValue = '', super.key});

  @override
  ConsumerState<GenreSearchRow> createState() => _GenreSearchRowState();
}

class _GenreSearchRowState extends ConsumerState<GenreSearchRow> {
  late TextEditingController movieTextController;
  final FocusNode textFocusNode = FocusNode();

  @override
  void initState() {
    super.initState();
    movieTextController = TextEditingController(text: widget.initialValue);
  }

  @override
  void didUpdateWidget(covariant GenreSearchRow oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.initialValue != oldWidget.initialValue) {
      movieTextController.text = widget.initialValue;
    }
  }

  @override
  void dispose() {
    movieTextController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Row(mainAxisSize: MainAxisSize.max, children: [
      Expanded(
        child: Padding(
          padding: const EdgeInsets.only(left: 16.0, right: 16.0),
          child: TextField(
            style: TextStyle(color: Theme.of(context).colorScheme.onSurface),
            focusNode: textFocusNode,
            keyboardType: TextInputType.text,
            enableSuggestions: false,
            autofocus: false,
            onSubmitted: (value) {
              widget.onSearch(value);
            },
            controller: movieTextController,
            autocorrect: false,
            decoration: InputDecoration(
              filled: true,
              focusColor: Theme.of(context).colorScheme.surface,
              focusedBorder: null,
              enabledBorder: null,
              fillColor: Theme.of(context).colorScheme.surface,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(20),
                borderSide: BorderSide.none,
              ),
              hintText: 'movie name, genre',
              hintStyle: Theme.of(context).textTheme.bodyLarge?.copyWith(
                  color: Theme.of(context).colorScheme.onSurfaceVariant),
              suffixIcon: IconButton(
                onPressed: () {
                  movieTextController.clear();
                },
                icon: Icon(Icons.close,
                    color: Theme.of(context).colorScheme.onSurface),
              ),
              prefixIcon: IconButton(
                icon: Icon(Icons.search,
                    color: Theme.of(context).colorScheme.onSurface),
                onPressed: () {
                  widget.onSearch(movieTextController.text);
                },
              ),
            ),
          ),
        ),
      )
    ]);
  }
}
