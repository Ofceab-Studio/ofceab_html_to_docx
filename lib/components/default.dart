import 'package:ofceab_docx_builder/components/base_components.dart';

class DefaultComponent extends WordComponent {
  static const _label = 'Default';
  DefaultComponent(
      {required List<WordComponent> children,
      required List<IBuildableComponent> attributes})
      : super(children: children, label: _label, attributes: attributes);
}
