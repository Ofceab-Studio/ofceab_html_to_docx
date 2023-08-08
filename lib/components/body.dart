import 'base_components.dart';

class BodyComponent extends WordComponent {
  static const _label = 'w:body';
  BodyComponent(
      {required List<WordComponent> children,
      required List<IBuildableComponent> attributes})
      : super(
            children: children,
            propertiesLabel: null,
            label: _label,
            attributes: attributes);
}
