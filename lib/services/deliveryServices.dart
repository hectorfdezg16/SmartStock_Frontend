import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:rlbasic/models/delivery.dart';

class DeliveryServices {
  Dio dio = new Dio();
  var url = "http://localhost:4000/api/delivery/";
  //var url = "http://10.0.2.2:4000/api/delivery/";

  getDeliveriesUser(String id) async {
    try {
      final resp = await dio.get(url + id + '/deliveries/',
          options: Options(contentType: Headers.formUrlEncodedContentType));
      print(resp.data);

      final List<Delivery> deliverylist;
      deliverylist =
          (resp.data as List).map((i) => Delivery.fromJson(i)).toList();

      return deliverylist;
    } catch (e) {
      print(e);
      if (e is DioError) {
        Fluttertoast.showToast(
            msg: 'vacio',
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.BOTTOM,
            timeInSecForIosWeb: 3);
      }
      final List<Delivery> deliverylist=[];
      return deliverylist;
    }
  }

  getReadyDeliveries(String id) async {
    try {
      final resp = await dio.get(url + id + '/readydeliveries/',
          options: Options(contentType: Headers.formUrlEncodedContentType));
      print(resp.data);

      final List<Delivery> deliverylist;
      deliverylist =
          (resp.data as List).map((i) => Delivery.fromJson(i)).toList();

      return deliverylist;
    } catch (e) {
      print(e);
      if (e is DioError) {
        Fluttertoast.showToast(
            msg: 'vacio',
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.BOTTOM,
            timeInSecForIosWeb: 3);
      }
      final List<Delivery> deliverylist=[];
      return deliverylist;
    }
  }

  setReadyDelivery(String id) async {
          print(id);

    try {
      return await dio.put(url + 'readydelivery/'+id,
          options: Options(contentType: Headers.formUrlEncodedContentType));
    } catch (e) {
      if (e is DioError) {
        print(e);
        Fluttertoast.showToast(
            msg: 'Ha habido un error',
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.BOTTOM,
            timeInSecForIosWeb: 3);
      }
    }
  }
}
