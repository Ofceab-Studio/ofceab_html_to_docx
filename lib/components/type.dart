import 'package:ofceab_docx_builder/components/attributes.dart';
import 'package:ofceab_docx_builder/components/base_components.dart';

class TypesComponent extends WordComponent {
  static const _label = 'Types';
  TypesComponent(
      {required List<WordComponent> children,
      required List<AttributeComponent> attributes})
      : super(children: children, label: _label, attributes: [
          TextAttributeComponent(
              key: "xmlns",
              value:
                  "http://schemas.openxmlformats.org/package/2006/content-types"),
          ...attributes
        ]);
}
