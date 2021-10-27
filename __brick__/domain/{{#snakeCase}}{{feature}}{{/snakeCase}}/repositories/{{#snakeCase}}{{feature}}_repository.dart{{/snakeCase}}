import 'package:dartz/dartz.dart';
import 'package:{{#snakeCase}}{{project_name}}{{/snakeCase}}/core/error/failures.dart';
import 'package:{{#snakeCase}}{{project_name}}{{/snakeCase}}/data/{{#snakeCase}}{{feature}}{{/snakeCase}}/models/models.dart';
import 'package:{{#snakeCase}}{{project_name}}{{/snakeCase}}/domain/{{#snakeCase}}{{feature}}{{/snakeCase}}/entities/entities.dart';

abstract class {{#pascalCase}}{{feature}}{{/pascalCase}}Repository {
  {{#usecases}}Future<Either<Failure, {{#pascalCase}}{{name}}{{/pascalCase}}Entity>> {{method}}{{#pascalCase}}{{name}}{{/pascalCase}}({{#isHaveBody}}{{#pascalCase}}{{name}}{{/pascalCase}}Body body{{/isHaveBody}});
  {{/usecases}}
}
