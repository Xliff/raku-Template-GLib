use v6.c;

unit package Template::GLib::Raw::Exports;

our @tg-exports is export;

BEGIN {
  @tg-exports = <
    Template::GLib::Raw::Definitions
    Template::GLib::Raw::Enums
  >;
}
