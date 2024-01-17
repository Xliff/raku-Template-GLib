use v6.c;

use NativeCall;

use GLib::Raw::Definitions;

use GLib::Roles::Pointers;

unit package Template::GLib::Raw::Definitions;

constant template is export = 'template-glib-1.0',v0;

class TmplScope           is repr<CPointer> does GLib::Roles::Pointers is export { }
class TmplTemplate        is repr<CPointer> does GLib::Roles::Pointers is export { }
class TmplTemplateLocator is repr<CPointer> does GLib::Roles::Pointers is export { }
