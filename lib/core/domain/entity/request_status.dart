enum RequestStatus {
  notInitiated,
  loading,
  finished,
  error;

  bool get isLoading => this==RequestStatus.loading;
  bool get isFinished => this==RequestStatus.finished;
  bool get hasError => this==RequestStatus.error;
}
