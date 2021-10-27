// response model
{{#usecases}}export 'response/{{#snakeCase}}{{{name}}}{{/snakeCase}}_model.dart';
{{/usecases}}

// request body
{{#usecases}}{{#isHaveBody}}export 'request/{{#snakeCase}}{{{name}}}{{/snakeCase}}_body.dart';{{/isHaveBody}}
{{/usecases}}