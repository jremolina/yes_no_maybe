import 'package:dio/dio.dart';
import 'package:yes_no_maybe/domain/entities/message.dart';
import 'package:yes_no_maybe/infrastructure/models/yes_no_model.dart';

class GetYesNoAnswer {
  final _dio = Dio();

  Future<Message> getAnswer() async {
    final response = await _dio.get('https://yesno.wtf/api');
    final yesnoModel = YesNoModel.fromJson(response.data);

    // return Message(
    //     text: yesnoModel.answer,
    //     fromWho: FromWho.hers,
    //     imageUrl:yesnoModel.image);

    return yesnoModel.toMessageEntity();

    //throw UnimplementedError();
  }
}
