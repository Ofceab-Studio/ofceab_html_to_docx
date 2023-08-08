import 'package:ofceab_docx_builder/components/base_components.dart';
import 'package:xml/xml.dart';

abstract class IRelationShipBuilder extends IExportableComponent {
  /// Add relation chip
  void addRelationShip();
}

class RelsDocumentBuilder implements IRelationShipBuilder, IBuildableComponent {
  final XmlBuilder builder;

  RelsDocumentBuilder(this.builder);

  void createMainDocument() {
    // Build head
    builder.processing(
        'xml', 'version="1.0" encoding="utf-16" standalone="yes"');
    build(builder);
  }

  @override
  void build(XmlBuilder builder) {}

  @override
  void addRelationShip() {
    // TODO: implement addRelationShip
  }

  @override
  String get xmlContent => builder.buildDocument().toXmlString();

  @override
  String get fileName => '_rels/rels.xml';
}
