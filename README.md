SwiftUI UndoManager example

I was struggling with figuring out how "redo" works. The [documentation](https://developer.apple.com/documentation/foundation/undomanager) only mention `registeringUndo()`, but there's no `registerRedo()` !!!. Then I stumble upon this [article](https://nilcoalescing.com/blog/HandlingUndoAndRedoInSwiftUI/). Turns out I need to do another `registeringUndo()` in the handler. How on earth would I know that it works like that APPLE!!!??? It's also not obvious that, in order to do this properly, it's better be done by creating 2 opposite operation functions that calls each other in its undo handler.

The prevent humanity from struggling with this same problem. I create an example project for this.

