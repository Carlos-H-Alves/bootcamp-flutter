import 'package:calc_imc2/model/imc_model.dart';

class ImcRepository {
  final List<ImcModel> _imcs = [];

  List<ImcModel> listar() {
    return _imcs;
  }

  void adicionar(ImcModel imc) {
    _imcs.add(imc);
  }
}
