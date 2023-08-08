import 'package:ofceab_docx_builder/components/attributes.dart';
import 'package:ofceab_docx_builder/components/base_components.dart';
import 'package:xml/xml.dart';

class TextComponent extends WordComponent {
  static const _label = 'w:t';
  static const _propertiesLabel = 'w:tPr';
  final String text;
  TextComponent(
      {required this.text, List<TextAttributeComponent> attributes = const []})
      : super(
            children: [],
            propertiesLabel: _propertiesLabel,
            label: _label,
            attributes: [
              TextAttributeComponent(key: 'xml:space', value: 'preserve'),
              ...attributes
            ]);

  @override
  void build(XmlBuilder builder) {
    builder.element('w:t', nest: () {
      for (var attribute in attributes) {
        attribute.build(builder);
      }
      builder.text(text);
    });
  }
}
