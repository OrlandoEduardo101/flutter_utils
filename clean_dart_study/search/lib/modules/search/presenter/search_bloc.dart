import 'package:bloc/bloc.dart';
import 'package:clean_dart_study/modules/search/domain/usecases/search_by_text.dart';
import 'package:clean_dart_study/modules/search/presenter/states/state.dart';
import 'package:rxdart/rxdart.dart';

class SearchBloc extends Bloc<String, ISearchState> {
  final ISearchByText usecase;

  SearchBloc(this.usecase) : super(SearchStart());

  @override
  Stream<ISearchState> mapEventToState(String searchText) async* {
    yield SearchLoading();
    final result = await usecase(searchText);
    yield result.fold((l) => SearchError(l), (r) => SearchSucces(r));
  }

  @override
  Stream<Transition<String, ISearchState>> transformEvents(Stream<String> events, transitionFn) {
    return super.transformEvents(events.debounceTime(Duration(milliseconds: 800)), transitionFn);
  }
}
