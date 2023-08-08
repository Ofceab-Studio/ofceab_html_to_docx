import 'package:ofceab_docx_builder/components/attributes.dart';
import 'package:ofceab_docx_builder/components/base_components.dart';

class RunComponent extends WordComponent {
  static const _label = 'w:r';
  static const _propertiesLabel = 'w:rPr';
  RunComponent(
      {required List<WordComponent> children,
      required List<AttributeComponent> attributes})
      : super(
            children: children,
            propertiesLabel: _propertiesLabel,
            label: _label,
            attributes: attributes);
}
