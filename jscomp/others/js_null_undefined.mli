(* Copyright (C) 2015-2016 Bloomberg Finance L.P.
 *
 * This program is free software: you can redistribute it and/or modify
 * it under the terms of the GNU Lesser General Public License as published by
 * the Free Software Foundation, either version 3 of the License, or
 * (at your option) any later version.
 *
 * In addition to the permissions granted to you by the LGPL, you may combine
 * or link a "work that uses the Library" with a publicly distributed version
 * of this file to produce a combined library or application, then distribute
 * that combined work under the terms of your choosing, with no requirement
 * to comply with the obligations normally placed on you by section 4 of the
 * LGPL version 3 (or the corresponding section of a later version of the LGPL
 * should you choose to use a later version).
 *
 * This program is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU Lesser General Public License for more details.
 *
 * You should have received a copy of the GNU Lesser General Public License
 * along with this program; if not, write to the Free Software
 * Foundation, Inc., 59 Temple Place - Suite 330, Boston, MA 02111-1307, USA. *)

type + 'a t = 'a Js.null_undefined

external to_opt : 'a t -> 'a option = "#null_undefined_to_opt"

(** constructs a value of the Js.null_undefined type containing the given value *)
external return : 'a -> 'a t = "%identity"

(** returns `true` if given `null` or `undefined`, false otherwise *)
external test : 'a t -> bool =  "#is_nil_undef"

external null : 'a t = "null" [@@bs.val]
external undefined : 'a t = "undefined" [@@bs.val]
external empty : 'a t = "undefined" [@@bs.val]
[@@ocaml.deprecated "Please use `null` or `undefined` instead"]

(** we did not add [bind] yet, since the return value is
    ambiguous and [to_opt] depends on {!Js_primitive}
*)
val bind : 'a t -> ('a -> 'b [@bs]) -> 'b t
val iter : 'a t -> ('a -> unit [@bs]) -> unit
val from_opt : 'a option -> 'a t
