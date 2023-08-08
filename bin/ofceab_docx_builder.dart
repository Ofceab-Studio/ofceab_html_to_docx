import 'package:ofceab_docx_builder/components/body.dart';
import 'package:ofceab_docx_builder/components/default.dart';
import 'package:ofceab_docx_builder/components/document.dart';
import 'package:ofceab_docx_builder/components/override.dart';
import 'package:ofceab_docx_builder/components/paragraph.dart';
import 'package:ofceab_docx_builder/components/relationships.dart';
import 'package:ofceab_docx_builder/components/run.dart';
import 'package:ofceab_docx_builder/components/attributes.dart';
import 'package:ofceab_docx_builder/components/text.dart';
import 'package:ofceab_docx_builder/components/type.dart';
import 'package:ofceab_docx_builder/docx_compressor/docx_zip_document.dart';
import 'package:ofceab_docx_builder/docx_document_builder/content_type_document_builder/content_type_document_builder.dart';
import 'package:ofceab_docx_builder/docx_document_builder/main_document_builder/main_document_builder.dart';
import 'package:ofceab_docx_builder/docx_document_builder/rels_document_builder%20copy/rels_document_builder.dart';
import 'package:xml/xml.dart';

void main() async {
  // test('Create a valid xml document', () {
  final mainXmlBuilder = XmlBuilder();
  final relsXmlBuilder = XmlBuilder();
  final contentTypeXmlBuilder = XmlBuilder();

  final relsXmlDocument = RelsDocumentBuilder(
      relsXmlBuilder, RelationShipsComponent(children: [], attributes: []));

  final contentTypeDocument = ContentTypeDocumentBuilder(
      contentTypeXmlBuilder,
      TypesComponent(children: [
        DefaultComponent(children: [], attributes: [
          TextAttributeComponent(key: 'Extension', value: "rels"),
          TextAttributeComponent(
              key: 'ContentType',
              value:
                  "application/vnd.openxmlformats-package.relationships+xml"),
        ]),
        DefaultComponent(children: [], attributes: [
          TextAttributeComponent(key: 'Extension', value: "xml"),
          TextAttributeComponent(key: 'ContentType', value: "application/xml"),
        ]),
        OverrideComponent(children: [], attributes: [])
      ], attributes: []));

  final mainDocument = MainDocumentBuilder(
      mainXmlBuilder,
      DocumentComponent(
        children: [
          BodyComponent(children: [
            ParagraphComponent(children: [
              RunComponent(children: [
                TextComponent(text: 'Hello there'),
                TextComponent(text: 'I want to grow up'),
                TextComponent(text: 'Think more do less'),
              ], attributes: [
                AttributeComponent(
                    key: 'w:val', value: 52.toString(), label: 'w:sz'),
                AttributeComponent(label: 'w:b'),
                AttributeComponent(
                    key: 'w:ascii', value: 'Cambria', label: 'w:rFonts')
              ]),
              RunComponent(children: [
                TextComponent(text: 'Hello there'),
                TextComponent(text: 'I want to grow up'),
                TextComponent(text: 'Think more do less'),
              ], attributes: [
                AttributeComponent(
                    key: 'w:val', value: 52.toString(), label: 'w:sz'),
                AttributeComponent(label: 'w:b'),
                AttributeComponent(
                    key: 'w:ascii', value: 'Cambria', label: 'w:rFonts')
              ]),
              RunComponent(children: [
                TextComponent(text: 'Hello there'),
                TextComponent(text: 'I want to grow up'),
                TextComponent(text: 'Think more do less'),
              ], attributes: [
                AttributeComponent(
                    key: 'w:val', value: 52.toString(), label: 'w:sz'),
                AttributeComponent(label: 'w:b'),
                AttributeComponent(
                    key: 'w:ascii', value: 'Cambria', label: 'w:rFonts')
              ])
            ], attributes: [])
          ], attributes: [])
        ],
      ));

  final docxCompressor = DocxCompressor(
      contentTypeDocument: contentTypeDocument,
      mainDocument: mainDocument,
      relsDocument: relsXmlDocument);
  await docxCompressor.compressToDocxFile('newdocx.docx');
}
