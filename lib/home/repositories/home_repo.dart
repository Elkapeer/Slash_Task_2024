import 'package:slash_task/home/models/home_data_model.dart';
import 'package:slash_task/core/services/api_status.dart';
import 'package:slash_task/core/services/services.dart';

class HomeRepository{
  Future<dynamic> getHomeData() async {
    final res = await Services().fetchData(homeDataUrl);
    if(res is Success){
      return HomeDataModel.fromJson(res.responseBody as Map<String, dynamic>);
    }else if(res is Fail){
      return res; //return the error object
    }else{
      throw Exception("This shouldn't be happening");
    }
  }
}