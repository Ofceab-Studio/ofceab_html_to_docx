import 'package:xml/xml.dart';

import '../components/attributes.dart';
import '../components/body.dart';
import '../components/document.dart';
import '../components/paragraph.dart';
import '../components/run.dart';
import '../components/text.dart';
import 'main_document_builder/main_document_builder.dart';

class DocxDocumentBuilder {
  build() {
    // test('Create a valid xml document', () {
    final xmlBuilder = XmlBuilder();

    final mainDocument = MainDocumentBuilder(
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
  }
}
