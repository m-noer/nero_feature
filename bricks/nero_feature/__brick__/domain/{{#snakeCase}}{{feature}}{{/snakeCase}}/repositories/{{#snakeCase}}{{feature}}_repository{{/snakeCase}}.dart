import 'package:dartz/dartz.dart';
import 'package:{{#snakeCase}}{{project_name}}{{/snakeCase}}/core/error/failures.dart';
import 'package:{{#snakeCase}}{{project_name}}{{/snakeCase}}/data/{{#snakeCase}}{{feature}}{{/snakeCase}}/models/models.dart';
import 'package:{{#snakeCase}}{{project_name}}{{/snakeCase}}/domain/{{#snakeCase}}{{feature}}{{/snakeCase}}/entities/entities.dart';

abstract class {{#pascalCase}}{{feature}}{{/pascalCase}}Repository {
  {{#usecases}}Future<Either<Failure, {{#pascalCase}}{{response}}{{/pascalCase}}Entity>> {{method}}{{#pascalCase}}{{name}}{{/pascalCase}}({{#isHaveBody}}{{#pascalCase}}{{bodyName}}{{/pascalCase}} body{{/isHaveBody}});
  {{/usecases}}
}
