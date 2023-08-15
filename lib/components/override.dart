import 'package:ofceab_docx_builder/components/attributes.dart';
import 'package:ofceab_docx_builder/components/base_components.dart';

class OverrideComponent extends WordComponent {
  static const _label = 'Override';
  OverrideComponent(
      {required List<WordComponent> children,
      required List<AttributeComponent> attributes})
      : super(children: children, label: _label, attributes: [
          TextAttributeComponent(key: 'PartName', value: "/word/document.xml"),
          TextAttributeComponent(
              key: 'ContentType',
              value:
                  "application/vnd.openxmlformats-officedocument.wordprocessingml.document.main+xml"),
          ...attributes
        ]);
}
