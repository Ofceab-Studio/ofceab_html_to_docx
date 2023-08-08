import 'package:ofceab_docx_builder/components/base_components.dart';
import 'package:xml/xml.dart';

import '../rels_document_builder copy/rels_document_builder.dart';

class ContentTypeDocumentBuilder
    implements IBuildableComponent, IRelationShipBuilder {
  final XmlBuilder builder;

  ContentTypeDocumentBuilder(this.builder);

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
  String get fileName => '[Content_Types].xml';
}
