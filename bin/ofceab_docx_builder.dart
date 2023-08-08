import 'package:ofceab_docx_builder/components/body.dart';
import 'package:ofceab_docx_builder/components/document.dart';
import 'package:ofceab_docx_builder/components/paragraph.dart';
import 'package:ofceab_docx_builder/components/run.dart';
import 'package:ofceab_docx_builder/components/attributes.dart';
import 'package:ofceab_docx_builder/components/text.dart';
import 'package:ofceab_docx_builder/docx_document_builder/main_document_builder/main_document_builder.dart';
import 'package:xml/xml.dart';

void main() {
  // test('Create a valid xml document', () {
  final xmlBuilder = XmlBuilder();

  final p = MainDocumentBuilder(
      xmlBuilder,
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

  p.createDocument();

  print(xmlBuilder.buildDocument().toXmlString(pretty: true));
  // });
}
