import 'package:ofceab_docx_builder/components/attributes.dart';

import 'base_components.dart';

class DocumentComponent extends WordComponent {
  static const _label = 'w:document';
  DocumentComponent(
      {required List<WordComponent> children,
      List<IBuildableComponent> attributes = const []})
      : super(
            children: children,
            propertiesLabel: null,
            label: _label,
            attributes: [
              TextAttributeComponent(
                  key: 'xmlns',
                  value:
                      'http://schemas.openxmlformats.org/wordprocessingml/2006/main'),
              ...attributes
            ]);
}
