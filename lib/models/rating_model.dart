import 'package:equatable/equatable.dart';

class RatingModel extends Equatable {
  final num rate;
  final int count;

  const RatingModel({
    required this.rate,
    required this.count,
  });

  Map<String, dynamic> toMap() {
    return {
      'rate': rate,
      'count': count,
    };
  }

  factory RatingModel.fromMap(Map<String, dynamic> map) {
    return RatingModel(
      rate: map['rate'] ?? 0.0,
      count: map['count']?.toInt() ?? 0,
    );
  }

  @override
  List<Object?> get props => [rate, count];
}
