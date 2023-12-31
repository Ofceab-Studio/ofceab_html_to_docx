import 'package:ofceab_docx_builder/components/base_components.dart';
import 'package:xml/xml.dart';

class MainDocumentBuilder implements IBuildableComponent, IExportableComponent {
  final XmlBuilder builder;
  final IBuildableComponent child;

  MainDocumentBuilder(this.builder, this.child);

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
  String get xmlContent {
    buildDocument();
    return builder.buildDocument().toXmlString();
  }

  @override
  String get fileName => 'word/document.xml';
}
