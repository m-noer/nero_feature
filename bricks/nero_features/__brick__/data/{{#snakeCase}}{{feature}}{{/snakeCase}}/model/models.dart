// response model
{{#usecases}}export '{{#snakeCase}}{{{name}}}{{/snakeCase}}_model.dart';
{{/usecases}}

// request body
{{#usecases}}{{#isHaveBody}}export '{{#snakeCase}}{{{name}}}{{/snakeCase}}_body.dart';{{/isHaveBody}}
{{/usecases}}