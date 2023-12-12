import 'package:hive/hive.dart';
 
 part 'models.g.dart';

@HiveType(typeId: 1)
class Profilemodel{
  @HiveField(0)
    String? gender;
    @HiveField(1)
    int? height;
    @HiveField(2)
    int?  Weight;
    @HiveField(3)
    int?  BIM;
    @HiveField(4)
    String?  profile;     
  Profilemodel({
 this. gender,
 this. height,
 this. Weight,
 this. profile,
  this. BIM,
  });
}