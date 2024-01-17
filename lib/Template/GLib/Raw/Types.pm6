use v6;

use GLib::Raw::Exports;
use GIO::Raw::Exports;
use Template::GLib::Raw::Exports;

my constant forced = 350;

unit package GIO::Raw::Types;

need GLib::Raw::Debug;
need GLib::Raw::Definitions;
need GLib::Raw::Enums;
need GLib::Raw::Exceptions;
need GLib::Raw::Object;
need GLib::Raw::Structs;
need GLib::Raw::Struct_Subs;
need GLib::Raw::Subs;
need GLib::Roles::Pointers;
need GLib::Roles::Implementor;
need GIO::Raw::Definitions;
need GIO::Raw::Enums;
need GIO::Raw::Structs;
need GIO::Raw::Subs;
need GIO::Raw::Quarks;
need GIO::DBus::Raw::Types;
need Template::GLib::Raw::Definitions;
need Template::GLib::Raw::Enums;

BEGIN {
  glib-re-export($_) for |@glib-exports, |@gio-exports, |@tg-exports;
}
