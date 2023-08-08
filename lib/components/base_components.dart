import 'package:xml/xml.dart' as xml;

abstract class IBuildableComponent {
  /// Define what should be render on the xml
  /// Each component need to implement that method to render what should be render
  void build(xml.XmlBuilder builder);
}

/// Component that can share they xml content
abstract class IExportableComponent {
  String get xmlContent;
  String get fileName;
  void buildDocument();
}

abstract class IRenderComponent extends IBuildableComponent {
  /// Component label like : w:i, w:br
  String get label;
  String? get propertiesLabel;
}

/// Describe any word component w:p, w;r, w:t ...
class WordComponent implements IRenderComponent {
  @override
  final String label;
  @override
  final String? propertiesLabel;

  /// Get children of the components
  final List<WordComponent> children;
  final List<IBuildableComponent> attributes;

  WordComponent(
      {required this.children,
      this.propertiesLabel,
      required this.label,
      required this.attributes});

  @override
  void build(xml.XmlBuilder builder) {
    builder.element(label, nest: () {
      // Build properties
      _buildProperties(builder);
      // Build children
      _buildChildren(builder);
    });
  }

  void _buildChildren(xml.XmlBuilder builder) {
    for (var child in children) {
      child.build(builder);
    }
  }

  void _buildProperties(xml.XmlBuilder builder) {
    if (attributes.isNotEmpty) {
      if (propertiesLabel != null) {
        builder.element(propertiesLabel!, nest: () {
          for (var attribute in attributes) {
            attribute.build(builder);
          }
        });
      }
      for (var attribute in attributes) {
        attribute.build(builder);
      }
    }
  }
}
