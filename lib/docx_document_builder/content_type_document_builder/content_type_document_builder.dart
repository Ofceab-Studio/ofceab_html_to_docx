import 'package:ofceab_docx_builder/components/base_components.dart';
import 'package:xml/xml.dart';

import '../rels_document_builder copy/rels_document_builder.dart';

class ContentTypeDocumentBuilder
    implements IBuildableComponent, IRelationShipBuilder {
  final XmlBuilder builder;
  final WordComponent child;

  ContentTypeDocumentBuilder(this.builder, this.child);

  @override
  void buildDocument() {
    // Build head
    builder.processing(
        'xml', 'version="1.0" encoding="UTF-8" standalone="yes"');
    build(builder);
  }

  @override
  void build(XmlBuilder builder) {
    child.build(builder);
  }

  @override
  void addRelationShip() {
    // TODO: implement addRelationShip
  }

  @override
  String get xmlContent {
    buildDocument();
    return builder.buildDocument().toXmlString();
  }

  @override
  String get fileName => '[Content_Types].xml';
}
