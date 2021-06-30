function string_remove_trailing_zeros(_string){
	if (string_char_at(_string, string_length(_string)) != "0") return _string;
	
	var _return = "";
	for (var i = string_length(_string); i >= 0; --i) {
	    if (string_char_at(_string, string_length(_string)) != "0") break;
	}
	
}