function string_remove_trailing_zeros(_string){
	if (string_char_at(_string, string_length(_string)) != "0") return _string;
	
	var _float = false;
	for (var i = 0; i < string_length(_string); ++i) {
	    if (string_char_at(_string, i) == ".") {
			_float = true;
			break;
		}
	}
	if not _float return _string;
	
	var _return = _string;
	for (var i = string_length(_string); i >= 0; --i) {
	    if ((string_char_at(_string, i)) != "0") break;
		_return = string_delete(_return, i, 1);
	}
	return _return;
}