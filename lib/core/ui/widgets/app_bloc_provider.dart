import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

typedef BlocOf<S> = StateStreamableSource<S>;

///Works as a wrapper/provider for a certain [T] bloc
class AppBlocProvider<T extends BlocOf<S>, S> extends StatelessWidget {
  const AppBlocProvider({
    super.key,
    this.child,
    this.lazy = false,
    required this.create,
    this.listener,
    this.builder,
  });

  final Widget? child;
  final T Function(BuildContext context) create;
  final void Function(BuildContext context, S state)? listener;
  final Widget Function(BuildContext context, S state)? builder;

  final bool lazy;

  @override
  Widget build(BuildContext context) {
    return BlocProvider<T>(
      create: create,
      lazy: lazy,
      child: Builder(
        //builder is pushed to ensure the bloc being provided
        builder: (context) {
          if (builder != null) {
            if (listener != null) {
              return BlocConsumer<T, S>(
                builder: builder!,
                listener: listener!,
              );
            } else {
              return BlocBuilder<T, S>(builder: builder!);
            }
          } else if (listener != null) {
            return BlocListener<T, S>(
              listener: listener!,
              child: child,
            );
          }
          return child ?? const SizedBox();
        },
      ),
    );
  }
}
