use v6.c;

use Method::Also;

use NativeCall;

use Template::GLib::Raw::Types;
use Template::GLib::Raw::Scope;

use Template::GLib::Symbol;

use GLib::Roles::Object;
use GLib::Roles::Implementor;

# BOXED

class Template::GLib::Scope {
  also does GLib::Roles::Implementor;

  has TmplScope $!ts is implementor;

  submethod BUILD ( :$scope ) {
    $!ts = $scope if $scope;
  }

  method Template::GLib::Raw::Definitions::TmplScope
    is also<TmplScope>
  { $!ts }

  multi method new (TmplScope $scope) {
    $scope ?? self.bless( :$scope ) !! Nil;
  }
  multi method new {
    my $scope = tmpl_scope_new();

    $scope ?? self.bless( :$scope ) !! Nil;
  }

  method new_with_parent (TmplScope() $parent) is also<new-with-parent> {
    my $scope = tmpl_scope_new_with_parent($parent);

    $scope ?? self.bless( :$scope ) !! Nil;
  }

  method dup_string (Str() $name) is also<dup-string> {
    tmpl_scope_dup_string($!ts, $name);
  }

  method get (Str() $name, :$raw = False) {
    propReturnObject(
      tmpl_scope_get($!ts, $name),
      $raw,
      |Template::GLib::Symbol.getTypePair
    );
  }

  proto method list_symbols (|)
    is also<list-symbols>
  { * }

  multi method list_symbols ( :r(:$recursive) = False ) {
    samewith($recursive);
  }
  multi method list_symbols (Int() $recursive, :$raw = False) {
    my gboolean $r = $recursive.so.Int;

    my $ca = tmpl_scope_list_symbols($!ts, $r);
    return $ca if $raw;
    CArrayToArray($ca);
  }

  method peek (Str() $name, :$raw = False) {
    propReturnObject(
      tmpl_scope_peek($!ts, $name),
      $raw,
      |Template::GLib::Symbol.getTypePair
    );
  }

  method ref {
    tmpl_scope_ref($!ts);
    self;
  }

  method require (Str() $namespace, Str() $version) {
    tmpl_scope_require($!ts, $namespace, $version);
  }

  method set (Str() $name, TmplSymbol() $symbol) {
    tmpl_scope_set($!ts, $name, $symbol);
  }

  method set_boolean (Str() $name, Int() $value) is also<set-boolean> {
    my gboolean $v = $value.so.Int;

    tmpl_scope_set_boolean($!ts, $name, $value);
  }

  method set_double (Str() $name, Num() $value) is also<set-double> {
    my gdouble $v = $value;

    tmpl_scope_set_double($!ts, $name, $v);
  }

  method set_null (Str() $name) is also<set-null> {
    tmpl_scope_set_null($!ts, $name);
  }

  multi method set_object (|)
    is also<set-object>
  { * }

  multi method set_object (Str() $name, $_) {
    my $o = do {
      when GLib::Roles::Object { .GObject }
      when .^can('GObject')    { .GObject }
      when GObject             {  $_      }

      default {
        X::GLib::UnknownType.new(
          message => "Do not know how to handle a {
                      .^name } in .set_object()"
        ).throw
      }

    }
    samewith( $name, cast(gpointer, $o) );
  }
  multi method set_object (Str() $name, gpointer $value) {
    tmpl_scope_set_object($!ts, $name, $value);
  }

  method set_resolver (
    TmplScopeResolver() $resolver,
    gpointer            $user_data = gpointer,
                        &destroy   = %DEFAULT-CALLBACKS<GDestroyNotify>
  )
    is also<set-resolver>
  {
    tmpl_scope_set_resolver($!ts, $resolver, $user_data, &destroy);
  }

  method set_string (Str() $name, Str() $value) is also<set-string> {
    tmpl_scope_set_string($!ts, $name, $value);
  }

  proto method set_strv(|)
    is also<set-strv>
  { * }

  multi method set_strv (Str() $name, @v)  {
    samewith( $name, newCArray(Str, @v, :null) );
  }
  multi method set_strv (Str() $name, CArray[Str] $value) {
    tmpl_scope_set_strv($!ts, $name, $value);
  }

  method set_value (Str() $name, GValue() $value) is also<set-value> {
    tmpl_scope_set_value($!ts, $name, $value);
  }

  method set_variant (Str() $name, GVariant() $value) is also<set-variant> {
    tmpl_scope_set_variant($!ts, $name, $value);
  }

  method take (Str() $name, TmplSymbol() $symbol) {
    tmpl_scope_take($!ts, $name, $symbol);
  }

  method unref {
    tmpl_scope_unref($!ts);
  }

}
