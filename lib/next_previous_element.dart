import 'package:polymer/polymer.dart';
import 'package:core_elements/core_icon_button.dart';
import 'dart:html';
import 'dart:async';

/**
 * A Polymer next-previous element which supplies buttons to page through a list of items.
 */
@CustomTag('next-previous')
class NextPrevious extends PolymerElement {

  /*
   * The number of items that can be displayed
   */
  int _totalCount = 0;

  /*
   * The index of the currently displayed item
   */
  int _currentIndex = 0;

  /*
   * Text for tooltip, such as '1 of 3'
   */
  @published String countTooltip = '';

  /*
   * If true, the "previous" button should be disabled
   */
  @published bool previousDisabled = false;

  /*
   * If true, the "next" button should be disabled
   */
  @published bool nextDisabled = false;

  /*
   * Define a keyboard shortcut for the "previous" button. It is triggered as defined by the browser. See http://www.w3schools.com/tags/att_global_accesskey.asp.
   */
  @published String previousAccessKey = '';

  /*
   * Define a keyboard shortcut for the "next" button. It is triggered as defined by the browser. See http://www.w3schools.com/tags/att_global_accesskey.asp.
   */
  @published String nextAccessKey = '';
  

  NextPrevious.created() : super.created() {
  }

  @published int get currentIndex => _currentIndex;
  void set currentIndex(int currentIndex) {
    _currentIndex = currentIndex;
    updateButtons();
  }

  @published int get totalCount => _totalCount;
  void set totalCount(int totalCount) {
    _totalCount = totalCount;
    updateButtons();
  }

  void next(Event e, var details, Node target) {
    currentIndex++;
    this.fire('next', detail: {
      'currentIndex': currentIndex,
      'totalCount': totalCount
    });
    updateButtons();
  }

  void updateButtons() {
    previousDisabled = currentIndex == 0;
    nextDisabled = currentIndex >= (totalCount - 1);
    countTooltip = '${currentIndex + 1} of ${totalCount}';
  }

  DivElement get content => $["content"] as DivElement;
  CoreIconButton get nextButton => $["rightArrow"] as CoreIconButton;
  CoreIconButton get previousButton => $["leftArrow"] as CoreIconButton;

  void previous(Event e, var details, Node target) {
    currentIndex--;
    this.fire('previous', detail: {
      'currentIndex': currentIndex,
      'totalCount': totalCount
    });
    updateButtons();
  }

  void resize(Event e, var details, Node target) {
    // TODO: add option to control button placement
  }

  void domReady() {
    super.domReady();
    resize(null, null, null);
    updateButtons();
  }

  Stream<CustomEvent> get onNext => NextPrevious._onNext.forTarget(this);

  static const EventStreamProvider<CustomEvent> _onNext = const EventStreamProvider<CustomEvent>('next');

  Stream<CustomEvent> get onPrevious => NextPrevious._onPrevious.forTarget(this);

  static const EventStreamProvider<CustomEvent> _onPrevious = const EventStreamProvider<CustomEvent>('previous');
}
