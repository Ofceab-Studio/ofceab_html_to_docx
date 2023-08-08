import 'package:ofceab_docx_builder/components/base_components.dart';
import 'package:xml/xml.dart';

/// Indicate components used for styling run/paragraphs such : w:i, w:sz
class AttributeComponent extends IBuildableComponent
    implements IRenderComponent {
  /// Key : w:sz
  String? key;

  /// Value : 13
  String? value;
  AttributeComponent({required this.label, this.key, this.value});

  @override
  void build(XmlBuilder builder) {
    builder.element(label, nest: () {
      if (key != null && value != null) {
        builder.attribute(key!, value);
      }
    });
  }

  @override
  String label;

  @override
  String? propertiesLabel;
}

/// Indicate components used for styling run/paragraphs such : w:i, w:sz
class TextAttributeComponent extends IBuildableComponent {
  /// Key : w:sz
  String key;

  /// Value : 13
  String value;
  TextAttributeComponent({required this.key, required this.value});

  @override
  void build(XmlBuilder builder) {
    builder.attribute(key, value);
  }
}
