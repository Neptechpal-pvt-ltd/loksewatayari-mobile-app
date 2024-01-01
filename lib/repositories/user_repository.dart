

import '../model/syllabus_structure.dart';

abstract class SyllabusStructures {
  Future<List<SyllabusStructure>?> getSyllabusStructure(String id);
}
