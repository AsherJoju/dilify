import 'package:uuid/uuid.dart';

const Uuid uuid = Uuid();

String getRandomUuid() => uuid.v4();
