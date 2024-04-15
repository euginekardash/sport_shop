import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class CloudHelperFunctions{

  static Widget? checkSingleRecordState<T>(AsyncSnapshot<T> snapshot){
    if(snapshot.connectionState == ConnectionState.waiting){
      return Center(child: CircularProgressIndicator(),);
    }

    if(!snapshot.hasData || snapshot.data == null){
      return const Center(child: Text('No data found'),);
    }

    if(snapshot.hasError) {
      return const Center(child: Text('Something went wrong'),);
    }

    return null;
  }

  static Widget? checkMultiRecordState<T>({required AsyncSnapshot<List<T>> snapshot, Widget? loader, Widget? error, Widget? nothingFound}){
    if(snapshot.connectionState == ConnectionState.waiting){
      if(loader != null) return loader;
      return Center(child: CircularProgressIndicator(),);
    }

    if(!snapshot.hasData || snapshot.data == null || snapshot.data!.isEmpty){
      if(nothingFound != null) return nothingFound;
      return const Center(child: Text('No data found'),);
    }

    if(snapshot.hasError) {
      if(error != null) return error;
      return const Center(child: Text('Something went wrong'),);
    }
    return null;
  }

}