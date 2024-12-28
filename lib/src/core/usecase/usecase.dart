abstract class UseCase<T, P> {
  Stream<T> call({P params});
}