import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:{{#snakeCase}}{{project_name}}{{/snakeCase}}/core/error/failures.dart';
import 'package:{{#snakeCase}}{{project_name}}{{/snakeCase}}/data/{{#snakeCase}}{{feature}}{{/snakeCase}}/datasources/{{#snakeCase}}{{feature}}{{/snakeCase}}_remote_data_source.dart';
import 'package:{{#snakeCase}}{{project_name}}{{/snakeCase}}/data/{{#snakeCase}}{{feature}}{{/snakeCase}}/models/models.dart';
import 'package:{{#snakeCase}}{{project_name}}{{/snakeCase}}/domain/{{#snakeCase}}{{feature}}{{/snakeCase}}/entities/entities.dart';
import 'package:{{#snakeCase}}{{project_name}}{{/snakeCase}}/domain/{{#snakeCase}}{{feature}}{{/snakeCase}}/repositories/{{#snakeCase}}{{feature}}{{/snakeCase}}_repository.dart';

const errorMsg = 'Something went wrong';

class {{#pascalCase}}{{feature}}{{/pascalCase}}RepositoryImpl implements {{#pascalCase}}{{feature}}{{/pascalCase}}Repository {
  {{#pascalCase}}{{feature}}{{/pascalCase}}RepositoryImpl(this.remoteDataSource);

  final {{#pascalCase}}{{feature}}{{/pascalCase}}RemoteDataSource remoteDataSource;

  {{#usecases}}
  @override
  Future<Either<Failure, {{#pascalCase}}{{name}}{{/pascalCase}}Entity>> {{method}}{{#pascalCase}}{{name}}{{/pascalCase}}({{#isHaveBody}}{{#pascalCase}}{{name}}{{/pascalCase}}Body body{{/isHaveBody}}) async {
    try {
      final remote{{#pascalCase}}{{name}}{{/pascalCase}} = await remoteDataSource.{{method}}{{#pascalCase}}{{name}}{{/pascalCase}}({{#isHaveBody}}body{{/isHaveBody}});
      return Right(remote{{#pascalCase}}{{name}}{{/pascalCase}});
    } on DioError catch (e) {
      // The request was made and the server responded with a status code
      // that falls out of the range of 2xx and is also not 304.
      if (e.response != null) {
        log('${e.response!.data}');
        log('${e.response!.headers}');
        return Left(ServerFailure(e.response!.data['message'].toString()));
      } else {
        // Something happened in setting up or sending the request
        //that triggered an Error
        log(e.message);
        return const Left(ServerFailure(errorMsg));
      }
    }
  }
  {{/usecases}}
}
