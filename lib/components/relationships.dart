import 'package:ofceab_docx_builder/components/attributes.dart';
import 'package:ofceab_docx_builder/components/base_components.dart';
import 'package:ofceab_docx_builder/components/relationship.dart';

class RelationShipsComponent extends WordComponent {
  static const _label = 'Relationships';
  RelationShipsComponent(
      {required List<WordComponent> children,
      required List<AttributeComponent> attributes})
      : super(
            children: [
              RelationshipComponent(children: [], attributes: [
                TextAttributeComponent(key: "Id", value: "rId1"),
                TextAttributeComponent(
                    key: "Target", value: "word/document.xml"),
                TextAttributeComponent(
                    key: "Type",
                    value:
                        "http://schemas.openxmlformats.org/officeDocument/2006/relationships/officeDocument"),
              ]),
              ...children
            ],
            label: _label,
            attributes: [
              TextAttributeComponent(
                  key: "xmlns",
                  value:
                      "http://schemas.openxmlformats.org/package/2006/relationships"),
              ...attributes
            ]);
}
