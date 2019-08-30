import 'package:html/dom.dart' as dom;

import 'src/html_elements.dart';

typedef CustomTagReplacer = StyledElement Function(
    dom.Element element, List<StyledElement> children);

class CustomElementReplacer {
  Map<String, CustomTagReplacer> _customElements = new Map();

  void addCustomElement(String name, CustomTagReplacer replacer) {
    _customElements[name] = replacer;
  }

  bool shouldProcess(String name) {
    return _customElements.keys.contains(name);
  }

  StyledElement parse(dom.Element element, List<StyledElement> children) {
    final replacer = _customElements[element.localName];
    return replacer(element, children);
  }
}
