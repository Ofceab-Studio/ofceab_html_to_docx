import 'package:ofceab_docx_builder/components/attributes.dart';
import 'package:ofceab_docx_builder/components/base_components.dart';

class ParagraphComponent extends WordComponent {
  static const _label = 'w:p';
  static const _propertiesLabel = 'w:pPr';
  ParagraphComponent(
      {required List<WordComponent> children,
      required List<AttributeComponent> attributes})
      : super(
            children: children,
            propertiesLabel: _propertiesLabel,
            label: _label,
            attributes: attributes);
}
