import 'package:macros/macros.dart';

macro class Freezer implements ClassDeclarationsMacro {
  const Freezer();

  @override
  Future<void> buildDeclarationsForClass(
    ClassDeclaration clazz,
    MemberDeclarationBuilder builder,
  ) async {
    // 1. 対象クラスの全フィールドを取得
    final allFields = await builder.fieldsOf(clazz);

    // 2. 全フィールドを Nullable な引数コードに変換
    // 例: String? name
    final namedParams =
        allFields
            .map(
              (field) => ParameterCode(
                name: field.identifier.name,
                type: field.type.code.asNullable,
                keywords: const [],
                defaultValue: null,
              ),
            )
            .toList();

    // 3. 全フィールドをコピーするコードに変換
    // 例: name: name ?? this.name
    final copiedFields =
        allFields
            .map(
              (field) => RawCode.fromParts([
                '${field.identifier.name}: ${field.identifier.name} ?? ',
                field.identifier,
              ]),
            )
            .toList();

    // 4. copyWith メソッドを対象クラス内で宣言
    builder.declareInType(
      DeclarationCode.fromParts([
        clazz.identifier,
        ' copyWith({',
        // 引数部分
        ...namedParams.joinAsCode(', '),
        '}) => ',
        clazz.identifier,
        '(',
        // コピー部分
        ...copiedFields.joinAsCode(', '),
        ');',
      ]),
    );
  }
}
