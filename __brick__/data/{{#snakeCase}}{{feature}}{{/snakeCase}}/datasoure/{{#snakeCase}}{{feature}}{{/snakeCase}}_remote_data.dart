import 'package:dio/dio.dart';
import 'package:{{#snakeCase}}{{project_name}}{{/snakeCase}}/core/constants/api_path.dart';
import 'package:{{#snakeCase}}{{project_name}}{{/snakeCase}}/data/{{#snakeCase}}{{feature}}{{/snakeCase}}/models/models.dart';
import 'package:{{#snakeCase}}{{project_name}}{{/snakeCase}}/domain/{{#snakeCase}}{{feature}}{{/snakeCase}}/entities/entities.dart';

abstract class {{#pascalCase}}{{feature}}{{/pascalCase}}RemoteDataSource {
  {{#usecases}}Future<{{#pascalCase}}{{name}}{{/pascalCase}}Entity> {{method}}{{#pascalCase}}{{name}}{{/pascalCase}}({{#isHaveBody}}{{#pascalCase}}{{name}}{{/pascalCase}}Body body{{/isHaveBody}});
  {{/usecases}}
}

class {{#pascalCase}}{{feature}}{{/pascalCase}}RemoteDataSourceImpl implements {{#pascalCase}}{{feature}}{{/pascalCase}}RemoteDataSource {
  {{#pascalCase}}{{feature}}{{/pascalCase}}RemoteDataSourceImpl(this._client);

  final Dio _client;
  {{#usecases}}
  @override
  Future<{{#pascalCase}}{{name}}{{/pascalCase}}Entity> requestLogin({{#isHaveBody}}{{#pascalCase}}{{name}}{{/pascalCase}}Body body{{/isHaveBody}}) async {
    try {
      final _response = await _client.{{#snakeCase}}{{method}}{{/snakeCase}}<Map<String, dynamic>>(
        ApiPath.{{#snakeCase}}{{method}}{{/snakeCase}},
        data: body.toJson(),
      );

      return {{#pascalCase}}{{name}}{{/pascalCase}}Model.fromJson(_response.data!);
    } on DioError catch (e) {
      throw DioError(
        requestOptions: e.requestOptions,
        error: e.error,
        response: e.response,
      );
    }
  }
  {{/usecases}}
}
