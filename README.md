Next Previous Web Component
========

This simple Dart Polymer component provides **Next** and **Previous** buttons to allow the user to page through a list. Whenever the buttons are tapped, a corresponding event (_on-next_ or _on-previous_) is fired.

Button enablement is automatically managed by the user supplying attributes for **totalCount** and **currentIndex**. Both default to zero (0). 

The user supplies the contents, which is presented between the buttons, and updates the contents by responding to the _on-next_ and _on-previous_ events.
  
Demonstration code can be exercised by running **example/app.html** in Dartium. This references a demo web component, which in turn references the **next-previous** element.

Usage
-------

This component only supplies navigation buttons. Hence, it will typically be embedded in another web component which supplies the actual contents.

In this example (from **example/app.html**), the user can page through a list of people.

```
    <next-previous id="nextPrev" on-next="{{nextPerson}}" on-previous="{{previousPerson}}" >
      <div id="panel" layout vertical >
        <div><span>Name</span><input value={{person.name}}></div>
        <div><span>Phone</span><input value={{person.phone}}></div>
        <div><span>City</span><input value={{person.address}}></div>
      </div>
    </next-previous> 
```

Notice that _person_ is an object that has properties for _name_, _phone_ and _address_. The navigation events are mapped to the methods **nextPerson()** and **previousPerson()**.

```

  void domReady() {
    super.domReady();
    // set up a list to navigate, and set the current selection
    person = people[0];
    // set the count of navigable items
    nextPreviousElement
        ..currentIndex = 0
        ..totalCount = people.length;
  }

  NextPrevious get nextPreviousElement => ($['nextPrev'] as NextPrevious);

  void nextPerson() {
    person = people[nextPreviousElement.currentIndex];
  }

  void previousPerson() {
    person = people[nextPreviousElement.currentIndex];
  }
  
```

Shortcut keys can be defined for the next/previous actions using the attributes _previousAccessKey_ and _nextAccessKey_. See the example for a demonstration.

Data binding takes care of updating the presentation of the selected person.




